/*
 * Written by Andrew Dahl, Mechatronics Engineer at Bravo Team 2019
 *
 * as of now pdf has to be created two different ways that are dependent on platform:
 * Android can use QPrinter which is easy to use and auto generates new pages and is thorougly tested
 * iOS has to use QPdfWriter, QPainter and QTextDocument, this is lower level so scaling has to be accounted for
 * and new pages need to be created when QTextDocument goes over the height of a letter document
 * iOS still needs some love on new pages
 */

#include "pdfwriter.h"

pdfWriter::pdfWriter(QObject *parent) : QObject(parent)
{

}

pdfWriter::~pdfWriter()
{

}

void pdfWriter::start()
{

}

void pdfWriter::writePDF(QStringList voltageList, int dataLength, QStringList timeList, QStringList xAngLst, QStringList zAngLst)
{

#ifdef Q_OS_IOS

    QList<QStringList> torqList, recordList, horzList, vertList;
    int pages = qCeil((dataLength+1)/28);

    QString filename = "/"+jobName+".pdf";

    QDir baseLocCheck(baseFolder);

    if(baseLocCheck.exists())       //appdatalocation needs to be created on iOS first, afterwards it'll be there but it needs this the first time
    {
        QString saveDest = baseFolder+filename;
    }
    else
    {
        baseLocCheck.mkpath(baseFolder);        //command for making a new path
        QString saveDest = baseFolder+filename;
    }

    QString saveDest = baseFolder+filename;             //set destination to appdatalocation + filename
    QPdfWriter writer(saveDest);
    writer.setPageSize(QPageSize(QPageSize::Letter));   //Letter is the american size of 8.5x11

    QPainter painter(&writer);                          //painter needs reference to pdfwriter

    //painter.drawRect(0, 0, 8.5*72, 11*72);            //this is an idea not permanent to use rectangle height to tell if you need new page
    //72 points per inch

    QTransform t;
    float scaler = writer.logicalDpiX()/72; //QPdfwriter does not auto scale so QTransform must be used to scale to size of writer logicalDpiX is dots per inch in the X needs to be same as writer
    t.scale(scaler, scaler);                //scale
    painter.setTransform(t);
#endif

    qDebug() << "writing...";
    QDateTime local(QDateTime::currentDateTime());
    QString date = local.date().toString();  //gets date of pdf birth

    //QImage image ("C:/Users/Bravo-Kevin/Documents/pdfCreationTest/PENGO-logo");
#ifdef Q_OS_IOS
    qDebug() << writer.logicalDpiY();

    QSizeF size;                        //point stylew sizing
    size.setWidth(writer.logicalDpiY()/2);
    /*size.setHeight(writer.logicalDpiX());*/

    QTextDocument *doc = new QTextDocument(&writer); //QTextDocument is used to create a document to be painted/printed onto pdf
    doc->setDocumentMargin(1);
    doc->setPageSize(size);     //doc has reference to writer size, scales accordingly
#endif
#ifdef Q_OS_ANDROID
    QTextDocument *doc = new QTextDocument;  //QTextDocument is used to create a document to be painted/printed onto pdf
    doc->setDocumentMargin(1);
#endif
    QTextCursor cursor(doc);                                //this is the main cursor of the document , tables may have their own cursors but this cursor inserts the table

    cursor.movePosition(QTextCursor::Start);

    QTextTableFormat tableFormat;                           //summary table and data table

    tableFormat.setBorderBrush(QColor("#000000"));          //#000000 = black
    tableFormat.setCellPadding(5);
    tableFormat.setCellSpacing(0);
    tableFormat.setWidth(doc->size().width());

    QTextTableFormat headTableForm;                         //used to list job name, etc. This info is in a table now because scaling acts weirdly when you have tables and plain text

    headTableForm.setBorderBrush(QColor("#000000"));
    headTableForm.setCellPadding(5);
    headTableForm.setCellSpacing(0);
    headTableForm.setWidth(doc->size().width()/3);

    QTextImageFormat pictureFormat;
    pictureFormat.setName("qrc:/pengologo.png");

    QTextImageFormat graphFormat;
    graphFormat.setName(QStandardPaths::writableLocation(QStandardPaths::AppDataLocation) + "/img" + "/" + jobName + "plot.png");

    QTextBlockFormat centerFormat;                      //used to center images // blocks are used for formatting, justification, and spacing
    centerFormat.setAlignment(Qt::AlignHCenter);
    cursor.insertBlock(centerFormat);

    cursor.insertImage(pictureFormat);          //insert pengo logo uptop  //insertXXXXX() is used to place things into document

    QTextBlockFormat leftFormat;
    leftFormat.setAlignment(Qt::AlignLeft);
    cursor.insertBlock(leftFormat);

    QTextCharFormat headerText;
    QFont serifFont("Times", 12, QFont::Bold, Qt::AlignLeft);
    headerText.setFont(serifFont);

    QTextCharFormat headerFillFormat;
    QFont fillFont("Times", 12, Qt::AlignLeft);
    headerFillFormat.setFont(fillFont);

    QTextCharFormat tableHeaderText;
    QFont headFont("Times", 12, QFont::Bold, Qt::AlignHCenter);
    tableHeaderText.setFont(serifFont);

    QTextCharFormat dataTextFormat;
    QFont baseFont("Times", 12, Qt::AlignHCenter);
    dataTextFormat.setFont(baseFont);

    cursor.insertBlock();

    QTextTable *header = cursor.insertTable(7, 2, headTableForm);       //insertTable(int rows, int columns, tableformat)
    QTextTableCell topHeadCell = header->cellAt(0, 0);                  //puts a cell at (row = 0, column = 0)
    QTextCursor headCurs = topHeadCell.firstCursorPosition();           //each time a new cell is added, this must follow or it will put the new info in the previous cell
    headCurs.insertText("Job Name: ", headerText);

    topHeadCell = header->cellAt(0, 1);
    headCurs = topHeadCell.firstCursorPosition();
    headCurs.insertText(jobName, headerFillFormat);

    topHeadCell = header->cellAt(1, 0);
    headCurs = topHeadCell.firstCursorPosition();
    headCurs.insertText("Date: ", headerText);

    topHeadCell = header->cellAt(1, 1);
    headCurs = topHeadCell.firstCursorPosition();
    headCurs.insertText(date, headerFillFormat);

    topHeadCell = header->cellAt(2, 0);
    headCurs = topHeadCell.firstCursorPosition();
    headCurs.insertText("Location: ", headerText);

    topHeadCell = header->cellAt(2, 1);
    headCurs = topHeadCell.firstCursorPosition();
    headCurs.insertText(location, headerFillFormat);

    topHeadCell = header->cellAt(3, 0);
    headCurs = topHeadCell.firstCursorPosition();
    headCurs.insertText("Lattitude: ", headerText);

    topHeadCell = header->cellAt(3, 1);
    headCurs = topHeadCell.firstCursorPosition();
    headCurs.insertText(latt, headerFillFormat);

    topHeadCell = header->cellAt(4, 0);
    headCurs = topHeadCell.firstCursorPosition();
    headCurs.insertText("Longitude: ", headerText);

    topHeadCell = header->cellAt(4, 1);
    headCurs = topHeadCell.firstCursorPosition();
    headCurs.insertText(longit, headerFillFormat);

    topHeadCell = header->cellAt(5, 0);
    headCurs = topHeadCell.firstCursorPosition();
    headCurs.insertText("Drive Model: ", headerText);

    topHeadCell = header->cellAt(5, 1);
    headCurs = topHeadCell.firstCursorPosition();
    headCurs.insertText(driveModel, headerFillFormat);

    topHeadCell = header->cellAt(6, 0);
    headCurs = topHeadCell.firstCursorPosition();
    headCurs.insertText("Serial Number: ", headerText);

    topHeadCell = header->cellAt(6, 1);
    headCurs = topHeadCell.firstCursorPosition();
    headCurs.insertText(serNum, headerFillFormat);

    cursor.movePosition(QTextCursor::End);                  //each object inserted into documentation needs to be followed by this line, if not there is no certainty that the
                                                            //new object will be placed after the old one
    cursor.insertBlock();   //spacing
    cursor.insertBlock();

    QTextTable *summary = cursor.insertTable(2, 4, tableFormat);            //summary table listed here, gives info based on anchor number
    QTextTableCell sumHeadCell = summary->cellAt(0,0);
    QTextCursor sumHeadCurs = sumHeadCell.firstCursorPosition();
    sumHeadCurs.insertText(QObject::tr("Anchor No."), tableHeaderText);
    sumHeadCell = summary->cellAt(0,1);
    sumHeadCurs = sumHeadCell.firstCursorPosition();
    sumHeadCurs.insertText(QObject::tr("Start Time"), tableHeaderText);
    sumHeadCell = summary->cellAt(0,2);
    sumHeadCurs = sumHeadCell.firstCursorPosition();
    sumHeadCurs.insertText(QObject::tr("Final Torque"), tableHeaderText);
    sumHeadCell = summary->cellAt(0,3);
    sumHeadCurs = sumHeadCell.firstCursorPosition();
    sumHeadCurs.insertText(QObject::tr("Final Depth"), tableHeaderText);
    sumHeadCell = summary->cellAt(1, 0);
    sumHeadCurs = sumHeadCell.firstCursorPosition();
    sumHeadCurs.insertText(anchors.at(0), dataTextFormat);
    sumHeadCell = summary->cellAt(1, 1);
    sumHeadCurs = sumHeadCell.firstCursorPosition();
    sumHeadCurs.insertText(timeList.at(0), dataTextFormat);
    sumHeadCell = summary->cellAt(1, 2);
    sumHeadCurs = sumHeadCell.firstCursorPosition();
    sumHeadCurs.insertText(voltageList.last(), dataTextFormat);
    sumHeadCell = summary->cellAt(1, 3);    //uncomment to have depth on table
    sumHeadCurs = sumHeadCell.firstCursorPosition();
    sumHeadCurs.insertText(QObject::tr("Torque (Nm)"), dataTextFormat);

    cursor.movePosition(QTextCursor::End);                      //each object inserted into documentation needs to be followed by this line, if not there is no certainty that the
                                                                //new object will be placed after the old one

#ifdef Q_OS_IOS

    doc->drawContents(&painter);        //have to paint every page individually in iOS using this method
    doc->clear();                       //need to clear or everything just painted will still be kept
    writer.newPage();                   //have to add new page individually in iOS using this message

#endif

    QTextTableCell timeCell;            //it is completely unecessaru to have multiple cells and cursors for each column but they are here, they work so I will not be changing them
    QTextCursor timeCursor;

    QTextTableCell torqDataCell;
    QTextCursor torqDataCursor;

    QTextTableCell horAngCell;
    QTextCursor horAngCurs;

    QTextTableCell verAngCell;
    QTextCursor verAngCurs;

    cursor.insertBlock();

    QTextTable *table = cursor.insertTable(dataLength, 4, tableFormat);         //data table should have as many rows as length of data list, this will need to change in iOS
    /*QTextTableCell headerCell = table->cellAt(0, 0);                          //iOS should only have 28 rows, will need to be address when adding new pages
    QTextCursor headerCellCursor = headerCell.firstCursorPosition();*/
    timeCell = table->cellAt(0,0);
    timeCursor = timeCell.firstCursorPosition();
    timeCursor.insertText(QObject::tr("Time"), tableHeaderText);
    torqDataCell = table->cellAt(0, 1);
    torqDataCursor = torqDataCell.firstCursorPosition();
    torqDataCursor.insertText(QObject::tr("Torque (Nm)"), tableHeaderText);         //The unit value of this string needs to be able to be change based on user input
    horAngCell = table->cellAt(0, 2);
    horAngCurs = horAngCell.firstCursorPosition();
    horAngCurs.insertText(QObject::tr("Horizontal Angle (deg)"), tableHeaderText);
    verAngCell = table->cellAt(0, 3);
    verAngCurs = verAngCell.firstCursorPosition();
    verAngCurs.insertText(QObject::tr("Vertical Angle (deg)"), tableHeaderText);

#ifdef Q_OS_IOS
    for(int j = 0; j <= pages; j++)     //This is example code for splitting a long list into lists of 28 for 28 iOS rows, may not be necessary but could be useful for iOS
    {
        torqList.append(voltageList.mid(j*28, 28));
        recordList.append(timeList.mid(j*28, 28));
        horzList.append(xAngLst.mid(j*28, 28));
        vertList.append(zAngLst.mid(j*28, 28));
    }
#endif

    for(int i = 1; i<=dataLength-1; i++)        //prints out datalength amount of rows populating the corresponding data at that location in the list
    {
        timeCell = table->cellAt(i,0);
        timeCursor = timeCell.firstCursorPosition();
        timeCursor.insertText(timeList.at(i), dataTextFormat);
        torqDataCell = table->cellAt(i,1);
        torqDataCursor = torqDataCell.firstCursorPosition();
        torqDataCursor.insertText(voltageList.at(i), dataTextFormat);
        horAngCell = table->cellAt(i,2);
        horAngCurs = horAngCell.firstCursorPosition();
        horAngCurs.insertText(xAngLst.at(i), dataTextFormat);
        verAngCell = table->cellAt(i,3);
        verAngCurs = verAngCell.firstCursorPosition();
        verAngCurs.insertText(zAngLst.at(i), dataTextFormat);
    }

    cursor.movePosition(QTextCursor::End);

    cursor.insertBlock();

    cursor.insertBlock(centerFormat);
    cursor.insertImage(graphFormat);

    cursor.insertBlock();

#ifdef Q_OS_ANDROID
    QPrinter printer(QPrinter::HighResolution);     //QPrinter is wonderful and iOS should get its crap together so you can use it but you can't because Steve Jobs set out to screw everyone over
    printer.setPageSize(QPrinter::Letter);
    printer.setOutputFormat(QPrinter::PdfFormat);
    printer.setDocName("/"+jobName+".pdf");         //MAKE SURE TO ADD "/" BEFORE!!!

    QDir baseLocCheck(baseFolder);                  //baseFolder = QStandardLocation::WriteableLocation(QStandardLocation::AppDataLocation)+"/SavedJobs

    if(baseLocCheck.exists())                       //Should exists for Android regardless but usually doesn't exist for iOS, nevertheless we check its existence for safety
    {
        QString saveDest = baseFolder+printer.docName();
    }
    else
    {
        baseLocCheck.mkpath(baseFolder);            //create path if it doesn't exist
        QString saveDest = baseFolder+printer.docName();
    }

    QString saveDest = baseFolder+printer.docName();
    qDebug() << baseLocCheck.exists();
    qDebug() << saveDest;

    printer.setOutputFileName(saveDest);
    doc->print(&printer);
#endif

#ifdef Q_OS_IOS
    //printer.setDocName("/"+jobName+".pdf");

    doc->drawContents(&painter);
#endif
}

void pdfWriter::pdfInputs(QString svdJobName, QStringList anchorList,
                          QString svdCustomer, QString svdLocation, QString svdTarTor,
                          QString svdDriveModel, QString svdSerNum, QString lattitude, QString longitude, QImage graphPing)
{
    jobName = svdJobName;       //this function stores all the one time written things that are used in the header on the first page
    anchors = anchorList;
    customer = svdCustomer;
    location = svdLocation;
    tarTor = svdTarTor;
    driveModel = svdDriveModel;
    serNum = svdSerNum;
    latt = lattitude;
    longit = longitude;
    graphPlot = graphPing;

}
