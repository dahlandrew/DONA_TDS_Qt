#ifndef HANDLER_H
#define HANDLER_H

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
#include <QPdfWriter>
#include <QThread>
#include <QSharedPointer>
#include <QSqlTableModel>
#include <QtMath>
#include <QtConcurrent>
#include <QObject>
#include <QTextStream>
#include <QBuffer>
#include <QFile>
#include <QTextCodec>
#include <QStandardPaths>
#include <QProcess>
#include <QDir>
#include <QDesktopServices>
#include <QUrl>
#ifdef Q_OS_ANDROID
#include <QtAndroidExtras>
#include <QtAndroid>
#include <QAndroidActivityResultReceiver>
//#include <QPrinter>
#endif
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
#include <QFont>
#include <QDateTime>
#include <QFileInfo>

#include "tcp.h"
//#include "pdfwriter.h"
#include "csvwriter.h"
#include "timer.h"
#include "cpp/shareutils.hpp"     //uncomment when you get to sharing properties and bull crap

class handler : public QObject
{
    Q_OBJECT

public:

    explicit handler(QObject *parent = nullptr);
    ~handler();
    void quitThread();
    Q_INVOKABLE void transStart();
    Q_INVOKABLE void voltageReceive(QString voltage, int count, QString time, qreal theta, qreal psi, qreal phi);
    Q_INVOKABLE void failedConnect();
    Q_INVOKABLE void haltRecord();
    Q_INVOKABLE void torqueUnitSubmit(QString torqueUnitFlg);
    Q_INVOKABLE void depthUnitSubmit(QString depthUnitFlg);
    Q_INVOKABLE void logIntSubmit(QString logIntFlg);
    Q_INVOKABLE void unitCheck(QString unitString);
    Q_INVOKABLE void storedSettings();
    Q_INVOKABLE void startNew();
    Q_INVOKABLE void email(QString emailString);
    Q_INVOKABLE void languageCheck(QString language);
    Q_INVOKABLE void frequencyCheck(QString frequencyString);
    Q_INVOKABLE void tapIntervalCheck(QString tapString);
    Q_INVOKABLE void displayPosition(bool position);
    Q_INVOKABLE void displayDepth(bool depth);
    Q_INVOKABLE void displayTargetTorque(bool targetTorque);
    Q_INVOKABLE void displayTorqueTap(bool torqueTap);
    Q_INVOKABLE void jobNameSub(QString jobName);
    Q_INVOKABLE void firstAnchorSub(QString firstAnchor);
    Q_INVOKABLE void customerSub(QString customer);
    Q_INVOKABLE void locationSub(QString location);
    Q_INVOKABLE void tarTorSub(QString tarTor);
    Q_INVOKABLE void driveModelSub(QStringList driveModel, int modIn);
    Q_INVOKABLE void serialNumSub(QString serialNum);
    Q_INVOKABLE void zeroTorque(QString zeroVoltage);
    Q_INVOKABLE void angleSub(QString angleSet);
    Q_INVOKABLE void angCheck();
    Q_INVOKABLE void storeCrssHght(qreal smHght, qreal scndHght, qreal thrdHght, qreal lgHght);
    Q_INVOKABLE void tapDepthSub(QString storedDepthInt);
    Q_INVOKABLE void savedJobsCall();
    Q_INVOKABLE void addTapDepth();
    //Q_INVOKABLE void grabGraph();
    //Q_INVOKABLE void graphSave(QImage image);
    Q_INVOKABLE void sendFile(QString file);
    Q_INVOKABLE void viewFile(QString file);
    Q_INVOKABLE void remove(QString file);
    Q_INVOKABLE QBrush titleBrush();
    Q_INVOKABLE void storeStages(QString numStages);
    //Q_INVOKABLE void anchorCounter();
    void dataList(QString voltage, int count, QString time, qreal theta, qreal psi, qreal phi);
    void storeGps(QString latt, QString longit);
    void timerSlot(handler *handler);
    void record();

    //QString unitDrop();
    //void setUnitDrop(QString units);

signals:

