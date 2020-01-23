import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Shapes 1.12
import QtCharts 2.3

HomeForm {

    //var torqueUnits
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
        }

        onWaitForConnect:
        {
            //warning.open();
        }
        onTorqueUnitSig:{
            if(trqUnit === 0){
                maxTorqUnits.text = "Ft-Lbs";
                tarTorUnits.text = "Ft-Lbs";
            }
            if(trqUnit === 1){
                maxTorqUnits.text = "Nm";
                tarTorUnits.text = "Nm";
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
            yAxis.min = (zeroPos - 6)*(lcm/6);
            yAxis.max = zeroPos*(lcm/6);
            xAxis.max = count;
            xAxis.min = cropTime;
        }
    }

    startRecord.onClicked:
    {
        handler.transStart();
        recording.visible = true;
        recordCircle.visible = true;
    }

    stopRecord.onClicked:
    {
        handler.haltRecord();
        recording.visible = false;
        recordCircle.visible = false;
    }

    zeroTorque.onClicked:
    {
        handler.zeroTorque(torqueDisplay.text);
    }

    ChartView {
        id: graph
        anchors.centerIn: parent
        anchors.verticalCenterOffset: 56
        width: element.width
        height: (350/520)*element.height
        backgroundColor: "#000000"
        titleColor: "#ffffff"
        legend.visible: false
        ValueAxis{
            id: xAxis
            min: 0
            max: 200
            titleText: qsTr("Time (sec)")
            color: "#ffffff"
            gridLineColor: "#ffffff"
            labelsColor: "#ffffff"
            labelFormat: "%i"
            labelsFont:Qt.font({pointSize: 10})
            tickCount: 7
            tickInterval: 15
            titleBrush: handler.titleBrush()
        }
        ValueAxis{
            id: yAxis
            color: "#ffffff"
            gridLineColor: "#ffffff"
            labelsColor: "#ffffff"
            labelFormat: "%i"
            labelsFont:Qt.font({pointSize: 10})
            tickCount: 7
            tickInterval: 600
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
}
