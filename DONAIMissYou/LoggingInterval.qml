import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Shapes 1.12
import QtCharts 2.3

LoggingIntervalForm
{
    oneSecButton.onClicked:
    {
        handler.logIntSubmit(oneSec.text)
        oneSecCheck.visible = true;
        fiveSecCheck.visible = false;
        tenSecCheck.visible = false;
        thirtySecCheck.visible = false;
    }
    fiveSecButton.onClicked:
    {
        handler.logIntSubmit(fiveSec.text)
        oneSecCheck.visible = false;
        fiveSecCheck.visible = true;
        tenSecCheck.visible = false;
        thirtySecCheck.visible = false;
    }
    tenSecButton.onClicked:
    {
        handler.logIntSubmit(tenSec.text)
        oneSecCheck.visible = false;
        fiveSecCheck.visible = false;
        tenSecCheck.visible = true;
        thirtySecCheck.visible = false;
    }
    thirtySecButton.onClicked:
    {
        handler.logIntSubmit(thirtySec.text)
        oneSecCheck.visible = false;
        fiveSecCheck.visible = false;
        tenSecCheck.visible = false;
        thirtySecCheck.visible = true;
    }

    Connections{
        target: handler
        onDelaySig:{
            if(delay === 1){
                oneSecCheck.visible = true;
                fiveSecCheck.visible = false;
                tenSecCheck.visible = false;
                thirtySecCheck.visible = false;
            }
            if(delay === 5){
                oneSecCheck.visible = false;
                fiveSecCheck.visible = true;
                tenSecCheck.visible = false;
                thirtySecCheck.visible = false;
            }
            if(delay === 10){
                oneSecCheck.visible = false;
                fiveSecCheck.visible = false;
                tenSecCheck.visible = true;
                thirtySecCheck.visible = false;
            }
            if(delay === 30){
                oneSecCheck.visible = false;
                fiveSecCheck.visible = false;
                tenSecCheck.visible = false;
                thirtySecCheck.visible = true;
            }
        }
    }
}
