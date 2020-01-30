#ifndef TCP_H
#define TCP_H

#include <QObject>
#include <QDebug>
#include <QList>
#include <QAbstractSocket>
#include <QTcpSocket>
#include <QTextStream>
#include <QIODevice>
#include <QChar>
#include <QLatin1Char>
#include <QLatin1String>
#include <QTextCodec>
#include <QDateTime>
#include <QThread>
#include <QSharedPointer>
#include <QSocketNotifier>
#include <QGuiApplication>
#include <QtMath>

class tcp : public QObject
{
    Q_OBJECT

public:
    QThread notConnect;
    QThread* tcpThread;

    explicit tcp(QObject *parent = nullptr);
    ~tcp();
    Q_INVOKABLE void readSocket();
    Q_INVOKABLE void close();
    void readyRead();
    void waitForConnect();
    void stopRecord();
    void setDelay(int delay);

signals:
    void readResults(QString voltage, QString time);
    void gpsData(QString latt, QString longit);
    void successConnect();
    void failedConnect();
    void check();
    //void buildFile(QStringList voltageList, int dataLength, QStringList timeList);

public slots:
    Q_INVOKABLE void openConnect();

private:
    QTcpSocket *TDS; //torque detection system
//This was moved from above
    QString readString, time, data[6], voltage, battery, accel_x, accel_y, accel_z, latt, longit;
    double aX, aY, aZ, reductRatio, efficiency, torqMult;
    int count = 0, dataLength, STOP = 0,interval = 1000, seg[6];
};

#endif // TCP_H
