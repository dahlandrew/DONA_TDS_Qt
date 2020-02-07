/*
 * Written by Andrew Dahl, Mechatronics Engineer at Bravo Team 2019
 * The handler class runs on the main thread and deals with storage and thread logistics
 */


#ifdef Q_OS_ANDROID
#include <QtAndroidExtras/QAndroidJniObject>
#include <jni.h>
#endif

#include "handler.h"

#ifdef Q_OS_IOS
#include "cpp/ios/iosshareutils.hpp"
#endif

#ifdef Q_OS_ANDROID
handler *handler::mInstance = NULL;
#endif

handler::handler(QObject *parent) : QObject(parent)
{
#ifdef Q_OS_ANDROID
    mInstance = this;
#endif

#ifdef Q_OS_IOS
    mPlatformShareUtils = new IosShareUtils(this);
#endif
}

handler::~handler()
{
    quitThread();
}

void handler::quitThread()
{
    emit stopThread();
}

void handler::initialize()
{
    //birth of TCP thread so connections can be received w/o locking up other operations
    //Has to be started in main thread
    QtConcurrent::run(this, &handler::createTcpThread, this);
}

void handler::createTcpThread(handler* handler)
{
    //runs continuously
    //This function has all signal-slot connections for tcp thread
    //QObject::connect(TCP, &tcp::check, handler, &handler::conStatus, Qt::QueuedConnection);
    QObject::connect(TCP, &tcp::readResults, handler, &handler::voltageReceive, Qt::QueuedConnection);
    //QObject::connect(TCP, &tcp::readResults, handler, &handler::dataList, Qt::QueuedConnection);
    QObject::connect(TCP, &tcp::failedConnect, handler, &handler::failedConnect, Qt::QueuedConnection);
    QObject::connect(handler, &handler::stopRecord, TCP, &tcp::stopRecord, Qt::QueuedConnection);
    QObject::connect(handler, &handler::delaySig, TCP, &tcp::setDelay, Qt::QueuedConnection);
    QObject::connect(TCP, &tcp::gpsData, handler, &handler::storeGps, Qt::QueuedConnection);
    //QObject::connect(handler, &handler::openTCP, TCP, &tcp::openConnect, Qt::QueuedConnection);

    TCP->openConnect(); //start socket
}

/*void handler::dataList(QString voltage, int count, QString time, qreal theta, qreal psi, qreal phi)
{
    //received from TCP thread
    xAng = QString::number(theta);  //convert string to number
    yAng = QString::number(psi);    //these hold the current angle values
    zAng = QString::number(phi);

    //xAngLst.append(xAng);
    //yAngLst.append(yAng);
    //zAngLst.append(zAng);
    //voltageList.append(voltage);
    //timeList.append(time);
}*/

void handler::storeGps(QString latt, QString longit)
{
    //received from TCP thread
    lattitude = latt;   //these hold the current lattitude and longitude
    longitude = longit;
}

void handler::timerSlot(handler *handler)
{
    //this function has all the connections for the timer thread
    //timer thread is used to notify when to grab current socket and save that current socket
    //timer is set by sampling rate from UI input
    QObject::connect(handler, &handler::startTimer, timerThread, &timer::timerSet);
    QObject::connect(timerThread, &timer::timerNote, handler, &handler::record);
    QObject::connect(handler, &handler::stopTimer, timerThread, &timer::stop);
    emit startTimer(delay);
    handler::record();
}

void handler::record() //called when timer goes off to append data to list
{
    //xAngLst.append(xAng);
    //zAngLst.append(zAng);
    torqueList.append(torqueStr);
    timeList.append(dateTime);
    qDebug() << "done";
}

void handler::transStart()  //called when record button is hit
{
    torqueList.clear();     //data is always added to these lists
    timeList.clear();       //when record is hit,the lists are cleared so only desired data is written to pdf
    //xAngLst.clear();
    //zAngLst.clear();

    QtConcurrent::run(this, &handler::createCsvThread, this); //starts the pdf thread
    QtConcurrent::run(this, &handler::timerSlot, this); //starts the timer thread

}

void handler::createCsvThread(handler *handler)
{
    QObject::connect(handler, &handler::csvHeadersSig, csvwriter, &csvWriter::csvInputs, Qt::QueuedConnection);
    QObject::connect(handler, &handler::buildFile, csvwriter, &csvWriter::writeCSV, Qt::QueuedConnection);
    csvwriter->start();
}

