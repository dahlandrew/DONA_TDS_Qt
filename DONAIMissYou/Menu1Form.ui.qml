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

    Image
    {
        id: logo
        anchors.bottom: startNew.top
        anchors.bottomMargin: 20
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
        font.pointSize: 24
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
            text: qsTr("Saved Racords")
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
        icon.height: quickie.height
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
        anchors.rightMargin: 15
        text: qsTr("www.dinamicoil.us")
        font.pointSize: 12
        font.bold: false
        font.italic: true
        color: "#FFD81E"
    }
}



/*Item {
    id:element
    width: 400
    height: 520
    anchors.fill: parent
    property alias startNew: startNew
    property alias quickStart: quickStart
    property alias opManual: opManual
    property alias def: def
    property alias savedJobs: savedJobs
    property alias userAgree: userAgree
    property alias graph: graph
    property alias hours: hours

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

    Button {
        id: startNew
        anchors.right: opManual.right
        anchors.bottom: strtNwLbl.top
        width: 85
        height: 85
        icon.height: userAgree1.height
        icon.width: userAgree1.width
        text: qsTr("+")
        highlighted: true
        font.bold: true
        font.pointSize: 46
        Material.background: "#000000"
    }
    Label {
        id: strtNwLbl
        anchors.horizontalCenter: startNew.horizontalCenter
        anchors.bottom: opManual.top
        text: qsTr("Start New Job")
        font.pointSize: 12
        color: "#ffffff"
    }

    Button {
        id: quickStart
        anchors.left: savedJobs.left
        anchors.bottom: qckStrtLbl.top
        width: startNew.height
        height: startNew.width
        highlighted: true
        display: AbstractButton.IconOnly
        icon.source: "qrc:/quickstartguide.png"
        icon.height: quickStart.height
        Material.background: "#000000"
    }
    Label {
        id: qckStrtLbl
        anchors.horizontalCenter: quickStart.horizontalCenter
        anchors.bottom:  savedJobs.top
        text: qsTr("Quick Start Guide")
        font.pointSize: 12
        color: "#ffffff"
    }

    Button {
        id: opManual
        anchors.right: parent.horizontalCenter
        anchors.rightMargin: 30
        anchors.bottom: parent.verticalCenter
        anchors.bottomMargin: -15
        width: startNew.height
        height: startNew.width
        highlighted: true
        anchors.topMargin: 0
        display: AbstractButton.IconOnly
        icon.source: "qrc:/opmanual.png"
        icon.height: opManual.height
        Material.background: "#000000"
    }
    Label {
        id: opManLbl
        anchors.horizontalCenter: opManual.horizontalCenter
        anchors.top: opManual.bottom
        text: qsTr("Operational Manual")
        font.pointSize: 12
        color: "#ffffff"
    }

    Button {
        id: savedJobs
        anchors.left: parent.horizontalCenter
        anchors.leftMargin: 25
        anchors.bottom: parent.verticalCenter
        anchors.bottomMargin: -15
        width: startNew.height
        height: startNew.width
        highlighted: true
        display: AbstractButton.IconOnly
        icon.source: "qrc:/savedjobs.png"
        icon.height: savedJobs.height
        Material.background: "#000000"
    }
    Label {
        id: svdJbsLbl
        anchors.horizontalCenter: savedJobs.horizontalCenter
        anchors.top: savedJobs.bottom
        text: qsTr("Saved Jobs")
        font.pointSize: 12
        color: "#ffffff"
    }

    Button {
        id: def
        x: 50
        anchors.left: parent.horizontalCenter
        anchors.leftMargin: 25
        anchors.top: svdJbsLbl.bottom
        width: startNew.height
        height: startNew.width
        highlighted: true
        display: AbstractButton.IconOnly
        icon.source: "qrc:/definitions.png"
        icon.height: def.height
        Material.background: "#000000"
    }
    Label {
        id: defLbl
        anchors.horizontalCenter: def.horizontalCenter
        anchors.top: def.bottom
        text: qsTr("Definitions")
        font.pointSize: 12
        color: "#ffffff"
    }

    Button {
        id: hours
        anchors.top: opManLbl.bottom
        anchors.right: opManual.right
        width: startNew.height
        height: startNew.width
        highlighted: true
        display: AbstractButton.IconOnly
        icon.source: "qrc:/hours.png"
        icon.width: quickStart.width
        Material.background: "#000000"
    }
    Label {
        id: hrsLbl
        anchors.horizontalCenter: hours.horizontalCenter
        anchors.top: hours.bottom
        text: qsTr("Hours")
        font.pointSize: 12
        color: "#ffffff"
    }

    Button {
        id: userAgree
        anchors.right: opManual.right
        anchors.top: hrsLbl.bottom
        width: startNew.height
        height: startNew.width
        highlighted: true
        display: AbstractButton.IconOnly
        icon.source: "qrc:/useragreement.png"
        icon.height: userAgree.height
        Material.background: "#000000"
    }
    Label {
        id: useAgrLbl
        anchors.horizontalCenter: userAgree.horizontalCenter
        anchors.top: userAgree.bottom
        text: qsTr("User Agreement")
        font.pointSize: 12
        color: "#ffffff"
    }

    Button {
        id: graph
        width: startNew.height
        height: startNew.width
        highlighted: true
        display: AbstractButton.IconOnly
        icon.height: graph.height
        icon.source: "qrc:/graphicon.png"
        anchors.left: parent.horizontalCenter
        Material.background: "#000000"
        anchors.leftMargin: 25
        anchors.top: defLbl.bottom
    }
    Label {
        id: graphLbl
        anchors.horizontalCenter: graph.horizontalCenter
        anchors.top: graph.bottom
        text: qsTr("Graph")
        font.pointSize: 12
        color: "#ffffff"
    }
}*/
