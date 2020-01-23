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
    }
}