void handler::voltageReceive(QString voltage, QString time, QString battery)
{
    count++;
    //theta is x direction always
    //phi is y direction on crossheirs but z on accel
    /*if(qSqrt((theta*theta) + (phi*phi)) > 30) //if mag of ang is > 30 (max angle on cross-heirs) than you can't see dot
    {
        dotVis = false;                       //ensures dot won't be visible outside of cross-heirs
    }
    if(qFabs(theta) < lgAngInt && qFabs(phi) < lgAngInt) //turns it visible again
    {
        dotVis = true;*/

    /*if(theta > 0 && theta < smAngInt)
        {
           dotX = (1 - ((smAngInt - theta)/smAngInt))*(innerCircle/2) + 200;
           qDebug() << "1";
        }
        else if(theta < 0 && theta > ((-1)*smAngInt))
        {
           dotX = 200 - ((1 - (smAngInt - qFabs(theta))/smAngInt)*(innerCircle/2));
           qDebug() << "2";
        }
        else if(theta > smAngInt && theta < mdAngInt)
        {
           dotX = (1 - ((mdAngInt - theta)/(mdAngInt - smAngInt)))*(scndCircle/2) + 200;
           qDebug() << "3";
        }
        else if(theta < ((-1)*(smAngInt)) && theta > ((-1)*mdAngInt))
        {
           dotX = 200 - ((1 - ((mdAngInt - qFabs(theta))/(mdAngInt - smAngInt)))*(scndCircle/2));
           qDebug() << "4";
        }*/


    //below are some mapping statements to show dot in the correct location depending on range set by user
    /*if(phi > 0 && phi < lgAngInt)
        {
            dotY = (1 - ((lgAngInt - phi)/(lgAngInt)))*(thrdCircle/2) + 366.66666666;
        }
        if(phi < 0 && phi > ((-1)*lgAngInt))
        {
            dotY = 366.666666666 - ((1 - ((lgAngInt - qFabs(phi))/(lgAngInt)))*(thrdCircle/2));
        }
        if(theta > 0 && theta < lgAngInt)
        {
            dotX = 200 - ((1 - ((lgAngInt - theta)/(lgAngInt)))*(thrdCircle/2));
        }
        if(theta < 0 && theta > ((-1)*lgAngInt))
        {
            dotX = (1 - ((lgAngInt - qFabs(theta))/(lgAngInt)))*(thrdCircle/2) + 200;
        }
    }*/

    dateTime = time;

    voltageNum = (voltage.toDouble()/165)*294.3*outputRatio.toDouble()*(qPow(0.975, stages))*1000; //convert voltage sent by cody to torque, it says voltageNum but it is a torque, sorry
    if (trqUnit == 0)
        voltageNum = voltageNum*0.7375621;
    torqueFlt = qFabs(voltageNum) - subVal;

    if(torqueFlt > tMax)
    {
        tMax = torqueFlt;
        if(QString::number(qRound(tMax)).length() > 3)
        {
            tMaxStr = QString::number(qRound(tMax)).insert(QString::number(qRound(tMax)).length() - 3, ",");
        }
        else
        {
            tMaxStr = QString::number(qRound(tMax));
        }
    }

    graphList.append(torqueFlt);
    if(graphList.size() == 31)
        graphList.removeFirst();

    for(int y = 0; y <= graphList.size() - 1; y++)
    {
        if(graphList.indexOf(graphMax) == -1)
        {
            phHigh = 0;
        }
        if(graphList.indexOf(graphMin) == -1)
        {
            phLow = 0;
        }
        if(graphList.at(y) > phHigh)
        {
            graphMax = graphList.at(y);
            phHigh = graphList.at(y);
        }
        if(graphList.at(y) < phLow)
        {
            graphMin = graphList.at(y);
            phLow = graphList.at(y);
        }
    }

    zeroPos = qCeil(6 *(graphMax)/(graphMax - graphMin));

    diff = qCeil(graphMax - graphMin);

    if(diff < 3000)
    {
        lcm = diff;
        lowEnd = 600;
    }
    if(diff > 3000 && diff < 30000)
    {
        lcm = diff;
        lowEnd = 6000;
    }

    if(diff > 30000)
    {
        lcm = diff;
        lowEnd = 60000;
    }

    while(1) {
        if(lcm%lowEnd==0 ) {
            break;
        }
        lcm++;
    }

    if(count > 30)
    {
        cropTime = count - 30;
    }

    torqueStr = QString::number(qRound(torqueFlt));                             //values are stored here to be pulled and added to list when timer goes off. These change with every socket
    charLength = torqueStr.size();

    if(torqueFlt < 0 && torqueFlt > -1000)
        charLength = charLength-1;
    if (charLength > 3)
    {
        torqueStr.insert(charLength - 3, ",");
    }

    double uppCompare = graphMax/(zeroPos - 1);
    double lowCompare = graphMin/(zeroPos - 7);

    if(uppCompare > lowCompare && uppCompare < 1000000)
    {
        compare = uppCompare;
    }
    if(lowCompare > uppCompare && lowCompare < 1000000)
    {
        compare = lowCompare;
    }

    if(lcm < compare)
    {
        while(lcm < compare)
            lcm = lcm + lowEnd;
    }

    if(zeroPos == 1)
    {
        yMax = 0;
        yMin = -lcm;
    }

    if(zeroPos == 2)
    {
        yMax = (lcm/6);
        yMin = -(5*lcm/6);
    }

    if(zeroPos == 3)
    {
        yMax = (lcm/3);
        yMin = -(2*lcm/3);
    }

    if(zeroPos == 4)
    {
        yMax = (lcm/2);
        yMin = -yMax;
    }
    if(zeroPos == 5)
    {
        yMax = (2*lcm/3);
        yMin = -(lcm/3);
    }

    if(zeroPos == 6)
    {
        yMax = (5*lcm/6);
        yMin = -(lcm/6);
    }

    if(zeroPos == 7)
    {
        yMax = lcm;
        yMin = 0;
    }

    if(graphMax > yMax)
    {
        while(graphMax > yMax)
            yMax = yMax + lowEnd;
    }
    if(graphMin < yMin)
    {
        while(graphMin < yMin)
            yMin = yMax - lowEnd;
    }

    emit homeDisplay(torqueStr, torqueFlt, tMaxStr, units, battery);
    emit graphUpdate(torqueFlt, count, cropTime, yMin, yMax, lcm, zeroPos);
}

