import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Shapes 1.12
import QtCharts 2.3
import QtQuick.Extras 1.4

Item {
    id: element
    width: 400
    height: 520
    property alias setupDone: setupDone
    property alias singleSpeed: singleSpeed
    property alias twoSpeed: twoSpeed
    property alias variableSpeed: variableSpeed
    property alias driveModelSelect: driveModelSelect
    property alias driveSerialNum: driveSerialNum
    property alias driveModelColumn: driveModelColumn
    anchors.fill: parent

    Rectangle {
        id: topRightBorder
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.left: topLeftBorder.right
        height: 45
        color: "#FFD81E"
    }

    Rectangle {
        id: topLeftBorder
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.horizontalCenter
        anchors.rightMargin: 25
        height: 75
        color: "#FFD81E"
    }
    Shape {
        id: tri

        ShapePath {
            id: tri_sp
            strokeColor: "#FFD81E"
            strokeWidth: 1
            fillColor: "#FFD81E"
            startX: ((element.width/2)-25); startY: 75
            PathLine { x: (element.width/2)+10; y: 45}
            PathLine { x: ((element.width/2)-25); y: 45 }
            PathLine { x: ((element.width/2)-25); y: 75 }
        }
    }

    RoundButton {
        id: singleSpeed
        anchors.verticalCenter: twoSpeed.verticalCenter
        anchors.right: twoSpeed.left
        anchors.rightMargin: 40
        width: 68
        height: 66
        text: "RS"
        font.pointSize: 10
        Material.background: "#000000"
        contentItem: Text {
            text: singleSpeed.text
            font: singleSpeed.font
            color: "#ffffff"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }

        Label {
            id: singleSpeedLabel
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.bottom
            width: 56
            height: 33
            text: qsTr("Single Speed")
            font.pointSize: 11
            font.family: "Arial"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.WordWrap
            color: "#ffffff"
        }
    }

    RoundButton {
        id: twoSpeed
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: twoSpeedLabel.top
        width: 68
        height: 66
        text: "RT"
        font.pointSize: 10
        Material.background: "#000000"
        contentItem: Text {
            text: twoSpeed.text
            font: twoSpeed.font
            color: "#ffffff"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }
    Label {
        id: twoSpeedLabel
        anchors.horizontalCenter: twoSpeed.horizontalCenter
        anchors.bottom: driveModelLabel.top
        anchors.bottomMargin: 10
        width: 55
        height: 32
        text: qsTr("Two Speed")
        font.pointSize: 11
        font.family: "Arial"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.WordWrap
        color: "#ffffff"
    }

    RoundButton {
        id: variableSpeed
        anchors.left: twoSpeed.right
        anchors.leftMargin: 40
        anchors.verticalCenter: twoSpeed.verticalCenter
        width: 63
        height: 66
        text: "RV"
        font.pointSize: 10
        Material.background: "#000000"
        contentItem: Text {
            text: variableSpeed.text
            font: variableSpeed.font
            color: "#ffffff"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        Label {
            id: variableSpeedLabel
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.bottom
            width: 59
            height: 33
            text: qsTr("Variable Speed")
            font.pointSize: 11
            font.family: "Arial"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.WordWrap
            color: "#ffffff"
        }
    }

    TextField {
        id: driveSerialNum
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: driveSerialNumLabel.bottom
        anchors.topMargin: 5
        width: 294
        height: 43
        anchors.horizontalCenterOffset: 5
        placeholderText: qsTr("--")
        horizontalAlignment: Text.AlignHCenter
        color: "#ffffff"
        Material.theme: "Dark"
    }

    Button {
        id: setupDone
        text: "Done"
        enabled: false
        font.capitalization: Font.Capitalize
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 7
        display: AbstractButton.TextOnly
        Material.background: "#FFD81E"
        Material.theme: "Dark"
    }

    Text {
        id: driveSerialNumLabel
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: driveModelSelect.bottom
        anchors.topMargin: 15
        width: 102
        height: 19
        color: "#FFD81E"
        text: qsTr("Enter Drive Serial Number")
        font.bold: true
        font.pointSize: 12
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
    }

    Text {
        id: driveSeriesLabel
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: twoSpeed.top
        anchors.bottomMargin: 10
        width: 153
        height: 23
        color: "#FFD81E"
        text: qsTr("Select Anchor Drive Series")
        font.bold: true
        font.pointSize: 12
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
    }

    Text {
        id: driveModelLabel
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: driveModelSelect.top
        anchors.bottomMargin: 10
        width: 146
        height: 23
        color: "#FFD81E"
        text: qsTr("Select Anchor Drive Model")
        font.bold: true
        font.pointSize: 12
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
    }

    Tumbler {
        id: driveModelSelect
        anchors.horizontalCenter: element.horizontalCenter
        anchors.verticalCenter: element.verticalCenter
        anchors.verticalCenterOffset: 55
        //anchors.top: driveModelLabel.bottom
        anchors.topMargin: 5
        width: 170
        height: 115

        TumblerColumn {
            id: driveModelColumn
            width: driveModelSelect.width
            model:["RS-5", "RS-6", "RS-7", "RS-12", "RS-16"]
            /*columnForeground: Text {
                id: modelText
                text: driveModelColumn.model.text
                color: "#ffffff"
            }*/
        }

        visible: false
        style: TumblerStyle {
            id: tumblerStyle
            delegate: Item {
                    implicitHeight: (driveModelSelect.height - padding.top - padding.bottom) / tumblerStyle.visibleItemCount

                    /*Text {
                        id: driveModelText
                        font.pointSize: 12
                        text: driveModelColumn.model
                        color: "#f26522"
                        anchors.centerIn: parent
                    }*/
                    Text {
                        id: label
                        text: styleData.value
                        color: styleData.current ? "#FFD81E" : "#ffffff"
                        opacity: 0.4 + Math.max(0, 1 - Math.abs(styleData.displacement)) * 0.6
                        anchors.centerIn: parent
                    }
                }
            background: Rectangle{
                color: "#000000"
            }
            frame: Rectangle{
                color: "#000000"
            }
            /*foreground: Text {
                id: modelText
                text: driveModelColumn.model
                color: "#ffffff"
            }*/
        }
    }
}
