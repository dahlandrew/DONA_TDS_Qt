import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Shapes 1.12
import QtCharts 2.3

NewJobForm
{
    //next.onClicked: stackView.replace("NewJob2.qml")
    torqueUnitsButton.onClicked: {
        stackView.push("TorqueUnits.qml")
        handler.storedSettings()
    }
    /*depthUnitsButton.onClicked: {
        stackView.push("DepthUnits.qml")
        handler.storedSettings();
    }*/
    loggingIntButton.onClicked:{
        stackView.push("LoggingInterval.qml")
        handler.storedSettings();
    }
    jobName.onEditingFinished: {
        handler.jobNameSub(jobName.text)
    }
    firstAnchor.onEditingFinished: {
        handler.firstAnchorSub(firstAnchor.text)
    }
    customer.onEditingFinished: {
        handler.customerSub(customer.text)
    }
    outStagesBtn.onClicked: {
        stackView.push("OutputStages.qml")
        handler.storedSettings();
    }
    /*location.onEditingFinished: {
        handler.locationSub(location.text)
    }*/
    tarTor.onEditingFinished: {
        handler.tarTorSub(tarTor.text)
    }

    tarTor.onAccepted: {next.enabled = true}

    /*depthInt.onEditingFinished: {
        handler.tapDepthSub(depthInt.text);
    }*/

    setupDone.onClicked: {
        stackView.replace("Home.qml")
        handler.storedSettings();
    }
    /*singleSpeed.onClicked: {
        driveModelSelect.visible = true;
        driveModelColumn.model = ["RS-5", "RS-6", "RS-7", "RS-12", "RS-16"];
    }
    twoSpeed.onClicked: {
        driveModelSelect.visible = true;
        driveModelColumn.model = ["RT-9", "RT-12", "RT-20", "RT-30", "RT-40", "RT-70"];
    }
    variableSpeed.onClicked: {
        driveModelSelect.visible = true;
        driveModelColumn.model = ["RV-100", "RV-150", "RV-200", "RV-300"];
    }*/
    driveSerialNum.onEditingFinished: {
        handler.serialNumSub(driveSerialNum.text);

    }
    driveSerialNum.onAccepted: {setupDone.enabled = true}
    /*driveModelColumn.onCurrentIndexChanged:{
        handler.driveModelSub(driveModelColumn.model, driveModelColumn.currentIndex);
    }*/

    Connections{
        target: handler
        onTorqueUnitSig:{
            if(trqUnit === 0){
                torqueUnits.text = "ft-lbs";
            }
            if(trqUnit === 1){
                torqueUnits.text = "Nm";
            }
        }
        onStagesSig:{
            outStages.text = stages;
            if(stages <= 0 || stages >= 7)
            {
                outStages.text = "--";
            }
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
}
