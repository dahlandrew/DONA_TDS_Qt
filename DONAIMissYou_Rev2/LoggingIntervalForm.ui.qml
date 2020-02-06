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
    property alias oneSecButton: oneSecButton
    property alias oneSec: oneSec
    property alias oneSecCheck: oneSecCheck
    property alias fiveSec: fiveSec
    property alias fiveSecButton: fiveSecButton
    property alias fiveSecCheck: fiveSecCheck
    property alias tenSec: tenSec
    property alias tenSecButton: tenSecButton
    property alias tenSecCheck: tenSecCheck
    property alias thirtySec: thirtySec
    property alias thirtySecButton: thirtySecButton
    property alias thirtySecCheck: thirtySecCheck
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
        height: 125
        color: "#ffffff"
    }

    Rectangle {
        id: oneSecRect
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: bckgnd1.top
        anchors.topMargin: 1
        anchors.right: bckgnd1.right
        height: 30
        color: "#000000"

        Text {
            id: oneSec
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 5
            text: qsTr("1 Second")
            font.pointSize: 12
            color: "#ffffff"
        }

        Text {
            id: oneSecCheck
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
        id: oneSecButton
        anchors.fill: oneSecRect
    }

    Rectangle {
        id: fiveSecRect
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: oneSecRect.bottom
        anchors.topMargin: 1
        anchors.right: bckgnd1.right
        height: 30
        color: "#000000"

        Text {
            id: fiveSec
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 5
            text: qsTr("5 Seconds")
            font.pointSize: 12
            color: "#ffffff"
        }

        Text {
            id: fiveSecCheck
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
        id: fiveSecButton
        anchors.fill: fiveSecRect
    }
    Rectangle {
        id: tenSecRect
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: fiveSecRect.bottom
        anchors.topMargin: 1
        anchors.right: bckgnd1.right
        height: 30
        color: "#000000"

        Text {
            id: tenSec
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 5
            text: qsTr("10 Seconds")
            font.pointSize: 12
            color: "#ffffff"
        }
        Text {
            id: tenSecCheck
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
        id: tenSecButton
        anchors.fill: tenSecRect
    }

    Rectangle {
        id: thirtySecRect
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: tenSecRect.bottom
        anchors.topMargin: 1
        anchors.right: bckgnd1.right
        height: 30
        color: "#000000"

        Text {
            id: thirtySec
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 5
            text: qsTr("30 Seconds")
            font.pointSize: 12
            color: "#ffffff"
        }

        Text {
            id: thirtySecCheck
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
        id: thirtySecButton
        anchors.fill: thirtySecRect
    }
}