void handler::failedConnect()
{
    emit waitForConnect();      //notifies user that connection has been lost
    //qDebug() << "your connection no good";
}

void handler::haltRecord()
{
    int dataLength = torqueList.size();
    emit csvHeadersSig( svdJobName, svdCustomer, svdLocation, svdTarTor,
                        svdSerNum, trqUnit, outputRatio, stages);
    emit buildFile(torqueList, dataLength, timeList, xAngLst, zAngLst);
    emit stopTimer();
    //pdfThread.quit();
}

void handler::torqueUnitSubmit(QString torqueUnitFlg)
{
    if(torqueUnitFlg == "ft-lbs")       //stores the units for torqued selected by user: 0 = Ft-Lbs, 1 = Nm
    {
        trqUnit = 0;
        units = "ft-lbs";
    }
    if(torqueUnitFlg == "Nm")
    {
        trqUnit = 1;
        units = "Nm";
    }
    emit torqueUnitSig(trqUnit);
}

void handler::depthUnitSubmit(QString depthUnitFlg)
{
    if(depthUnitFlg == "Feet")          //stores the units for depth selected by user: 0 = Ft, 1 = M
    {
        dpthUnit = 0;
    }
    if(depthUnitFlg == "Meters")
    {
        dpthUnit = 1;
    }
    emit depthUnitSig(dpthUnit);
}

void handler::logIntSubmit(QString logIntFlg)
{
    if(logIntFlg == "1 Second")         //store sampling frequency, used by timer
    {
        delay = 1;
        emit delaySig(delay);
    }
    if(logIntFlg == "5 Seconds")
    {
        delay = 5;
        emit delaySig(delay);
    }
    if(logIntFlg == "10 Seconds")
    {
        delay = 10;
        emit delaySig(delay);
    }
    if(logIntFlg == "30 Seconds")
    {
        delay = 30;
        emit delaySig(delay);
    }
}
void handler::unitCheck(QString unitString)
{

}

void handler::storedSettings()
{
    emit torqueUnitSig(trqUnit);        //this function is called when a page needs the stored settings
    emit depthUnitSig(dpthUnit);
    emit delaySig(delay);
    emit jobNameSig(svdJobName);
    emit outputRatioSig(outputRatio);
    emit tarTorSig(svdTarTor);
    emit driveModelSig(svdDriveModel);
    emit serialNumSig(svdSerNum);
    emit setDispPos(showPos);
    emit setDispTrqTap(showTorTap);
    emit setDispTarTrq(showTarTor);
    emit setDispDepth(showDepthBool);
    emit setLanguage(languageString);
    emit depthIntSig(depthInteger);
    emit setTapInterval(tapInterval);
    emit stagesSig(stages);

}

