#ifndef CSVWRITER_H
#define CSVWRITER_H

#include <QObject>
#include <QtDebug>
#include <QFile>
#include <QPdfWriter>
#include <QPainter>
#include <QImage>
#include <QPoint>
#include <QTextDocument>
#include <QTextCursor>
#include <QTextTable>
#include <QTextTableFormat>
#ifdef Q_OS_ANDROID
//#include <QPrinter>
#endif
#include <QFont>
#include <QDateTime>
#include <QtMath>
#include <QStandardPaths>
#include <QDir>
#include <QSizeF>
#include <QTransform>

class csvWriter : public QObject
{
    Q_OBJECT

public:
    explicit csvWriter(QObject *parent = nullptr);
    ~csvWriter();

    void writeCSV(QStringList voltageList, int dataLength, QStringList timeList, QStringList xAngLst, QStringList zAngLst, QString tMaxStr);
    void csvInputs(QString svdJobName, QString svdCustomer, QString svdLocation, QString svdTarTor,
                   QString svdSerNum, int trqUnit, QString outputRatio, int stages);
    void start();

signals:

public slots:

private:

    //This was moved from above
    QString jobName, customer, location, tarTor, driveModel, serNum, latt, longit;
    QString baseLoc = QStandardPaths::writableLocation(QStandardPaths::AppDataLocation);
    QString baseFolder = QStandardPaths::writableLocation(QStandardPaths::AppDataLocation)+"/SavedJobs";
    QString saveDest, units, ratio, numStages;

    QStringList anchors;
};

#endif // CSVWRITER_H
