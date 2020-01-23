#ifndef PDFWRITER_H
#define PDFWRITER_H

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
#include <QPrinter>
#endif
#include <QFont>
#include <QDateTime>
#include <QtMath>
#include <QStandardPaths>
#include <QDir>
#include <QSizeF>
#include <QTransform>

class pdfWriter : public QObject
{
    Q_OBJECT

public:

    explicit pdfWriter(QObject *parent = nullptr);
    ~pdfWriter();
    void writePDF(QStringList voltageList, int dataLength, QStringList timeList, QStringList xAngLst, QStringList zAngLst);
    void pdfInputs(QString svdJobName, QStringList anchorList,
                   QString svdCustomer, QString svdLocation, QString svdTarTor,
                   QString svdDriveModel, QString svdSerNum, QString lattitude, QString longitude,
                   QImage graphPing);
    void start();

signals:

public slots:

private:

    //This was moved from above
    QString jobName, customer, location, tarTor, driveModel, serNum, latt, longit;
    QString baseLoc = QStandardPaths::writableLocation(QStandardPaths::AppDataLocation);
    QString baseFolder = QStandardPaths::writableLocation(QStandardPaths::AppDataLocation)+"/SavedJobs";

    QStringList anchors;
    //QString baseLoc = "C:/Users/Andrew Dahl/Documents";
    //QString baseFolder = "C:/Users/Andrew Dahl/Documents/PengoAppJobs";

    QImage graphPlot;
};

#endif // PDFWRITER_H
