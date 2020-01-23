import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Shapes 1.12
import QtCharts 2.3

TorTapForm {

    Connections {
        target: handler

        onDepthUnitSig:{
            if(dpthUnit === 0){
                oneTitle.text = "1 Foot";
                twoTitle.text = "2 Feet";
                threeTitle.text = "3 Feet";
                fourRect.visible = true;
                fiveRect.visible = true;
                bckgnd1.height = 181;
            }
            if(dpthUnit === 1){
                oneTitle.text = "1 Meter";
                twoTitle.text = "2 Meters";
                threeTitle.text = "3 Meters";
                fourRect.visible = false;
                fiveRect.visible = false;
                bckgnd1.height = 109;
            }
        }
        onSetTapInterval: {

        }
    }

}