void handler::graphReset()
{
    emit clearGraph();
    graphList.clear();
    count = 0;
    subVal = torqueFlt;
    tMax = 0;
}

void handler::startNew()
{
    emit resetPages();
}

void handler::email(QString emailString)
{
    QString email = emailString;        //stored email of user, input on settings screen
    emit setEmail(email);
}

void handler::languageCheck(QString language)
{
    languageString = language;          //stores the selected language, right now the only language is dag-gum English boy
}

void handler::frequencyCheck(QString frequencyString) //this function is not actually used..oops..will look into getting rid of it, supposed to be like void handler::logIntSubmit(QString logIntFlg)
{
    int freqSplitter = frequencyString.indexOf(" ");
    int frequency = frequencyString.left(freqSplitter).toInt();
    emit setFrequency(frequency);
}

void handler::tapIntervalCheck(QString tapString)
{
    int tapSplitter = tapString.indexOf(" ");
    tapInterval = tapString.left(tapSplitter).toInt(); //stores the interval that each torque tap adds
    emit setTapInterval(tapInterval);                   //this value is used to add what depth corresponds to a torque on pdf
}

void handler::displayPosition(bool position)
{
    showPos = position;                                 //should the position be shown to the user on the main UI? this stores that selection
    emit setDispPos(showPos);                           //selection from settings page
}

void handler::displayDepth(bool depth)
{
    showDepthBool = depth;                              //show the depth +/- selector, selection from settings page
    emit setDispDepth(showDepthBool);
}

void handler::displayTargetTorque(bool targetTorque)
{
    showTarTor = targetTorque;                          //saves the target torque
    emit setDispTarTrq(showTarTor);                     //target torque is used on the progress bar display on the main UI and it also scales the graphs axis
}

void handler::displayTorqueTap(bool torqueTap)
{
    showTorTap = torqueTap;                             //show torque tap  //torque should only be logged when torque tap is tapped or when timer goes off only one or the other
    emit setDispTrqTap(showTorTap);
}

void handler::jobNameSub(QString jobName)
{
    svdJobName = jobName;                               //saves the current Job name, this is used to name the PDF and images so it can be recalled later with svdJobName.pdf
    emit jobNameSig(svdJobName);
}

void handler::firstAnchorSub(QString firstAnchor)
{
    outputRatio = firstAnchor;                       //I named it first for no apparent reason but it shall stay that way cause it is used elsewhere                  //the anchors are the attachments to the drive, each one has a number that is saved here
    emit outputRatioSig(outputRatio);
}

void handler::customerSub(QString customer)
{
    svdCustomer = customer;                             //saves the name of the customer
}

void handler::locationSub(QString location)
{
    svdLocation = location;                             //saves the location input from user and is writtent to pdf //different from gps data
}

void handler::tarTorSub(QString tarTor)
{
    if(tarTor.length() > 3)
    {
        svdTarTor = tarTor.insert(tarTor.length() - 3, ",");
    }
    else
    {
        svdTarTor = tarTor;
    }
    emit tarTorSig(svdTarTor);
}

void handler::driveModelSub(QStringList driveModel, int modIn)
{
    svdDriveModel = driveModel.at(modIn);               //saves the drive model being used. //this will change the multiplier to get the right torque value
    emit driveModelSig(svdDriveModel);
}

void handler::serialNumSub(QString serialNum)
{
    svdSerNum = serialNum;
    emit serialNumSig(svdSerNum);
}

void handler::zeroTorque(QString zeroVoltage)
{
    /*QString unitDelimiter = " ";
    int loc = zeroVoltage.indexOf(unitDelimiter);
    QString zeroTorq = zeroVoltage.left(loc);
    zeroTorq.remove(charLength - 3, 1);
    subVal = zeroTorq.toDouble() + subVal;*/                    //this stores the current torque so it can be subtracted from new incoming torques this gives a zero baseline (taring)
    subVal = voltageNum;
    qDebug() << subVal;
}

