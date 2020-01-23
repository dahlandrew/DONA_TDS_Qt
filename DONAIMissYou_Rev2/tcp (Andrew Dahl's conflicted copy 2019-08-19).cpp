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

    if(!TDS->waitForConnected(3000))
    {
        qDebug() << "Could not Connect to Torque Detection System\n";
        emit failedConnect();
        waitForConnect();
    }
    else
    {
        qDebug() << "Connected to Torque Dection System\n";
        if(STOP == 0){
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
    count++;
    TDS->write("TorqueIt\r\n\r\n\r\n");
    TDS->bytesAvailable();
    TDS->waitForReadyRead(1000);
    while(TDS->bytesAvailable()>0)
    {

        TDS->waitForReadyRead(1000);

        readString = TDS->readAll();

        TDS->bytesAvailable();
    }

    QString str = readString.toLatin1();
    int size = str.length();

    QString bookend = "/";
    QString delimiter = ";";

    int front = str.indexOf(bookend);
    int back = str.indexOf(bookend, 1);

    QString base_str = str.mid(front + 1, back - 1);
    qDebug() << base_str;

    for(int i = 0; i <= 5; i++)
    {
        seg[i] = base_str.indexOf(delimiter);
        data[i] = base_str.left(seg[i]);
        base_str = base_str.mid(seg[i] + 1, size);
    }

    voltage = data[0];
    battery = data[1];
    accel_x = data[2];
    accel_y = data[3];
    accel_z = data[4];
    latt = data[5];
    longit = base_str;

    //voltageList.append(voltage);
    //dataLength = voltageList.size();

    qreal theta = qAtan(accel_y.toDouble()/accel_x.toDouble())*(180/3.14159);
    qreal mag = qCos(1/accel_z.toDouble())*(180/3.14159);

    qDebug() << theta;
    qDebug() << mag;

    QDateTime local(QDateTime::currentDateTime());
    time = local.time().toString();
    //timeList.append(time);

    emit readResults(voltage, count, time, theta, mag);
    /*if (dataLength > 1)
    {
       emit buildFile(voltageList, dataLength, timeList);
    }*/
    TDS->close();
    tcp::openConnect();
}

void tcp::close()
{
    TDS->close();
}

void tcp::stopRecord()
{
    STOP = 1;

    TDS->close();
    //emit buildFile(voltageList, dataLength, time);
    //voltageList.removeAll();
    qDebug() << "stopRecord, entered you have";
}

void tcp::waitForConnect()
{
    forever
    {
        TDS->connectToHost("192.168.4.1", 9001);

        if(!TDS->waitForConnected(3000))
        {
            qDebug() << "Could not Connect to Torque Detection System\n";
            emit failedConnect();
            //waitForConnect();
        }
        else
        {
            qDebug() << "Connected to Torque Dection System\n";
            break;
        }
    }
    tcp::openConnect();
}
