import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Shapes 1.12
import QtCharts 2.3

//driveModelSelect
NewJob2Form {
    setupDone.onClicked: {
        stackView.replace("Home.qml")
        handler.storedSettings();
    }
    singleSpeed.onClicked: {
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
    }
    driveSerialNum.onEditingFinished: {
        handler.serialNumSub(driveSerialNum.text);

    }
    driveSerialNum.onAccepted: {setupDone.enabled = true}
    driveModelColumn.onCurrentIndexChanged:{
        handler.driveModelSub(driveModelColumn.model, driveModelColumn.currentIndex);
    }
}