void handler::angleSub(QString angleSet)
{
    orgAng = angleSet;                                  //some string magic happens here to store the angle range desired on the cross-heirs (shows tilt of drive) //set on settings page
    QString delimiter = ", ";                           //used by main ui, settings and Incl
    int size = angleSet.length();

    for(int i = 0; i <= 1; i++)
    {
        in[i] = angleSet.indexOf(delimiter);
        angle[i] = angleSet.left(in[i]);
        angleSet = angleSet.mid(in[i] + 1, size);
    }

    smAng = angle[0].replace(" ", "");
    smAng.chop(1);
    smAngInt = smAng.toInt();
    mdAng = angle[1].replace(" ", "");
    mdAng.chop(1);
    mdAngInt = mdAng.toInt();
    lgAng = angleSet.replace(" ", "");
    lgAng.chop(1);
    lgAngInt = lgAng.toInt();

    emit setAngle(orgAng, smAng, mdAng, lgAng);
}
void handler::angCheck()
{
    emit setAngle(orgAng, smAng, mdAng, lgAng);
}

void handler::storeCrssHght(qreal smHght, qreal scndHght, qreal thrdHght, qreal lgHght)
{
    innerCircle = smHght;                           //stores the pixel heights of each circle in cross-heir graphic //used in mapping on angle to the correct diamter (height)
    scndCircle = scndHght;
    thrdCircle = thrdHght;
    outerCircle = lgHght;
}

void handler::tapDepthSub(QString storedDepthInt)
{
    depthInteger = storedDepthInt;
    qDebug() << depthInteger;
}

void handler::savedJobsCall()
{
    //Below is code to read in a file list
    QDir dirSvdJbs(svdJbsPath);                     //this functions reads the files stored in appdatalocation/savedjobs folder and reads them in so they can be recalled by user on saved jobs page
    dirSvdJbs.setFilter(QDir::Files);
    dirSvdJbs.setSorting(QDir::Time);
    readSvdList = dirSvdJbs.entryList();            //list of files
    int k = readSvdList.size();

    QFileInfo fileInfo;


    for(int l = 0; l <= k-1; l++)
    {
        jb = readSvdList.at(l);
        QString end = ".";
        jb = jb.left(jb.indexOf(end));
        fileInfo.setFile(svdJbsPath + "/" + readSvdList.at(l));
        QDateTime fileDate = fileInfo.lastModified();
        QString date = fileDate.date().toString(Qt::ISODate); //gets data of when it was created
        svdJbsList.append(jb);
        svdDatesList.append(date);
    }

    for(int m = k; m <= 9; m++)
    {
        jb = "--";                                              //if there are less than 10 it puts placeholder text ("--") in so the front end know there is no file
        QString date = "--";
        svdJbsList.append(jb);
        svdDatesList.append(date);
    }

    emit frstSvdJobSig(svdJbsList.at(0), svdDatesList.at(0));       //populates saved jobs page
    emit scndSvdJobSig(svdJbsList.at(1), svdDatesList.at(1));
    emit thrdSvdJobSig(svdJbsList.at(2), svdDatesList.at(2));
    emit frthSvdJobSig(svdJbsList.at(3), svdDatesList.at(3));
    emit ffthSvdJobSig(svdJbsList.at(4), svdDatesList.at(4));
    emit sxthSvdJobSig(svdJbsList.at(5), svdDatesList.at(5));
    emit svnthSvdJobSig(svdJbsList.at(6), svdDatesList.at(6));
    emit eighthSvdJobSig(svdJbsList.at(7), svdDatesList.at(7));
    emit nnthSvdJobSig(svdJbsList.at(8), svdDatesList.at(8));
    emit tnthSvdJobSig(svdJbsList.at(9), svdDatesList.at(9));

}

void handler::addTapDepth()
{
    currentDepth = currentDepth + depthInteger.toInt();             //adds depth when torque tap is hit, depth depends on what user sets
    qDebug() << currentDepth;
}

void handler::storeStages(QString numStages)
{
    stages = numStages.toInt();
    emit stagesSig(stages);

}

/*void handler::grabGraph()
{
    emit grabGraphSig();
}*?

/*void handler::graphSave(QImage image)
{
    QString imgPath = QStandardPaths::writableLocation(QStandardPaths::AppDataLocation).append("/img");  //this functions grabs an image of the final look of the graph
    QDir imgDir(imgPath);                                                                               //the graph is grabs is hidden on the main ui so when stop record is hit it is grabbed
                                                                                                        //cant grab from another page if it is not main focus
    if(!imgDir.exists())                                                                                //saves the graph is a location so the pdfwriter can find it
    {
        imgDir.mkpath(imgPath);
    }

    QString plotPic = "/" + svdJobName + "plot.png";
    graphPing = image;
    qDebug() << "trying to save";
    qDebug() << imgPath+plotPic;
    image.save(imgPath+plotPic);

    int dataLength = torqueList.size();
    emit pdfHeadersSig( svdJobName,  anchorList,
                        svdCustomer,  svdLocation,  svdTarTor,
                        svdDriveModel,  svdSerNum, lattitude, longitude, graphPing);
    emit buildFile(torqueList, dataLength, timeList, xAngLst, zAngLst);
    emit stopTimer();
}*/