    void stopThread();
    void storedUnits(int unitDrop);
    void startRecord();
    void stopRecord();
    void waitForConnect();
    void homeDisplay(QString torqueStr, double torqueFlt, QString tMaxStr, QString units);
    void pdfPrint(QSqlTableModel *model);
    void resetPages();
    void setEmail(QString email);
    void setLanguage(QString languageString);
    void setFrequency(int frequency);
    void setTapInterval(int tapInterval);
    void setDispPos(bool showPos);
    void setDispDepth(bool showDepthBool);
    void setDispTarTrq(bool showTarTor);
    void setDispTrqTap(bool showTrqTap);
    void torqueUnitSig(int trqUnit);
    void depthUnitSig(int dpthUnit);
    void delaySig(int delay);
    void jobNameSig(QString svdJobName);
    void outputRatioSig(QString outputRatio);
    void customerSig(QString svdCustomer);
    void locationSig(QString svdLocation);
    void tarTorSig(QString svdTarTor);
    void driveModelSig(QString svdDriveModel);
    void serialNumSig(QString svdSerNum);
    void csvHeadersSig(QString svdJobName, QString svdCustomer, QString svdLocation, QString svdTarTor,
                        QString svdSerNum, int trqUnit, QString outputRatio, int stages);
    void graphUpdate(double voltageNum, int count, int cropTime, double tMin, double tMax, int lcm, int zeroPos);
    void buildFile(QStringList voltageList, int dataLength, QStringList timeList, QStringList xAngLst, QStringList zAngLst);
    void openTCP();
    void setAngle(QString orgAng, QString smAng, QString mdAng, QString lgAng);
    void depthIntSig(QString depthInteger);
    void startTimer(int delay);
    void grabGraphSig();
    void frstSvdJobSig(QString frstJb, QString frstDt);
    void scndSvdJobSig(QString scndJb, QString scndDt);
    void thrdSvdJobSig(QString thrdJb, QString thrdDt);
    void frthSvdJobSig(QString frthJb, QString frthDt);
    void ffthSvdJobSig(QString ffthJb, QString ffthDt);
    void sxthSvdJobSig(QString sxthJb, QString sxthDt);
    void svnthSvdJobSig(QString svnthJb, QString svnthDt);
    void eighthSvdJobSig(QString eighthJb, QString eighthDt);
    void nnthSvdJobSig(QString nnthJb, QString nnthDt);
    void tnthSvdJobSig(QString tnthJb, QString tnthDt);
    void stopTimer();
    void stagesSig(int stages);

public slots:

    void initialize();

private:
    void createCsvThread(handler* handler);
    void createTcpThread(handler* handler);

    //This was moved from above
    bool dotVis, showPos = true, showDepthBool = true, showTarTor = true, showTorTap = false;

    int index, store, trqUnit, dpthUnit, delay, in[2],
        smAngInt, mdAngInt, lgAngInt, currentDepth = 0, tapInterval,
        diff, lcm, lowEnd, zeroPos, cropTime = 0, stages = 0, charLength;

    QString angle[2], smAng, mdAng, lgAng, orgAng = "10\xB0 , 20\xB0 , 30\xB0", svdJobName,
        outputRatio = "0", svdCustomer, svdLocation, svdTarTor,
        svdDriveModel, svdSerNum, torqueStr, lattitude, longitude, depthInteger = "5", languageString = "English",
        xAng, yAng, zAng, dateTime, jb, units, tMaxStr;

    QStringList voltageList, timeList, xAngLst, yAngLst, zAngLst, torqueList;

    QStringList readSvdList, svdJbsList, svdDatesList, anchorList;

    QString svdJbsPath = QStandardPaths::writableLocation(QStandardPaths::AppDataLocation) + "/SavedJobs";

    double subVal = 0, torqueFlt, tMax = 0, tMin = 0;

    qreal dotX, dotY, innerCircle, scndCircle, thrdCircle, outerCircle;

    QImage graphPing;

    //pdfWriter pdfWriter;
    //tcp tcp;

    tcp* TCP = new tcp();
    //pdfWriter* PDFWriter = new pdfWriter();
    csvWriter* csvwriter = new csvWriter();
    timer* timerThread = new timer();
    PlatformShareUtils* mPlatformShareUtils;      //uncomment when you get to sharing properties and bull crap

    static handler* mInstance;


};

#endif // HANDLER_H
