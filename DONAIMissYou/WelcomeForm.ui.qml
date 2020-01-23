import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Shapes 1.12
import QtCharts 2.3

Item
{
    id: element
    objectName: "Welcome"
    width: 400
    height: 520
    property alias startNew : startNew
    property alias recallJob: recallJob
    property alias quickie: quickie
    property alias hourCounter: hourCounter
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
        id: dLogo
        anchors.left: parent.left
        anchors.leftMargin: 12
        anchors.verticalCenter: topRightBorder.verticalCenter
        anchors.verticalCenterOffset: 2
        height: topRightBorder.height/1.75
        width: height*(123/148)
        source: "qrc:/DONA_d.png"
    }

    Image
    {
        id: logo
        anchors.bottom: startNew.top
        anchors.bottomMargin: 40
        width: 320
        height: 100
        fillMode: Image.PreserveAspectFit
        source: "qrc:/DONA_logo.png"
        anchors.horizontalCenter: parent.horizontalCenter
    }

    RoundButton
    {
        id: startNew
        anchors.left: logo.left
        anchors.leftMargin: 50
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: -20
        width: 70
        height: 70
        text: "+"
        font.pointSize: 36
        font.bold: true
        Material.background: "#FFD81E"
        Text {
            id: startNewLabel
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.bottom
            anchors.topMargin: 5
            text: qsTr("New Record")
            font.pointSize: 12
            color: "#ffffff"
        }
    }

    RoundButton
    {
        id: recallJob
        anchors.right: logo.right
        anchors.rightMargin: 50
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: -20
        width: 70
        height: 70
        highlighted: false
        flat: false
        display: AbstractButton.IconOnly
        icon.source: "qrc:/savedRecords.png"
        font.bold: true
        font.pointSize: 12
        icon.height: recallJob.height
        Material.background: "#FFD81E"
        Text {
            id: recallJobLabel
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.bottom
            anchors.topMargin: 5
            text: qsTr("Saved Records")
            font.pointSize: 12
            font.bold: false
            color: "#ffffff"
        }
    }

    RoundButton
    {
        id: quickie
        anchors.left: logo.left
        anchors.leftMargin: 50
        anchors.top: startNew.bottom
        anchors.topMargin: 50
        width: 70
        height: 70
        display: AbstractButton.IconOnly
        icon.source: "qrc:/quickstartguide.png"
        icon.height: quickie.height+100
        font.bold: true
        font.pointSize: 12
        Material.background: "#FFD81E"
        Text {
            id: quickieLabel
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.bottom
            anchors.topMargin: 5
            text: qsTr("Quick Start Guide")
            font.pointSize: 12
            font.bold: false
            color: "#ffffff"
        }
    }

    RoundButton
    {
        id: hourCounter
        anchors.right: logo.right
        anchors.rightMargin: 50
        anchors.top: recallJob.bottom
        anchors.topMargin: 50
        width: 70
        height: 70
        display: AbstractButton.IconOnly
        icon.source: "qrc:/hourCounter.png"
        icon.width: hourCounter.width
        font.bold: true
        font.pointSize: 12
        Material.background: "#FFD81E"
        Text {
            id: hourLabel
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.bottom
            anchors.topMargin: 5
            text: qsTr("Hour Counter")
            font.pointSize: 12
            font.bold: false
            color: "#ffffff"
        }
    }

    Text
    {
        id: url
        baseUrl: www.dinamicoil.us
        anchors.bottom: bottomLeftBorder.top
        anchors.bottomMargin: 5
        anchors.right: topLeftBorder.right
        text: qsTr("www.dinamicoil.us")
        font.pointSize: 14
        font.bold: false
        font.italic: true
        color: "#FFD81E"
    }
}
