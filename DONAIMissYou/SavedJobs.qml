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
    scndBtn.onClicked: handler.viewFile(scndJS.text+".csv")
    thrdBtn.onClicked: handler.viewFile(thrdJS.text+".csv")
    frthBtn.onClicked: handler.viewFile(frthJS.text+".csv")
    ffthBtn.onClicked: handler.viewFile(ffthJS.text+".csv")
    sxthBtn.onClicked: handler.viewFile(sxthJS.text+".csv")
    svnthBtn.onClicked: handler.viewFile(svnthJS.text+".csv")
    eighthBtn.onClicked: handler.viewFile(eighthJS.text+".csv")
    nnthBtn.onClicked: handler.viewFile(nnthJS.text+".csv")
    tnthBtn.onClicked: handler.viewFile(tnthJS.text+".csv")

    Connections {
        target: handler
        onFrstSvdJobSig:
        {
            if(frstJb === "--")
            {
                frstRect.visible = false;
                frstJS.text = frstJb;
            }
            else
            {
                frstRect.visible = true;
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
            }
            bckgndHeight();
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
