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
    property alias footPounds: footPounds
    property alias imperialCheck: imperialCheck
    property alias newtonMeters: newtonMeters
    property alias metricCheck: metricCheck
    property alias imperialButton: imperialButton
    property alias metricButton: metricButton
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
        height: 73
        color: "#ffffff"
    }

    Rectangle {
        id: imperialRect
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: bckgnd1.top
        anchors.topMargin: 1
        anchors.right: bckgnd1.right
        height: 35
        color: "#000000"

        Text {
            id: footPounds
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 5
            text: qsTr("ft-lbs")
            font.pointSize: 12
            color: "#ffffff"
        }

        Text {
            id: imperialCheck
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
        id: imperialButton
        anchors.fill: imperialRect
    }

    Rectangle {
        id: metricRect
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: imperialRect.bottom
        anchors.topMargin: 1
        anchors.right: bckgnd1.right
        height: 35
        color: "#000000"

        Text {
            id: newtonMeters
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 5
            text: qsTr("Nm")
            font.pointSize: 12
            color: "#ffffff"
        }

        Text {
            id: metricCheck
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
        id: metricButton
        anchors.fill: metricRect
    }
}
