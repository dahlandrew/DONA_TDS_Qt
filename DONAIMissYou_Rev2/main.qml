import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.3
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0
import QtQuick.Shapes 1.12
import QtCharts 2.3

//stackView.currentItem.title

ApplicationWindow {
    id: window
    visible: true
    width: 400
    height: 520
    title: qsTr("Pengo TDS")

    Connections{
        target: handler
        onResetPages:{
            stackView.clear()
            stackView.push("NewJob.qml")
        }
        /*onGrabGraphSig:{
            graph.grabToImage(function(result)
            {
                handler.graphSave(result.image)
            }
            )
        }*/
    }

    StackView {
        id: stackView
        initialItem: "qrc:/Welcome.qml"
        anchors.fill: parent
    }

    header: ToolBar {
        id: toolBar
        contentHeight: toolButton.implicitContentHeight
        contentWidth: window.width
        background: parent.background

        ToolButton {
            id: toolButton
            anchors.topMargin: toolBar.top
            anchors.leftMargin: toolBar.left

            Text {
                text: stackView.depth > 1 ? "\u25C0" : "="
                color: "black"
                font.pixelSize: stackView.depth > 1 ? Qt.application.font.pixelSize * 1.6 : Qt.application.font.pixelSize * 3
                anchors.centerIn: parent
            }

            onClicked: {
                if (stackView.depth > 1)
                {
                    stackView.pop()
                }
                else
                {
                    stackView.push("Menu1.qml")
                    //drawer.open()
                }
                settings.visible = true;
                settingsFill.visible = true;
            }
            visible: {
                if(stackView.currentItem.objectName !== "Welcome") {

                    true
                }
                else {
                    false
                }
            }
        }

        ToolButton {
            id: settings
            focusPolicy: Qt.ClickFocus
            display: AbstractButton.IconOnly
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.rightMargin: 0
            transformOrigin: Item.Right
            icon.source: "qrc:/settingsgear.png"


            /*Text {
                text: "\u2699"
                font.capitalization: Font.AllUppercase
                anchors.verticalCenterOffset: -3
                anchors.horizontalCenterOffset: -2
                color: "black"
                font.pixelSize: Qt.application.font.pixelSize * 1.6
                anchors.centerIn: settings
            }*/
            onClicked: {
                stackView.push("Settings.qml")
                settings.visible = false;
                settingsFill.visible = false;
                handler.storedSettings()
                handler.angCheck()
            }
        }
        ColorOverlay{
            id: settingsFill
            anchors.fill: settings
            source: settings
            color: "#000000"
        }
        /*ToolButton {
            id: svdJbsOpt
            focusPolicy: Qt.ClickFocus
            display: AbstractButton.IconOnly
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.rightMargin: 0
            transformOrigin: Item.Right
            icon.source: "qrc:/threeDot.png"
        }
        ColorOverlay{
            id: svdJbsOptFill
            anchors.fill: svdJbsOpt
            source: svdJbsOpt
            color: "#000000"
        }
        function determineBtn(){
            if(stackView.currentItem.title === "svdJbs")
            {
                svdJbsOpt.visible = true;
                svdJbsOpt.enabled = true;
            }
            else
            {
                svdJbsOpt.visible = false;
                svdJbsOpt.enabled = false;
            }
        }*/
    }

    Drawer {
        id: drawer
        width: window.width * 0.66
        height: window.height

        Column {
            anchors.fill: parent

            ItemDelegate {
                text: qsTr("Menu")
                width: parent.width
                onClicked: {
                    stackView.push("Menu1.qml")
                    drawer.close()
                }
            }
            ItemDelegate {
                text: qsTr("Settings")
                width: parent.width
                onClicked: {
                    stackView.push("Settings.qml")
                    drawer.close()
                    settings.visible = false
                }
            }
            ItemDelegate{
                text: qsTr("New Job")
                width: parent.width
                onClicked: {
                    stackView.replace("Welcome.qml")
                    drawer.close()
                }
            }
        }
    }
}
