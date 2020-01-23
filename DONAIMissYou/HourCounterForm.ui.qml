import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.3
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0
import QtQuick.Shapes 1.12
import QtCharts 2.3

Item {
    id: element
    width: 400
    height: 520
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
        id: snLbl
        anchors.left: bckgnd1.left
        anchors.top: topLeftBorder.bottom
        text: qsTr("Serial Number")
        color: "#FFD81E"
        font.bold: true
        font.pointSize: 12
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
    }

    Text {
        id: hrsLbl
        anchors.right: bckgnd1.right
        anchors.bottom: bckgnd1.top
        text: qsTr("Hours")
        color: "#FFD81E"
        font.bold: true
        font.pointSize: 12
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
    }
    Rectangle {
        id: bckgnd1
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.top: snLbl.bottom
        height: 124
        color: "#ffffff"
    }

    Rectangle {
        id: frstRect
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: bckgnd1.top
        anchors.topMargin: 1
        anchors.right: bckgnd1.right
        height: 40
        color: "#000000"

        Text {
            id: frstSN
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.leftMargin: 5
            text: qsTr("9900125")
            font.pointSize: 12
            color: "#ffffff"
        }

        Text {
            id: frstMdl
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.leftMargin: 5
            text: qsTr("RT-20")
            font.pointSize: 10
            color: "#ffffff"
        }

        Text {
            id: frstHrs
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 5
            text: qsTr("130")
            font.pointSize: 16
            font.bold: true
            color: "#ffffff"
        }
    }

    Rectangle {
        id: scndRect
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: frstRect.bottom
        anchors.topMargin: 1
        anchors.right: bckgnd1.right
        height: 40
        color: "#000000"

        Text {
            id: scndSN
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.leftMargin: 5
            text: qsTr("9900178")
            font.pointSize: 12
            color: "#ffffff"
        }

        Text {
            id: scndMdl
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.leftMargin: 5
            text: qsTr("RS-12")
            font.pointSize: 10
            color: "#ffffff"
        }

        Text {
            id: scndHrs
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 5
            text: qsTr("75")
            font.pointSize: 16
            font.bold: true
            color: "#ffffff"
        }
    }


    Rectangle {
        id: thrdRect
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: scndRect.bottom
        anchors.topMargin: 1
        anchors.right: bckgnd1.right
        height: 40
        color: "#000000"

        Text {
            id: thrdSN
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.leftMargin: 5
            text: qsTr("9900236")
            font.pointSize: 12
            color: "#ffffff"
        }

        Text {
            id: thrdMdl
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.leftMargin: 5
            text: qsTr("RT-40")
            font.pointSize: 10
            color: "#ffffff"
        }

        Text {
            id: thrdHrs
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 5
            text: qsTr("53")
            font.pointSize: 16
            font.bold: true
            color: "#ffffff"
        }
    }
}
