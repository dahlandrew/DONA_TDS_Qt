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
    property alias english: english
    property alias englishCheck: englishCheck
    property alias englishBtn: englishBtn
    property alias french: french
    property alias frenchBtn: frenchBtn
    property alias frenchCheck: frenchCheck
    property alias span: span
    property alias spanBtn: spanBtn
    property alias spanCheck: spanCheck
    property alias germ: germ
    property alias germBtn: germBtn
    property alias germCheck: germCheck
    property alias port: port
    property alias portBtn: portBtn
    property alias portCheck: portCheck
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

    Rectangle {
        id: bckgnd1
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.top: topLeftBorder.bottom
        anchors.topMargin: 10
        height: 176
        color: "#ffffff"
    }

    Rectangle {
        id: englishRect
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: bckgnd1.top
        anchors.topMargin: 1
        anchors.right: bckgnd1.right
        height: 35
        color: "#000000"

        Text {
            id: english
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 5
            text: qsTr("English")
            font.pointSize: 12
            color: "#ffffff"
        }

        Text {
            id: englishCheck
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
        id: englishBtn
        anchors.fill: englishRect
    }

    Rectangle {
        id: frenchRect
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: englishRect.bottom
        anchors.topMargin: 1
        anchors.right: bckgnd1.right
        height: 35
        color: "#000000"

        Text {
            id: french
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 5
            text: qsTr("French")
            font.pointSize: 12
            color: "#ffffff"
        }

        Text {
            id: frenchCheck
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
        id: frenchBtn
        anchors.fill: frenchRect
    }
    Rectangle {
        id: spanRect
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: frenchRect.bottom
        anchors.topMargin: 1
        anchors.right: bckgnd1.right
        height: 35
        color: "#000000"

        Text {
            id: span
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 5
            text: qsTr("Spanish")
            font.pointSize: 12
            color: "#ffffff"
        }
        Text {
            id: spanCheck
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
        id: spanBtn
        anchors.fill: spanRect
    }

    Rectangle {
        id: germRect
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: spanRect.bottom
        anchors.topMargin: 1
        anchors.right: bckgnd1.right
        height: 35
        color: "#000000"

        Text {
            id: germ
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 5
            text: qsTr("German")
            font.pointSize: 12
            color: "#ffffff"
        }

        Text {
            id: germCheck
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
        id: germBtn
        anchors.fill: germRect
    }

    Rectangle {
        id: portRect
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: germRect.bottom
        anchors.topMargin: 1
        anchors.right: bckgnd1.right
        height: 30
        color: "#000000"

        Text {
            id: port
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 5
            text: qsTr("Portuguese")
            font.pointSize: 12
            color: "#ffffff"
        }

        Text {
            id: portCheck
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
        id: portBtn
        anchors.fill: portRect
    }
}
