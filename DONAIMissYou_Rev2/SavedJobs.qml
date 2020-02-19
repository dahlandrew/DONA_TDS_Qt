import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.3
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0
import QtQuick.Shapes 1.12
import QtCharts 2.3


SavedJobsForm {

    /*
    emit frstSvdJobSig(svdJbsList.at(0));
    emit frstSvdJobSig(svdJbsList.at(1));
    emit frstSvdJobSig(svdJbsList.at(2));
    emit frstSvdJobSig(svdJbsList.at(3));
    emit frstSvdJobSig(svdJbsList.at(4));
    emit frstSvdJobSig(svdJbsList.at(5));
    emit frstSvdJobSig(svdJbsList.at(6));
    emit frstSvdJobSig(svdJbsList.at(7));
    emit frstSvdJobSig(svdJbsList.at(8));
    emit frstSvdJobSig(svdJbsList.at(9));

    void frstSvdJobSig(QString frstJb, QString frstDt);
    void scndSvdJobSig(QString scndJb, QString scndDt);
    void thrdSvdJobSig(QString thrdJb, QString thrdDt);
    void frthSvdJobSig(QString frthJb, QString frthDt);
    void ffthSvdJobSig(QString ffthJb, QString ffthDt);
    void sxthSvdJobSig(QString sxthJb, QString sxthDt);
    void svnthSvdJobSig(QString svnthJb, QString svnthDt);
    void eighthSvdJobSig(QString eighthJb, QString eighthDt);
    void nnthSvdJobSig(QString nnthJb, QString nnthDt);
    void tnthSvdJobSig(QString tnthJb, QString tnthDt);*/

    frstBtn.onClicked:
    {
        centerPop.open();
        //handler.viewFile(frstJS.text+".pdf")

    }
    view.onClicked:{

        handler.viewFile(frstJS.text+".csv")
        centerPop.close();
    }
    send.onClicked: {
        handler.sendFile(frstJS.text+".csv")
        centerPop.close();
    }
    remove.onClicked: {
        handler.remove(frstJS.text+".csv")
        handler.savedJobsCall();
        centerPop.close();
    }
    scndBtn.onClicked: centerPop2.open();
    view2.onClicked:{

        handler.viewFile(scndJS.text+".csv")
        centerPop2.close();
    }
    send2.onClicked: {
        handler.sendFile(scndJS.text+".csv")
        centerPop2.close();
    }
    remove2.onClicked: {
        handler.remove(scndJS.text+".csv")
        handler.savedJobsCall();
        centerPop2.close();
    }
    thrdBtn.onClicked: centerPop3.open();
    view3.onClicked:{

        handler.viewFile(thrdJS.text+".csv")
        centerPop3.close();
    }
    send3.onClicked: {
        handler.sendFile(thrdJS.text+".csv")
        centerPop3.close();
    }
    remove3.onClicked: {
        handler.remove(thrdJS.text+".csv")
        handler.savedJobsCall();
        centerPop3.close();
    }
    frthBtn.onClicked: centerPop4.open();
    view4.onClicked:{

        handler.viewFile(frthJS.text+".csv")
        centerPop4.close();
    }
    send4.onClicked: {
        handler.sendFile(frthJS.text+".csv")
        centerPop4.close();
    }
    remove4.onClicked: {
        handler.remove(frthJS.text+".csv")
        handler.savedJobsCall();
        centerPop4.close();
    }
    ffthBtn.onClicked: centerPop5.open();
    view5.onClicked:{

        handler.viewFile(ffthJS.text+".csv")
        centerPop5.close();
    }
    send5.onClicked: {
        handler.sendFile(ffthJS.text+".csv")
        centerPop5.close();
    }
    remove5.onClicked: {
        handler.remove(ffthJS.text+".csv")
        handler.savedJobsCall();
        centerPop5.close();
    }
    sxthBtn.onClicked: centerPop6.open();
    view6.onClicked:{

        handler.viewFile(sxthJS.text+".csv")
        centerPop6.close();
    }
    send6.onClicked: {
        handler.sendFile(sxthJS.text+".csv")
        centerPop6.close();
    }
    remove6.onClicked: {
        handler.remove(sxthJS.text+".csv")
        handler.savedJobsCall();
        centerPop6.close();
    }
    svnthBtn.onClicked: centerPop7.open();
    view7.onClicked:{

        handler.viewFile(svnthJS.text+".csv")
        centerPop7.close();
    }
    send7.onClicked: {
        handler.sendFile(svnthJS.text+".csv")
        centerPop7.close();
    }
    remove7.onClicked: {
        handler.remove(svnthJS.text+".csv")
        handler.savedJobsCall();
        centerPop7.close();
    }
    eighthBtn.onClicked: centerPop8.open();
    view8.onClicked:{

        handler.viewFile(eighthJS.text+".csv")
        centerPop8.close();
    }
    send8.onClicked: {
        handler.sendFile(eighthJS.text+".csv")
        centerPop8.close();
    }
    remove8.onClicked: {
        handler.remove(eighthJS.text+".csv")
        handler.savedJobsCall();
        centerPop8.close();
    }
    nnthBtn.onClicked: centerPop9.open();
    view9.onClicked:{

        handler.viewFile(nnthJS.text+".csv")
        centerPop9.close();
    }
    send9.onClicked: {
        handler.sendFile(nnthJS.text+".csv")
        centerPop9.close();
    }
    remove9.onClicked: {
        handler.remove(nnthJS.text+".csv")
        handler.savedJobsCall();
        centerPop9.close();
    }
    tnthBtn.onClicked: centerPop10.open();
    view10.onClicked:{

        handler.viewFile(tnthJS.text+".csv")
        centerPop10.close();
    }
    send10.onClicked: {
        handler.sendFile(tnthJS.text+".csv")
        centerPop10.close();
    }
    remove10.onClicked: {
        handler.remove(tnthJS.text+".csv")
        handler.savedJobsCall();
        centerPop10.close();
    }

    Connections {
        target: handler
        onFrstSvdJobSig:
        {
            if(frstJb === "--")
            {
                frstRect.visible = false;
                frstJS.text = frstJb;
                bckgnd1.visible = false;
            }
            else
            {
                frstRect.visible = true;
                bckgnd1.visible = true;
                frstJS.text = frstJb;
                frstDate.text = frstDt;
            }
        }
        onScndSvdJobSig:
        {
            if(scndJb === "--")
            {
                scndRect.visible = false;
                scndJS.text = scndJb;
            }
            else
            {
                scndRect.visible = true;
                scndJS.text = scndJb;
                scndDate.text = scndDt;
                bckgnd1.visible = true;
            }
        }
        onThrdSvdJobSig:
        {
            if(thrdJb === "--")
            {
                thrdRect.visible = false;
                thrdJS.text = thrdJb;
            }
            else
            {
                thrdRect.visible = true;
                thrdJS.text = thrdJb;
                thrdDate.text = thrdDt;
                bckgnd1.visible = true;
            }
        }
        onFrthSvdJobSig:
        {
            if(frthJb === "--")
            {
                frthRect.visible = false;
                frthJS.text = frthJb;
            }
            else
            {
                frthRect.visible = true;
                frthJS.text = frthJb;
                frthDate.text = frthDt;
                bckgnd1.visible = true;
            }
        }
        onFfthSvdJobSig:
        {
            if(ffthJb === "--")
            {
                ffthRect.visible = false;
                ffthJS.text = ffthJb;
            }
            else
            {
                ffthRect.visible = true;
                ffthJS.text = ffthJb;
                ffthDate.text = ffthDt;
                bckgnd1.visible = true;
            }
        }
        onSxthSvdJobSig:
        {
            if(sxthJb === "--")
            {
                sxthRect.visible = false;
                sxthJS.text = sxthJb;
            }
            else
            {
                sxthRect.visible = true;
                sxthJS.text = sxthJb;
                sxthDate.text = sxthDt;
                bckgnd1.visible = true;
            }
        }
        onSvnthSvdJobSig:
        {
            if(svnthJb === "--")
            {
                svnthRect.visible = false;
                svnthJS.text = svnthJb;
            }
            else
            {
                svnthRect.visible = true;
                svnthJS.text = svnthJb;
                svnthDate.text = svnthDt;
                bckgnd1.visible = true;
            }
        }
        onEighthSvdJobSig:
        {
            if(eighthJb === "--")
            {
                eighthRect.visible = false;
                eighthJS.text = eighthJb;
            }
            else
            {
                eighthRect.visible = true;
                eighthJS.text = eighthJb;
                eighthDate.text = eighthDt;
                bckgnd1.visible = true;
            }
        }
        onNnthSvdJobSig:
        {
            if(nnthJb === "--")
            {
                nnthRect.visible = false;
                nnthJS.text = nnthJb;
            }
            else
            {
                nnthRect.visible = true;
                nnthJS.text = nnthJb;
                nnthDate.text = nnthDt;
                bckgnd1.visible = true;
            }
        }
        onTnthSvdJobSig:
        {
            if(tnthJb === "--")
            {
                tnthRect.visible = false;
                tnthJS.text = tnthJb;
            }
            else
            {
                tnthRect.visible = true;
                tnthJS.text = tnthJb;
                tnthDate.text = tnthDt;
                bckgnd1.visible = true;
            }
            bckgndHeight();
        }

        onHomeDisplay:
        {
            batteryAmnt.text = battery + " %";
            if(battery > 0 && battery <= 25)
            {
                batteryInd.source = "qrc:/battery_25.png";
            }
            if(battery > 25 && battery <= 50)
            {
                batteryInd.source = "qrc:/battery_50.png";
            }
            if(battery > 50 && battery <= 75)
            {
                batteryInd.source = "qrc:/battery_75.png";
            }
            if(battery > 75 && battery <= 100)
            {
                batteryInd.source = "qrc:/battery_100.png";
            }
        }
    }

    function bckgndHeight()
    {
        if(scndJS.text === "--" & frstJS.text !== "--")
        {
            bckgnd1.height = 42;
        }
        if(thrdJS.text === "--" & scndJS.text !== "--")
        {
            bckgnd1.height = 83;
        }
        if(frthJS.text === "--" & thrdJS.text !== "--")
        {
            bckgnd1.height = 124;
        }
        if(ffthJS.text === "--" & frthJS.text !== "--")
        {
            bckgnd1.height = 165;
        }
        if(sxthJS.text === "--" & ffthJS.text !== "--")
        {
            bckgnd1.height = 206;
        }
        if(svnthJS.text === "--" & sxthJS.text !== "--")
        {
            bckgnd1.height = 247;
        }
        if(eighthJS.text === "--" & svnthJS.text !== "--")
        {
            bckgnd1.height = 288;
        }
        if(nnthJS.text === "--" & eighthJS.text !== "--")
        {
            bckgnd1.height = 339;
        }
        if(tnthJS.text === "--" & nnthJS.text !== "--")
        {
            bckgnd1.height = 380;
        }
    }
}
