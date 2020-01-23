import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Shapes 1.12
import QtCharts 2.3

Item {

    id:element
    //width: 400
    //height: 520
    property alias torqueDisplay: torqueDisplay
    property alias startRecord: startRecord
    property alias stopRecord: stopRecord
    property alias zeroTorque: zeroTorque
    property alias maxTorqUnits: maxTorqUnits
    property alias tarTorUnits: tarTorUnits
    property alias warning: warning
    property alias jobSite: jobSite
    property alias serNum: serNum
    property alias element: element
    property alias recording: recording
    property alias maxTorq: maxTorq
    property alias tarTor: tarTor
    property alias rotDir: rotDir
    property alias recordCircle: recordCircle
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

    Popup {
        id: warning
        height: (3/4)*parent.height
        width: parent.width
        contentItem: Text {
            text: qsTr("Not connect to the Torque Detection System\nPlease connect to the correct WiFi")
            color: "#ffffff"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pointSize: 12
        }
    }

    Text {
        id: title
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: topRightBorder.verticalCenter
        text: qsTr("TD System")
        font.family: "Arial"
        font.pointSize: 16
        font.italic: true
        font.bold: true
        color: "#000000"
    }

    Text {
        id: torqueDisplay
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: serNum.bottom
        //anchors.topMargin: 5
        width: 225
        height: 45
        text: qsTr("8275")
        font.pointSize: 48
        font.family: "Arial"
        font.italic: true
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        color: "#FFFFFF"
    }

    Image {
        id: rotDir
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: torqueDisplay.bottom
        anchors.topMargin: 20
        source: "qrc:/clockwise.png"
        height: 35
        width: 35
        z: 100
    }

    Text {
        id: maxTorq
        text: qsTr("14,253")
        color: "#FFD81E"
        width: implicitWidth
        anchors.verticalCenter: rotDir.verticalCenter
        anchors.right: rotDir.left
        anchors.rightMargin: 70
        font.pointSize: 14
        z: 100
    }

    Text {
        id: maxTorqUnits
        text: qsTr("Nm")
        color: "#FFD81E"
        anchors.verticalCenter: rotDir.verticalCenter
        anchors.left: maxTorq.right
        anchors.leftMargin: 5
        font.pointSize: 14
        z: 100
    }

    Text {
        id: tarTor
        text: qsTr("15,000")
        color: "#CD0000"
        width: implicitWidth
        anchors.verticalCenter: rotDir.verticalCenter
        anchors.left: rotDir.right
        anchors.leftMargin: 45
        font.pointSize: 14
        z: 100
    }

    Text {
        id: tarTorUnits
        text: qsTr("Nm")
        color: "#CD0000"
        anchors.verticalCenter: rotDir.verticalCenter
        anchors.left: tarTor.right
        anchors.leftMargin: 5
        font.pointSize: 14
        z: 100
    }

    Text {
        id: vertAxLbl
        rotation: -90
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: 40
        //anchors.verticalCenter: graph.verticalCenter
        text: qsTr("Torque (Nm)")
        anchors.horizontalCenter: parent.left
        anchors.horizontalCenterOffset: 12
        color: "#FFFFFF"
        font.pointSize: 10
        font.bold: true
        z: 1
    }

    RoundButton {
        id: zeroTorque
        width: 55
        height: 55
        anchors.verticalCenter: startRecord.verticalCenter
        anchors.left: element.left
        anchors.leftMargin: 25
        display: AbstractButton.IconOnly
        icon.source: "qrc:/zero.svg"
        font.bold: true
        font.pointSize: 13
        z: 1000
        Material.background: "#FFD81E"
    }

    RoundButton {
        id: startRecord
        width: 55
        height: 55
        highlighted: false
        anchors.bottom: recording.top
        anchors.horizontalCenter: element.horizontalCenter
        /*display: AbstractButton.IconOnly
        icon.source: "record_d.png"
        icon.height: startRecord.height*/
        z: 100
        Material.background: "#FFD81E"
        Image {
            id: startRecordIcon
            source: "record_d.png"
            anchors.centerIn: parent
            height: parent.implicitBackgroundHeight+5
            width: height*(100/148)
        }
    }

    Rectangle {
        id: recordCircle
        anchors.centerIn: startRecord
        height: startRecord.height*0.21
        width: height
        radius: width * 0.5
        color: "#CD0000"
        border.width: 0
        z: 101
        visible: false
    }

    RoundButton {
        id: stopRecord
        width: 55
        height: 55
        anchors.verticalCenter: startRecord.verticalCenter
        anchors.right: element.right
        anchors.rightMargin: 25
        display: AbstractButton.IconOnly
        icon.source: "qrc:/stopRecord.png"
        font.bold: true
        font.pointSize: 16
        z: 1000
        Material.background: "#CD0000"
    }

    /*ChartView {
        id: graph
        anchors.centerIn: parent
        width: 400
        height: 369
        backgroundColor: "#494949"
        titleColor: "#ffffff"
        ValueAxis{
            id: xAxis
            min: 0
            max: 200
            titleText: "Time"
            color: "#ffffff"
            gridLineColor: "#ffffff"
            labelsColor: "#ffffff"


        }
        ValueAxis{
            id: yAxis
            min: 3000
            max: 15000
            titleText: "Torque"
            color: "#ffffff"
            gridLineColor: "#ffffff"
            labelsColor: "#ffffff"
            titleBrush: white
        }

        LineSeries {
            id: torquePlot
            name: "Torque Plot"
            axisX: xAxis
            axisY: yAxis
            //style: Qt.color1
            color: "#f26522"
            XYPoint{
                x:0
                y:0
            }
        }
    }

    /*Rectangle {
        id: rectangle1
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 15
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width*(2/3)
        height: width
        color: "#000000"
        border.color: "#FFFFFF"
        border.width: 1.5
        radius: width*0.5
    }

    Rectangle {
        id: rectangle2
        anchors.centerIn: rectangle1
        width: rectangle1.width*(3/4)
        height: width
        color: "#000000"
        border.color: "#FFFFFF"
        border.width: 1.5
        radius: width*0.5
    }

    Text {
        id: largeAngle
        anchors.bottom: rectangle2.top
        anchors.left: rectangle2.right
        anchors.margins: -30
        text: qsTr("30\xB0")
        font.pointSize: 10
        color: "#FFFFFF"
    }

    Rectangle {
        id: rectangle3
        anchors.centerIn: rectangle1
        width: rectangle1.width*(1/2)
        height: width
        color: "#000000"
        border.color: "#FFFFFF"
        border.width: 1.5
        radius: width*0.5
    }

    MouseArea {
        id: centerTilt
        anchors.fill: rectangle3
    }

    Text {
        id: midAngle
        anchors.bottom: rectangle3.top
        anchors.left: rectangle3.right
        anchors.margins: -20
        text: qsTr("20\xB0")
        font.pointSize: 10
        color: "#FFFFFF"
    }

    Rectangle {
        id: rectangle4
        anchors.centerIn: rectangle1
        width: rectangle1.width*(1/4)
        height: width
        color: "#000000"
        border.color: "#FFFFFF"
        border.width: 1.5
        radius: width*0.5
    }
    Text {
        id: smallAngle
        anchors.bottom: rectangle4.top
        anchors.left: rectangle4.right
        anchors.margins: -10
        text: qsTr("10\xB0")
        font.pointSize: 10
        color: "#FFFFFF"
    }
    Rectangle {
        id: midVertCross
        anchors.verticalCenter: rectangle1.verticalCenter
        anchors.horizontalCenter: rectangle1.horizontalCenter
        height: rectangle4.height*(1/2)
        width: 5
        color: "#FFD81E"
        border.color: "#000000"
        border.width: 0.5
    }

    Rectangle {
        id: midHorizCross
        anchors.verticalCenter: rectangle1.verticalCenter
        anchors.horizontalCenter: rectangle1.horizontalCenter
        width: rectangle4.height*(1/2)
        height: 5
        color: "#FFD81E"
        border.color: "#000000"
        border.width: 0.5
    }

    Rectangle {
        id: longRect1
        anchors.bottom: midVertCross.top
        anchors.bottomMargin: rectangle4.height*(1/10)
        anchors.horizontalCenter: rectangle1.horizontalCenter
        anchors.top: rectangle1.top
        width: 5
        color: "#FFD81E"
        border.color: "#000000"
        border.width: 0.5
    }

    Rectangle {
        id: longRect2
        anchors.top: midVertCross.bottom
        anchors.topMargin: rectangle4.height*(1/10)
        anchors.horizontalCenter: rectangle1.horizontalCenter
        anchors.bottom: rectangle1.bottom
        width: 5
        color: "#FFD81E"
        border.color: "#000000"
        border.width: 0.5
    }
    Rectangle {
        id: longRect3
        anchors.left: midHorizCross.right
        anchors.leftMargin: rectangle4.height*(1/10)
        anchors.verticalCenter: rectangle1.verticalCenter
        anchors.right: rectangle1.right
        height: 5
        color: "#FFD81E"
        border.color: "#000000"
        border.width: 0.5
    }
    Rectangle {
        id: longRect4
        anchors.right: midHorizCross.left
        anchors.rightMargin: rectangle4.height*(1/10)
        anchors.verticalCenter: rectangle1.verticalCenter
        anchors.left: rectangle1.left
        height: 5
        color: "#FFD81E"
        border.color: "#000000"
        border.width: 0.5
    }*/

    TextEdit {
        id: serNum
        anchors.right: topRightBorder.right
        anchors.rightMargin: 5
        anchors.top: jobSite.bottom
        text: qsTr("Serial Number")
        horizontalAlignment: Text.AlignRight
        font.pointSize: 12
        font.family: "Arial"
        color: "#FFFFFF"
    }

    Text {
        id: jobSite
        x: 251
        width: 144
        height: 23
        anchors.right: topRightBorder.right
        anchors.rightMargin: 5
        anchors.top: topRightBorder.bottom
        text: qsTr("Pengo Job Site ")
        horizontalAlignment: Text.AlignRight
        font.pointSize: 12
        font.family: "Arial"
        color: "#FFFFFF"
    }

    /*Text {
        id: torqueUnits
        anchors.verticalCenter: torqueDisplay.verticalCenter
        anchors.left: torqueDisplay.right
        text: qsTr("Nm")
        font.pointSize: 20
        font.family: "Arial"
        font.bold: true
        color: "#FFFFFF"
    }*/

    Text {
        id: recording
        color: "#CD0000"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: element.bottom
        text: qsTr("Recording")
        font.bold: true
        font.pointSize: 12
        font.italic: true
        visible: false
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
