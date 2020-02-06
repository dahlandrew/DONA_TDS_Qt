import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Shapes 1.12
import QtCharts 2.3

Item {
    id: element
    width: 400
    height: 520
    property alias oneStageBtn: oneStageBtn
    property alias oneStage: oneStage
    property alias oneStageCheck: oneStageCheck
    property alias twoStage: twoStage
    property alias twoStageBtn: twoStageBtn
    property alias twoStageCheck: twoStageCheck
    property alias threeStage: threeStage
    property alias threeStageBtn: threeStageBtn
    property alias threeStageCheck: threeStageCheck
    property alias fourStage: fourStage
    property alias fourStageBtn: fourStageBtn
    property alias fourStageCheck: fourStageCheck
    property alias fiveStageCheck: fiveStageCheck
    property alias fiveStage: fiveStage
    property alias fiveStageBtn: fiveStageBtn
    property alias sixStageCheck: sixStageCheck
    property alias sixStage: sixStage
    property alias sixStageBtn: sixStageBtn
    property alias batteryInd: batteryInd
    property alias batteryAmnt: batteryAmnt
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

    Rectangle {
        id: bottomRightBorder
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.left: parent.horizontalCenter
        anchors.leftMargin: 25
        height: 75
        color: "#FFD81E"
    }

    Rectangle {
        id: bottomLeftBorder
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: bottomRightBorder.left
        height: 45
        color: "#FFD81E"
    }
    Shape {
        id: invTri

        ShapePath {
            id: invTri_sp
            strokeColor: "#FFD81E"
            strokeWidth: 1
            fillColor: "#FFD81E"
            startX: ((element.width/2)+25); startY: (element.height - 75)
            PathLine { x: (element.width/2)-10; y: (element.height - 45)}
            PathLine { x: ((element.width/2)+25); y: (element.height - 45)}
            PathLine { x: ((element.width/2)+25); y: (element.height - 75)}
        }
    }

    Text {
        id: title
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: topRightBorder.verticalCenter
        text: qsTr("Output Stages")
        font.family: "Arial"
        font.pointSize: 16
        font.italic: true
        font.bold: true
        color: "#000000"
    }

    Image {
        id: batteryInd
        height: 19
        width: 37
        anchors.bottom: topLeftBorder.bottom
        anchors.bottomMargin: 6
        anchors.left: element.left
        anchors.leftMargin: 12
        source: "qrc:/battery_100.png"
    }

    Text {
        id: batteryAmnt
        anchors.left: batteryInd.right
        anchors.leftMargin: 6
        anchors.verticalCenter: batteryInd.verticalCenter
        font.pointSize: 18
        text: qsTr("100 %")
    }

    Rectangle {
        id: bckgnd1
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.top: topLeftBorder.bottom
        anchors.topMargin: 10
        height: 247
        color: "#ffffff"
    }

    Rectangle {
        id: oneStageRect
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: bckgnd1.top
        anchors.topMargin: 1
        anchors.right: bckgnd1.right
        height: 40
        color: "#000000"

        Text {
            id: oneStage
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 5
            text: qsTr("1")
            font.pointSize: 12
            color: "#ffffff"
        }

        Text {
            id: oneStageCheck
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 5
            text: qsTr("\u2713")
            font.pointSize: 12
            visible: false
            color: "#ffffff"
        }
    }
    MouseArea{
        id: oneStageBtn
        anchors.fill: oneStageRect
    }

    Rectangle {
        id: twoStageRect
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: oneStageRect.bottom
        anchors.topMargin: 1
        anchors.right: bckgnd1.right
        height: 40
        color: "#000000"

        Text {
            id: twoStage
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 5
            text: qsTr("2")
            font.pointSize: 12
            color: "#ffffff"
        }

        Text {
            id: twoStageCheck
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 5
            text: qsTr("\u2713")
            font.pointSize: 12
            visible: false
            color: "#ffffff"
        }
    }

    MouseArea {
        id: twoStageBtn
        anchors.fill: twoStageRect
    }
    Rectangle {
        id: threeStageRect
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: twoStageRect.bottom
        anchors.topMargin: 1
        anchors.right: bckgnd1.right
        height: 40
        color: "#000000"

        Text {
            id: threeStage
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 5
            text: qsTr("3")
            font.pointSize: 12
            color: "#ffffff"
        }
        Text {
            id: threeStageCheck
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 5
            text: qsTr("\u2713")
            font.pointSize: 12
            visible: false
            color: "#ffffff"
        }
    }
    MouseArea{
        id: threeStageBtn
        anchors.fill: threeStageRect
    }

    Rectangle {
        id: fourStageRect
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: threeStageRect.bottom
        anchors.topMargin: 1
        anchors.right: bckgnd1.right
        height: 40
        color: "#000000"

        Text {
            id: fourStage
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 5
            text: qsTr("4")
            font.pointSize: 12
            color: "#ffffff"
        }

        Text {
            id: fourStageCheck
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 5
            text: qsTr("\u2713")
            font.pointSize: 12
            visible: false
            color: "#ffffff"
        }
    }

    MouseArea {
        id: fourStageBtn
        anchors.fill: fourStageRect
    }
    Rectangle {
        id: fiveStageRect
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: fourStageRect.bottom
        anchors.topMargin: 1
        anchors.right: bckgnd1.right
        height: 40
        color: "#000000"

        Text {
            id: fiveStage
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 5
            text: qsTr("5")
            font.pointSize: 12
            color: "#ffffff"
        }

        Text {
            id: fiveStageCheck
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 5
            text: qsTr("\u2713")
            font.pointSize: 12
            visible: false
            color: "#ffffff"
        }
    }
    MouseArea{
        id: fiveStageBtn
        anchors.fill: fiveStageRect
    }
    Rectangle {
        id: sixStageRect
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: fiveStageRect.bottom
        anchors.topMargin: 1
        anchors.right: bckgnd1.right
        height: 40
        color: "#000000"

        Text {
            id: sixStage
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 5
            text: qsTr("6")
            font.pointSize: 12
            color: "#ffffff"
        }

        Text {
            id: sixStageCheck
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 5
            text: qsTr("\u2713")
            font.pointSize: 12
            visible: false
            color: "#ffffff"
        }
    }
    MouseArea{
        id: sixStageBtn
        anchors.fill: sixStageRect
    }
}
