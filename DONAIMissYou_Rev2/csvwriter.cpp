
#include "csvwriter.h"

csvWriter::csvWriter(QObject *parent) : QObject(parent)
{

}

csvWriter::~csvWriter()
{

}

void csvWriter::writeCSV(QStringList voltageList, int dataLength,
                         QStringList timeList, QStringList xAngLst, QStringList zAngLst)
{
    qDebug() << voltageList;
    QDateTime local(QDateTime::currentDateTime());
    QString date = local.date().toString();

    QDir baseLocCheck(baseFolder);                  //baseFolder = QStandardLocation::WriteableLocation(QStandardLocation::AppDataLocation)+"/SavedJobs

    if(baseLocCheck.exists())                       //Should exists for Android regardless but usually doesn't exist for iOS, nevertheless we check its existence for safety
    {
        saveDest = baseFolder+"/"+jobName+".csv";
    }
    else
    {
        baseLocCheck.mkpath(baseFolder);            //create path if it doesn't exist
        saveDest = baseFolder+"/"+jobName+".csv";
    }

    //QString filename = QStandardPaths::writableLocation(QStandardPaths::DocumentsLocation)+"/"+jobName+".csv";

    qDebug() << saveDest;
    QFile data(saveDest);
    if(data.open(QFile::WriteOnly |QFile::Truncate))
    {
        QTextStream output(&data);

        output << "Dinamic Oil TD System\n"
               << "Record Name: \t" << jobName << "\n"
               << "Date: \t" << date << "\n"
               << "Serial Number: \t" << serNum << "\n"
               << "Output Ratio: \t" << ratio << "\n"
               << "Number of Stages: \t" << numStages << "\n"
               << "Maximum Torque ("+ units +"): \t" << tarTor << "\n"
               << "Target Torque (" + units + "): \t" << tarTor << "\n"
               << "\n"
               << "Time\t" << "Output Torque (" + units + ")\n";


        for(int i = 0; i <= dataLength-1; i++)
        {
            output << timeList[i] << "\t" << voltageList[i] << "\n";
        }
        data.close();
    }
}

void csvWriter::csvInputs(QString svdJobName, QString svdCustomer, QString svdLocation, QString svdTarTor,
                          QString svdSerNum, int trqUnit, QString outputRatio, int stages)
{
    jobName = svdJobName;       //this function stores all the one time written things that are used in the header on the first page
    customer = svdCustomer;
    location = svdLocation;
    tarTor = svdTarTor;
    serNum = svdSerNum;
    ratio = outputRatio;
    numStages = QString::number(stages);
    if(trqUnit == 0)
        units = "Ft-lbs";
    if(trqUnit == 1)
        units = "Nm";
}

void csvWriter::start()
{

}
