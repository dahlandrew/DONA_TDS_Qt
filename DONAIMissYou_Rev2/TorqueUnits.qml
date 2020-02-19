import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Shapes 1.12
import QtCharts 2.3

TorqueUnitsForm {
    imperialButton.onClicked: {
        imperialCheck.visible = true;
        metricCheck.visible = false;
        handler.torqueUnitSubmit(footPounds.text)
    }
    metricButton.onClicked: {
        imperialCheck.visible = false;
        metricCheck.visible = true;
        handler.torqueUnitSubmit(newtonMeters.text)
    }

    Connections{
        target: handler
        onTorqueUnitSig:{
            if(trqUnit === 0){
                imperialCheck.visible = true;
                metricCheck.visible = false;
            }
            if(trqUnit === 1){
                imperialCheck.visible = false;
                metricCheck.visible = true;
            }
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
}
