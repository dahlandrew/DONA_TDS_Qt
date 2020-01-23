import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Shapes 1.12
import QtCharts 2.3

SettingsForm {
    Connections
    {
        target: handler
        onSetAngle:
        {
            incl.text = orgAng;
        }
        onSetDispPos:
        {
            showPosition.checked = showPos;
        }
        onSetDispDepth:
        {
            showDepth.checked = showDepthBool;
        }
        onSetDispTarTrq:
        {
            showTargetTorque.checked = showTarTor;
        }
        onSetDispTrqTap:
        {
            torqueTap.checked = showTorTap;
        }
        onTorqueUnitSig:{
            if(trqUnit === 0){
                torqueUnits.text = "Ft-Lbs";
            }
            if(trqUnit === 1){
                torqueUnits.text = "Nm";
            }
        }
        onDepthUnitSig:{
            if(dpthUnit === 0){
                depthUnits.text = "Feet";
                depthUnitTnl.text = "Feet";
            }
            if(dpthUnit === 1){
                depthUnits.text = "Meters";
                depthUnitTnl.text = "Meters";
            }
        }
        onDepthIntSig:{
            depthInt.text = depthInteger;
        }
        onSetLanguage:{
            language.text = languageString;
        }
        onDelaySig:{
            if(delay === 1){
                loggingInt.text = "1 Second";
            }
            if(delay === 5){
                loggingInt.text = "5 Seconds";
            }
            if(delay === 10){
                loggingInt.text = "10 Seconds";
            }
            if(delay === 30){
                loggingInt.text = "30 Second";
            }
        }
    }

    /*inclButton.onClicked:
    {
        stackView.push("qrc:/Incl.qml")
        handler.angCheck();
    }
    showPosition.onClicked: {
        handler.displayPosition(showPosition.checked)

    }
    showDepth.onClicked: {
        handler.displayDepth(showDepth.checked)
        torqueTap.checked = false;
    }*/
    showTargetTorque.onClicked: {
        handler.displayTargetTorque(showTargetTorque.checked)
    }
    /*torqueTap.onClicked: {
        handler.displayTorqueTap(torqueTap.checked)
        showDepth.checked = false;
    }*/

    languageButton.onClicked: {
        stackView.push("qrc:/Language.qml")
    }

    emailInput.onEditingFinished: handler.email(emailInput.text)

    torqueUnitsButton.onClicked: stackView.push("qrc:/TorqueUnits.qml")
    //depthUnitsButton.onClicked: stackView.push("qrc:/DepthUnits.qml")
    loggingIntButton.onClicked: stackView.push("qrc:/LoggingInterval.qml")
    /*depthInt.onEditingFinished: {
        handler.tapDepthSub(depthInt.text);
    }
    torTapIntButton.onClicked: {
        stackView.push("qrc:/TorTap.qml")
        handler.storedSettings();
    }*/
}
