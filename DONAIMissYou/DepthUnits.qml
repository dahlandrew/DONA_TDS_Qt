import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Shapes 1.12
import QtCharts 2.3

DepthUnitsForm {
    imperialButton.onClicked: {
        imperialCheck.visible = true;
        metricCheck.visible = false;
        handler.depthUnitSubmit(feet.text)
    }
    metricButton.onClicked: {
        imperialCheck.visible = false;
        metricCheck.visible = true;
        handler.depthUnitSubmit(meters.text)
    }

    Connections{
        target: handler
        onDepthUnitSig:{
            if(dpthUnit === 0){
                imperialCheck.visible = true;
                metricCheck.visible = false;
            }
            if(dpthUnit === 1){
                imperialCheck.visible = false;
                metricCheck.visible = true;
            }
        }
    }

}
