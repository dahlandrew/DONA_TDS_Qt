import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Shapes 1.12
import QtCharts 2.3

HomeForm{
    id:element
    anchors.fill: parent

    Connections
    {
        target: handler
        onHomeDisplay:
        {
            torqueDisplay.text = torqueStr + " " + units ;
            //progressBar.value = parseInt(voltage)/parseInt(targetTorque.text);
            maxTorq.text = tMaxStr;

            if(torqueFlt > 10)
            {
                rotDir.source = "qrc:/counterClockwise.png";
            }
            if(torqueFlt < -10)
            {
                rotDir.source = "qrc:/clockwise.png";
            }
            if(torqueFlt < 10 && torqueFlt > -10)
            {
                rotDir.source = "qrc:/null.png";
            }

            batteryAmnt.text = battery + " %";
            if(battery > 0 && battery < 25)
            {
                batteryInd.source = "qrc:/battery_25.png";
            }
            if(battery > 25 && battery < 50)
            {
                batteryInd.source = "qrc:/battery_50.png";
            }
            if(battery > 50 && battery < 75)
            {
                batteryInd.source = "qrc:/battery_75.png";
            }
            if(battery > 75 && battery < 100)
            {
                batteryInd.source = "qrc:/battery_100.png";
            }
        }

        onWaitForConnect:
        {
            //warning.open();
        }
        onTorqueUnitSig:{
            if(trqUnit === 0) {
                maxTorqUnits.text = "ft-lbs";
                tarTorUnits.text = "ft-lbs";
                vertAxLbl.text = "Torque (ft-lbs)";
            }
            if(trqUnit === 1) {
                maxTorqUnits.text = "Nm";
                tarTorUnits.text = "Nm";
                vertAxLbl.text = "Torque (Nm)"
            }
        }

        onJobNameSig:{
            jobSite.text = svdJobName;
        }

        onTarTorSig:{
            tarTor.text = svdTarTor;
        }

        onSerialNumSig:{
            serNum.text = svdSerNum;
        }
        onGraphUpdate:{
            torquePlot.insert(count, count, voltageNum);
            yAxis.min = yMin;
            yAxis.max = yMax;
            xAxis.min = cropTime;
            if(count > 30)
            {
                xAxis.max = count;
            }
        }
        onClearGraph: {
            torquePlot.removePoints(0, torquePlot.count);
        }
    }

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

    Text {
        id: torqueDisplay
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: organizer2.verticalCenter
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
        z: 100
    }

    Image {
        id: rotDir
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: organizer3.verticalCenter
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
        width: 60
        height: 60
        anchors.verticalCenter: startRecord.verticalCenter
        anchors.left: element.left
        anchors.leftMargin: 25
        display: AbstractButton.IconOnly
        icon.source: "qrc:/zero.svg"
        font.bold: true
        font.pointSize: 13
        z: 100
        Material.background: "#FFD81E"
        onClicked:
            {
                handler.zeroTorque(torqueDisplay.text);
            }
    }

    RoundButton {
        id: startRecord
        width: 60
        height: 60
        highlighted: false
        anchors.verticalCenter: organizer4.top
        anchors.verticalCenterOffset: 17
        anchors.horizontalCenter: element.horizontalCenter
        z: 100
        Material.background: "#FFD81E"
        onClicked: {
            handler.transStart();
            recording.visible = true;
            recordCircle.visible = true;
        }

        Image {
            id: startRecordIcon
            source: "record_d.png"
            anchors.centerIn: parent
            height: parent.implicitBackgroundHeight+12
            width: height*(100/148)
        }
    }

    Rectangle {
        id: recordCircle
        anchors.centerIn: startRecord
        height: startRecord.height*0.25
        width: height
        radius: width * 0.5
        color: "#CD0000"
        border.width: 0
        z: 101
        visible: false
    }

    RoundButton {
        id: stopRecord
        width: 60
        height: 60
        anchors.verticalCenter: startRecord.verticalCenter
        anchors.right: element.right
        anchors.rightMargin: 25
        display: AbstractButton.IconOnly
        icon.source: "qrc:/stopRecord.png"
        font.bold: true
        font.pointSize: 16
        z: 100
        Material.background: "#CD0000"
        onClicked:
            {
                handler.haltRecord();
                recording.visible = false;
                recordCircle.visible = false;
            }
    }

    Text {
        id: serNum
        anchors.right: topRightBorder.right
        anchors.rightMargin: 5
        anchors.top: jobSite.bottom
        text: qsTr("Serial Number")
        horizontalAlignment: Text.AlignRight
        font.pointSize: 12
        font.family: "Arial"
        color: "#FFFFFF"
        z: 100
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
        z: 100
    }

    ChartView {
        id: graph
        anchors.centerIn: parent
        anchors.verticalCenterOffset: 56
        margins.top: 5
        width: element.width
        height: element.width
        backgroundColor: "#000000"
        titleColor: "#ffffff"
        legend.visible: false
        ValueAxis{
            id: xAxis
            min: 0
            max: 30
            titleText: qsTr("Time (sec)")
            color: "#ffffff"
            gridLineColor: "#ffffff"
            labelsColor: "#ffffff"
            labelFormat: "%i"
            labelsFont:Qt.font({pointSize: 10})
            tickCount: 7
            titleBrush: handler.titleBrush()
        }
        ValueAxis{
            id: yAxis
            min: -30
            max: 30
            color: "#ffffff"
            gridLineColor: "#ffffff"
            labelsColor: "#ffffff"
            labelFormat: "%i"
            labelsFont:Qt.font({pointSize: 10})
            tickCount: 7
            tickInterval: 10
            tickAnchor: 0
            tickType: yAxis.TicksDynamic
            titleBrush: handler.titleBrush()
        }

        LineSeries {
            id: torquePlot
            axisX: xAxis
            axisYRight: yAxis
            color: "#FFD81E"
            XYPoint{
                x: 0
                y: 0
            }
        }
    }

    Rectangle {
        id: organizer1
        width: element.width
        anchors.top: topLeftBorder.bottom
        anchors.bottom: graph.top
        color: "#000000"
    }

    Rectangle {
        id: organizer2
        width: element.width
        anchors.top: organizer1.top
        anchors.bottom: organizer1.verticalCenter
        color: "#000000"
    }

    Rectangle {
        id: organizer3
        width: element.width
        anchors.top: organizer1.verticalCenter
        anchors.bottom: organizer1.bottom
        color: "#000000"
    }

    Rectangle {
        id: organizer4
        width: element.width
        anchors.top: graph.bottom
        anchors.bottom: element.bottom
        color: "#000000"
    }
}
