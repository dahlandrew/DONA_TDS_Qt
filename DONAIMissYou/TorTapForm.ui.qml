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
    anchors.fill: parent

    property alias oneBtn: oneBtn
    property alias oneCheck: oneCheck
    property alias oneTitle: oneTitle
    property alias twoBtn: twoBtn
    property alias twoCheck: twoCheck
    property alias twoTitle: twoTitle
    property alias threeBtn: threeBtn
    property alias threeCheck: threeCheck
    property alias threeTitle: threeTitle
    property alias fourBtn: fourBtn
    property alias fourCheck: fourCheck
    property alias fourTitle: fourTitle
    property alias fourRect: fourRect
    property alias fiveBtn: fiveBtn
    property alias fiveCheck: fiveCheck
    property alias fiveTitle: fiveTitle
    property alias fiveRect: fiveRect
    property alias bckgnd1: bckgnd1

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

    Rectangle {
        id: bckgnd1
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.top: topLeftBorder.bottom
        anchors.topMargin: 10
        height: 181
        color: "#ffffff"
    }

    Rectangle {
        id: oneRect
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: bckgnd1.top
        anchors.topMargin: 1
        anchors.right: bckgnd1.right
        height: 35
        color: "#000000"

        Text {
            id: oneTitle
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 5
            text: qsTr("1 Foot")
            font.pointSize: 12
            color: "#ffffff"
        }

        Text {
            id: oneCheck
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
        id: oneBtn
        anchors.fill: oneRect
    }

    Rectangle {
        id: twoRect
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: oneRect.bottom
        anchors.topMargin: 1
        anchors.right: bckgnd1.right
        height: 35
        color: "#000000"

        Text {
            id: twoTitle
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 5
            text: qsTr("2 Feet")
            font.pointSize: 12
            color: "#ffffff"
        }

        Text {
            id: twoCheck
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
        id: twoBtn
        anchors.fill: twoRect
    }
    Rectangle {
        id: threeRect
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: twoRect.bottom
        anchors.topMargin: 1
        anchors.right: bckgnd1.right
        height: 35
        color: "#000000"

        Text {
            id: threeTitle
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 5
            text: qsTr("3 Feet")
            font.pointSize: 12
            color: "#ffffff"
        }
        Text {
            id: threeCheck
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
        id: threeBtn
        anchors.fill: threeRect
    }

    Rectangle {
        id: fourRect
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: threeRect.bottom
        anchors.topMargin: 1
        anchors.right: bckgnd1.right
        height: 35
        color: "#000000"

        Text {
            id: fourTitle
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 5
            text: qsTr("4 Feet")
            font.pointSize: 12
            color: "#ffffff"
        }

        Text {
            id: fourCheck
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
        id: fourBtn
        anchors.fill: fourRect
    }

    Rectangle {
        id: fiveRect
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: fourRect.bottom
        anchors.topMargin: 1
        anchors.right: bckgnd1.right
        height: 35
        color: "#000000"

        Text {
            id: fiveTitle
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 5
            text: qsTr("5 Feet")
            font.pointSize: 12
            color: "#ffffff"
        }

        Text {
            id: fiveCheck
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
        id: fiveBtn
        anchors.fill: fiveRect
    }


}