#ifdef Q_OS_IOS //below is code to share, send or remove files on iOS, uses shareutils and some C-Obj files '.mm'
void handler::sendFile(QString file)
{
    QString baseStr = QStandardPaths::writableLocation(QStandardPaths::AppDataLocation)+"/SavedJobs";
    QString pdfName = "/"+file;
    QString filePath = baseStr.append(pdfName);
    QString title = "Send File";
    QString mimeType = "application/pdf";
    int requestId = -1;
    bool altImpl = false;

    mPlatformShareUtils->sendFile(filePath, title, mimeType, requestId, altImpl);
}

void handler::viewFile(QString file)
{
    QString baseStr = QStandardPaths::writableLocation(QStandardPaths::AppDataLocation)+"/SavedJobs";
    QString pdfName = "/"+file;
    QString filePath = baseStr.append(pdfName);
    QString title = "Send File";
    QString mimeType = "application/pdf";
    int requestId = 21;
    bool altImpl = false;

    mPlatformShareUtils->viewFile(filePath, title, mimeType, requestId, altImpl);
}

void handler::remove(QString file)
{
    QString baseStr = QStandardPaths::writableLocation(QStandardPaths::AppDataLocation)+"/SavedJobs";
    QString pdfName = "/"+file;
    QString filePath = baseStr.append(pdfName);
    QFile::remove(filePath);
}
#endif

