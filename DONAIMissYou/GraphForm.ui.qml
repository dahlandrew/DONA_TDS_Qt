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
    //property alias torquePlot: torquePlot
    anchors.fill: parent

    Rectangle {
        id: topRightBorder
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.left: topLeftBorder.right
        height: 45
        color: "#F26522"
    }

    Rectangle {
        id: topLeftBorder
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.horizontalCenter
        anchors.rightMargin: 25
        height: 75
        color: "#F26522"
    }
    Shape {
        id: tri

        ShapePath {
            id: tri_sp
            strokeColor: "#F26522"
            strokeWidth: 1
            fillColor: "#F26522"
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
        color: "#F26522"
    }

    Rectangle {
        id: bottomLeftBorder
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: bottomRightBorder.left
        height: 45
        color: "#F26522"
    }
    Shape {
        id: invTri

        ShapePath {
            id: invTri_sp
            strokeColor: "#F26522"
            strokeWidth: 1
            fillColor: "#F26522"
            startX: ((element.width/2)+25); startY: (element.height - 75)
            PathLine { x: (element.width/2)-10; y: (element.height - 45)}
            PathLine { x: ((element.width/2)+25); y: (element.height - 45)}
            PathLine { x: ((element.width/2)+25); y: (element.height - 75)}
        }
    }

    ChartView {
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
}
