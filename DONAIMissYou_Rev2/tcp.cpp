/*
 * Written by Andrew Dahl, Mechatronics Engineer at Bravo Team 2019
 *
 * The tcp class receives incoming sockets from the torque monitoring device
 * The tcp class runs on a separate thread because it is constantly receiving data
 * Keeping this on the main thread would bog down the GUI rendering it useless
 * The tcp class receives a new socket, parses the thread and assigns to a variable based on location in thread, it is then sent to the handler class
 */

#include "tcp.h"
#include "handler.h"
#include <QThread>

tcp::tcp(QObject *parent) : QObject(parent)
{

}

tcp::~tcp()
{

}

void tcp:: openConnect()
{
    TDS = new QTcpSocket();
    TDS->connectToHost("192.168.4.1", 9001);

    if(!TDS->waitForConnected(3000))        //for clarification, connection is not to the the WiFi network, this is socket connection (did I receive a socket?)
    {
        //qDebug() << "Could not Connect to Torque Detection System\n";
        emit failedConnect();           //sends signal to GUI and opens a pop up to let user know they have lost connection
        waitForConnect();               //this function cycles through until new connection is found without reading a blank string, saves time on regaining a connection
    }
    else
    {
        //qDebug() << "Connected to Torque Dection System\n";
        if(STOP == 0){                  //this does nothing
            tcp::readSocket();
        }
        if(STOP ==1){
            TDS->close();
            STOP = 0;
        }
    }
}

void tcp::readSocket()
{
    TDS->write("TorqueIt\r\n\r\n\r\n");     //you must send a message to the server to let it know that you are ready to receive, the message just must be a string
    TDS->bytesAvailable();      //check how many bytes are available in socket
    TDS->waitForReadyRead();
    while(TDS->bytesAvailable()>0)      //without this check there is no certainty you will receive the whole string
    {

        TDS->waitForReadyRead();

        readString = TDS->readAll();        //actually read socket

        TDS->bytesAvailable();          //without this check there is no certainty you will receive the whole string
    }

    QString str = readString.toLatin1();
    int size = str.length();

    QString bookend = "/";              //the string is wrapped in /
    QString delimiter = ";";

    int front = str.indexOf(bookend);
    int back = str.indexOf(bookend, 1);

    QString base_str = str.mid(front + 1, back - 1);

    for(int i = 0; i <= 5; i++)
    {
        seg[i] = base_str.indexOf(delimiter);
        data[i] = base_str.left(seg[i]);
        base_str = base_str.mid(seg[i] + 1, size);
    }

    voltage = data[0];          //string is formatted as /torqVolt;batteryVolt;accel_x;accel_y;accel_z;lattitude;longitude/
    battery = data[1];
    accel_x = data[2];
    accel_y = data[3];
    accel_z = data[4];
    latt = data[5];
    longit = base_str;

    aX = accel_x.toDouble();
    aY = accel_y.toDouble();
    aZ = accel_z.toDouble();

    qreal theta = qRadiansToDegrees(qAtan(aX/(qSqrt(aY*aY + aZ*aZ))));  //x-axis angle
    qreal psi = qRadiansToDegrees(qAtan((qSqrt(aX*aX + aZ*aZ))/aY));    //y-axis angle
    qreal phi = qRadiansToDegrees(qAtan(aZ/(qSqrt(aY*aY + aX*aX))));    //z-axis angle

    //qDebug() << theta;
    //qDebug() << psi;
    //qDebug() << phi;

    QDateTime local(QDateTime::currentDateTime());      //gets time when each socket is received
    time = local.time().toString();
    //timeList.append(time);

    emit readResults(voltage, time);        //send changing values to handler
    emit gpsData(latt, longit);                                     //send gps data, i split them up originally because I read somewhere that you can only send 6 variables in a signal
    /*if (dataLength > 1)                                           //This is true when sending between qml and c++ (i would send one variable at a time bt the two) have not found limit c++ --> c++
    {
       emit buildFile(voltageList, dataLength, timeList);
    }*/
    TDS->close();                                               //each socket needs to be closed (whether connected succesfully or not or you will see some trippy stuff brother
    //QObject().thread()->msleep(1000);
    tcp::openConnect();                         //start the cycle again baby
}

void tcp::close()
{
    TDS->close();               //a close function for those who want to close a socket
}

void tcp::stopRecord()          //this function does nothing
{
    STOP = 1;

    TDS->close();
    //emit buildFile(voltageList, dataLength, time);
    //voltageList.removeAll();
    //qDebug() << "stopRecord, entered you have";
}

void tcp::setDelay(int delay)       //this delay function was initially used to put this thread to sleep
{                                   //this was a stupid idea because you only get a socket at that interval which can't separate the refresh and sampling rate
    interval = delay*1000;          //it is still here but the timer class now deals with what it assisted in
}

void tcp::waitForConnect()          //this function keeps trying to connect to a new socket over and over again
{
    forever
    {
        TDS->connectToHost("192.168.4.1", 9001);

        if(!TDS->waitForConnected(3000))
        {
            emit failedConnect();
            //waitForConnect();
        }
        else
        {
            break;                  //once a connection is established, it breaks the loops and goes to tcp::openConnect()
        }
    }
    TDS->close();
    tcp::openConnect();
}