#ifdef Q_OS_ANDROID //below is code to share on Android, this uses a java file QShareUtils listed in other files, the following must be sent so that java can execute properly
void handler::sendFile(QString file)            //filepaths and android manifest must be set up properly
{
    QString baseStr = QStandardPaths::writableLocation(QStandardPaths::AppDataLocation)+"/SavedJobs";
    QString pdfName = "/"+file;
    QString imgName = ":/knife.jpg";
    bool mIsEditMode = false;
    QString filePath = baseStr.append(pdfName);
    QString title = "Send File";
    QString mimeType = "";
    int requestId = 13;
    bool altImpl = false;

    if(!altImpl) {
        QAndroidJniObject jsPath = QAndroidJniObject::fromString(filePath);
        QAndroidJniObject jsTitle = QAndroidJniObject::fromString(title);
        QAndroidJniObject jsMimeType = QAndroidJniObject::fromString(mimeType);
        jboolean ok = QAndroidJniObject::callStaticMethod<jboolean>("org/qtproject/example/tds/QShareUtils",
                                                                    "sendFile",
                                                                    "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Z",
                                                                    jsPath.object<jstring>(), jsTitle.object<jstring>(), jsMimeType.object<jstring>(), requestId);
        if(!ok) {
            qWarning() << "Unable to resolve activity from Java";
            //emit shareNoAppAvailable(requestId);
        }
        return;
    }

    // THE FILE PATH
    // to get a valid Path we must prefix file://
    // attention file must be inside Users Documents folder !
    // trying to send a file from APP DATA will fail
    QAndroidJniObject jniPath = QAndroidJniObject::fromString("file://"+filePath);
    if(!jniPath.isValid()) {
        qWarning() << "QAndroidJniObject jniPath not valid.";
        //emit shareError(requestId, tr("Share: an Error occured\nFilePath not valid"));
        return;
    }
    // next step: convert filePath Java String into Java Uri
    QAndroidJniObject jniUri = QAndroidJniObject::callStaticObjectMethod("android/net/Uri", "parse", "(Ljava/lang/String;)Landroid/net/Uri;", jniPath.object<jstring>());
    if(!jniUri.isValid()) {
        qWarning() << "QAndroidJniObject jniUri not valid.";
        //emit shareError(requestId, tr("Share: an Error occured\nURI not valid"));
        return;
    }

    // THE INTENT ACTION
    // create a Java String for the ACTION
    QAndroidJniObject jniAction = QAndroidJniObject::getStaticObjectField<jstring>("android/content/Intent", "ACTION_SEND");
    if(!jniAction.isValid()) {
        qWarning() << "QAndroidJniObject jniParam not valid.";
        //emit shareError(requestId, tr("Share: an Error occured"));
        return;
    }
    // then create the Intent Object for this Action
    QAndroidJniObject jniIntent("android/content/Intent","(Ljava/lang/String;)V",jniAction.object<jstring>());
    if(!jniIntent.isValid()) {
        qWarning() << "QAndroidJniObject jniIntent not valid.";
        //emit shareError(requestId, tr("Share: an Error occured"));
        return;
    }

    // THE MIME TYPE
    if(mimeType.isEmpty()) {
        qWarning() << "mime type is empty";
        //emit shareError(requestId, tr("Share: an Error occured\nMimeType is empty"));
        return;
    }
    // create a Java String for the File Type (Mime Type)
    QAndroidJniObject jniMimeType = QAndroidJniObject::fromString(mimeType);
    if(!jniMimeType.isValid()) {
        qWarning() << "QAndroidJniObject jniMimeType not valid.";
        //emit shareError(requestId, tr("Share: an Error occured\nMimeType not valid"));
        return;
    }
    // set Type (MimeType)
    QAndroidJniObject jniType = jniIntent.callObjectMethod("setType", "(Ljava/lang/String;)Landroid/content/Intent;", jniMimeType.object<jstring>());
    if(!jniType.isValid()) {
        qWarning() << "QAndroidJniObject jniType not valid.";
        //emit shareError(requestId, tr("Share: an Error occured"));
        return;
    }

    // THE EXTRA STREAM
    // create a Java String for the EXTRA
    QAndroidJniObject jniExtra = QAndroidJniObject::getStaticObjectField<jstring>("android/content/Intent", "EXTRA_STREAM");
    if(!jniExtra.isValid()) {
        qWarning() << "QAndroidJniObject jniExtra not valid.";
        //emit shareError(requestId, tr("Share: an Error occured"));
        return;
    }
    // put Extra (EXTRA_STREAM and URI)
    QAndroidJniObject jniExtraStreamUri = jniIntent.callObjectMethod("putExtra", "(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;", jniExtra.object<jstring>(), jniUri.object<jobject>());
    // QAndroidJniObject jniExtraStreamUri = jniIntent.callObjectMethod("putExtra", "(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;", jniExtra.object<jstring>(), jniExtra.object<jstring>());
    if(!jniExtraStreamUri.isValid()) {
        qWarning() << "QAndroidJniObject jniExtraStreamUri not valid.";
        //emit shareError(requestId, tr("Share: an Error occured"));
        return;
    }

    QAndroidJniObject activity = QtAndroid::androidActivity();
    QAndroidJniObject packageManager = activity.callObjectMethod("getPackageManager",
                                                                 "()Landroid/content/pm/PackageManager;");
    QAndroidJniObject componentName = jniIntent.callObjectMethod("resolveActivity",
                                                                 "(Landroid/content/pm/PackageManager;)Landroid/content/ComponentName;",
                                                                 packageManager.object());
    if (!componentName.isValid()) {
        qWarning() << "Unable to resolve activity";
        //emit shareNoAppAvailable(requestId);
        return;
    }

    if(requestId <= 0) {
        // we dont need a result if there's no requestId
        QtAndroid::startActivity(jniIntent, requestId);
    } else {
        // we have the JNI Object, know the requestId
        // and want the Result back into 'this' handleActivityResult(...)
        // attention: to test JNI with QAndroidActivityResultReceiver you must comment or rename
        // onActivityResult()  method in QShareActivity.java - otherwise you'll get wrong request or result codes
        QtAndroid::startActivity(jniIntent, requestId);
    }

    /*
     * As default we're going the Java - way with one simple JNI call (recommended)
     * if altImpl is true we're going the pure JNI way
     *
     * If a requestId was set we want to get the Activity Result back (recommended)
     * We need the Request Id and Result Id to control our workflow
    */
}

void handler::viewFile(QString file)
{
    QString baseStr = QStandardPaths::writableLocation(QStandardPaths::AppDataLocation)+"/SavedJobs";
    QString pdfName = "/"+file;
    bool mIsEditMode = false;
    QString filePath = baseStr+pdfName;
    QString title = "View File";
    QString mimeType = "";
    int requestId = 24;
    bool altImpl = false;

    if(!altImpl) {
        QAndroidJniObject jsPath = QAndroidJniObject::fromString(filePath);
        QAndroidJniObject jsTitle = QAndroidJniObject::fromString(title);
        QAndroidJniObject jsMimeType = QAndroidJniObject::fromString(mimeType);
        jboolean ok = QAndroidJniObject::callStaticMethod<jboolean>("org/qtproject/example/tds/QShareUtils",
                                                                    "viewFile",
                                                                    "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Z",
                                                                    jsPath.object<jstring>(), jsTitle.object<jstring>(), jsMimeType.object<jstring>(), requestId);
        if(!ok) {
            qWarning() << "Unable to resolve activity from Java";
            //emit shareNoAppAvailable(requestId);
        }
        return;
    }

    // THE FILE PATH
    // to get a valid Path we must prefix file://
    // attention file must be inside Users Documents folder !
    // trying to view or edit a file from APP DATA will fail
    QAndroidJniObject jniPath = QAndroidJniObject::fromString("file://"+filePath);
    if(!jniPath.isValid()) {
        qWarning() << "QAndroidJniObject jniPath not valid.";
        //emit shareError(requestId, tr("Share: an Error occured\nFilePath not valid"));
        return;
    }
    // next step: convert filePath Java String into Java Uri
    QAndroidJniObject jniUri = QAndroidJniObject::callStaticObjectMethod("android/net/Uri", "parse", "(Ljava/lang/String;)Landroid/net/Uri;", jniPath.object<jstring>());
    if(!jniUri.isValid()) {
        qWarning() << "QAndroidJniObject jniUri not valid.";
        //emit shareError(requestId, tr("Share: an Error occured\nURI not valid"));
        return;
    }

    // THE INTENT ACTION
    // create a Java String for the ACTION
    QAndroidJniObject jniParam = QAndroidJniObject::getStaticObjectField<jstring>("android/content/Intent", "ACTION_VIEW");
    if(!jniParam.isValid()) {
        qWarning() << "QAndroidJniObject jniParam not valid.";
        //emit shareError(requestId, tr("Share: an Error occured"));
        return;
    }
    // then create the Intent Object for this Action
    QAndroidJniObject jniIntent("android/content/Intent","(Ljava/lang/String;)V",jniParam.object<jstring>());
    if(!jniIntent.isValid()) {
        qWarning() << "QAndroidJniObject jniIntent not valid.";
        //emit shareError(requestId, tr("Share: an Error occured"));
        return;
    }

    // THE FILE TYPE
    if(mimeType.isEmpty()) {
        qWarning() << "mime type is empty";
        //emit shareError(requestId, tr("Share: an Error occured\nMimeType is empty"));
        return;
    }
    // create a Java String for the File Type (Mime Type)
    QAndroidJniObject jniType = QAndroidJniObject::fromString(mimeType);
    if(!jniType.isValid()) {
        qWarning() << "QAndroidJniObject jniType not valid.";
        //emit shareError(requestId, tr("Share: an Error occured\nMimeType not valid"));
        return;
    }
    // set Data (the URI) and Type (MimeType)
    QAndroidJniObject jniResult = jniIntent.callObjectMethod("setDataAndType", "(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;", jniUri.object<jobject>(), jniType.object<jstring>());
    if(!jniResult.isValid()) {
        qWarning() << "QAndroidJniObject jniResult not valid.";
        //emit shareError(requestId, tr("Share: an Error occured"));
        return;
    }

    QAndroidJniObject activity = QtAndroid::androidActivity();
    QAndroidJniObject packageManager = activity.callObjectMethod("getPackageManager",
                                                                 "()Landroid/content/pm/PackageManager;");
    QAndroidJniObject componentName = jniIntent.callObjectMethod("resolveActivity",
                                                                 "(Landroid/content/pm/PackageManager;)Landroid/content/ComponentName;",
                                                                 packageManager.object());
    if (!componentName.isValid()) {
        qWarning() << "Unable to resolve activity";
        //emit shareNoAppAvailable(requestId);
        return;
    }

    if(requestId <= 0) {
        // we dont need a result if there's no requestId
        QtAndroid::startActivity(jniIntent, requestId);
    } else {
        // we have the JNI Object, know the requestId
        // and want the Result back into 'this' handleActivityResult(...)
        // attention: to test JNI with QAndroidActivityResultReceiver you must comment or rename
        // onActivityResult()  method in QShareActivity.java - otherwise you'll get wrong request or result codes
        QtAndroid::startActivity(jniIntent, requestId);
    }
}

void handler::remove(QString file)
{
    QString baseStr = QStandardPaths::writableLocation(QStandardPaths::AppDataLocation)+"/SavedJobs";
    QString pdfName = "/"+file;
    QString filePath = baseStr.append(pdfName);
    QFile::remove(filePath);
}
#endif
QBrush handler::titleBrush()
{
    return QBrush(Qt::white);
}

