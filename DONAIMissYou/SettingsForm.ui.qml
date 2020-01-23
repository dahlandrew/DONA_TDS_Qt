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
    anchors.fill: parent
    //property alias units: units
    property alias language: language
    property alias languageButton: languageButton
    //property alias sampleFrequency: sampleFrequency
    //property alias tapInterval: tapInterval
    //property alias showPosition: showPosition
    //property alias showDepth: showDepth
    property alias showTargetTorque: showTargetTorque
    //property alias torqueTap: torqueTap
    property alias emailInput: emailInput
    //property alias inclButton: inclButton
    //property alias incl: incl
    property alias torqueUnitsButton: torqueUnitsButton
    property alias torqueUnits: torqueUnits
    //property alias depthInt: depthInt
    //property alias depthUnitTnl: depthUnitTnl
    //property alias depthUnitsButton: depthUnitsButton
    //property alias depthUnits: depthUnits
    property alias loggingIntButton: loggingIntButton
    property alias loggingInt: loggingInt
    //property alias torTapIntButton: torTapIntButton

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
        height: 50
        color: "#FFD81E"
    }

    Rectangle {
        id: bottomLeftBorder
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: bottomRightBorder.left
        height: 30
        color: "#FFD81E"
    }
    Shape {
        id: invTri

        ShapePath {
            id: invTri_sp
            strokeColor: "#FFD81E"
            strokeWidth: 1
            fillColor: "#FFD81E"
            startX: ((element.width/2)+25); startY: (element.height - 50)
            PathLine { x: (element.width/2)-10; y: (element.height - 30)}
            PathLine { x: ((element.width/2)+25); y: (element.height - 30)}
            PathLine { x: ((element.width/2)+25); y: (element.height - 50)}
        }
    }

    Rectangle {
        id: bckgnd1
        anchors.horizontalCenter: element.horizontalCenter
        //anchors.verticalCenterOffset:0
        //anchors.verticalCenter: element.verticalCenter
        anchors.top: topLeftBorder.bottom
        anchors.topMargin: 10
        anchors.right: element.right
        anchors.rightMargin: 5
        height: 201
        color: "#ffffff"
        z: 0
    }
    Rectangle {
        id: languageRect
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: bckgnd1.top
        anchors.topMargin: 1
        anchors.right: bckgnd1.right
        height: 40
        color: "#000000"

        Text {
            id: languageLabel
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 5
            text: qsTr("Language")
            font.pointSize: 12
            color: "#ffffff"
        }

        Text {
            id: language
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 20
            text: qsTr("English")
            font.pointSize: 12
            color: "#ffffff"
        }

        Text {
            id: arrow1
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 5
            text: qsTr(">")
            font.pointSize: 12
            color: "#ffffff"
        }
    }
    MouseArea{
        id: languageButton
        anchors.fill: languageRect
    }

    Rectangle {
        id: torqueUnitsRect
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: languageRect.bottom
        anchors.topMargin: 1
        anchors.right: bckgnd1.right
        height: 40
        color: "#000000"

        Text {
            id: torqueUnitsLabel
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 5
            text: qsTr("Torque Units")
            font.pointSize: 12
            color: "#ffffff"
        }

        Text {
            id: torqueUnits
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 20
            text: qsTr("Ft-Lbs")
            font.pointSize: 12
            color: "#ffffff"
        }

        Text {
            id: arrow2
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 5
            text: qsTr(">")
            font.pointSize: 12
            color: "#ffffff"
        }
    }
    MouseArea{
        id: torqueUnitsButton
        anchors.fill: torqueUnitsRect
    }

    /*Rectangle {
        id: depthUnitsRect
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: torqueUnitsRect.bottom
        anchors.topMargin: 1
        anchors.verticalCenterOffset: 0.25
        anchors.right: bckgnd1.right
        height: 35
        color: "#000000"

        Text {
            id: depthUnitLabel
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 5
            text: qsTr("Depth Units")
            font.pointSize: 12
            color: "#ffffff"
        }

        Text {
            id: depthUnits
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 20
            text: qsTr("Feet")
            font.pointSize: 12
            color: "#ffffff"
        }

        Text {
            id: arrow3
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 5
            text: qsTr(">")
            font.pointSize: 12
            color: "#ffffff"
        }
    }

    MouseArea {
        id: depthUnitsButton
        anchors.fill:depthUnitsRect
    }*/

    /*Rectangle {
        id: depthIntRect
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: depthUnitsRect.bottom
        anchors.topMargin: 1
        anchors.right: bckgnd1.right
        height: 35
        color: "#000000"


        Text {
            id: depthUnitTnl
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 20
            text: qsTr("Feet")
            font.pointSize: 12
            color: "#ffffff"
        }

        Text {
            id: depthIntLabel
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 5
            text: qsTr("Depth Interval")
            font.pointSize: 12
            color: "#ffffff"
        }

        Text {
            id: arrow4
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 5
            text: qsTr(">")
            font.pointSize: 12
            color: "#ffffff"
        }
        TextField {
            id: depthInt
            anchors.bottom: parent.bottom
            anchors.right: depthUnitTnl.left
            anchors.rightMargin: 10
            width: 125
            height: parent.height
            text: qsTr("5")
            topPadding: 0
            bottomPadding: 0
            horizontalAlignment: Text.AlignRight
            font.pointSize: 12
            color: "#ffffff"
            z: 0
        }
    }*/

    Rectangle {
        id: loggingIntRect
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: torqueUnitsRect.bottom
        anchors.topMargin: 1
        anchors.right: bckgnd1.right
        height: 40
        color: "#000000"
        Text {
            id: loggingIntLabel
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 5
            text: qsTr("Logging Interval")
            font.pointSize: 12
            color: "#ffffff"
        }

        Text {
            id: loggingInt
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 20
            text: qsTr("5 Seconds")
            font.pointSize: 12
            color: "#ffffff"
        }

        Text {
            id: arrow5
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 5
            text: qsTr(">")
            font.pointSize: 12
            color: "#ffffff"
        }
    }

    MouseArea{
        id:loggingIntButton
        anchors.fill: loggingIntRect
    }
    /*Rectangle {
        id: torTapIntRect
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: loggingIntRect.bottom
        anchors.topMargin: 1
        anchors.right: bckgnd1.right
        height: 35
        color: "#000000"

        Text {
            id: torTapIntLabel
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 5
            text: qsTr("Torque Tap Interval")
            font.pointSize: 12
            color: "#ffffff"
        }

        Text {
            id: torTapInt
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 20
            text: qsTr("3 Feet")
            font.pointSize: 12
            color: "#ffffff"
        }

        Text {
            id: arrow6
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 5
            text: qsTr(">")
            font.pointSize: 12
            color: "#ffffff"
        }
    }
    MouseArea{
        id: torTapIntButton
        anchors.fill: torTapIntRect
    }*/
    /*Rectangle {
        id: inclRect
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: torTapIntRect.bottom
        anchors.topMargin: 1
        anchors.right: bckgnd1.right
        height: 35
        color: "#000000"

        Text {
            id: inclLabel
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 5
            text: qsTr("Inclinometer Interval")
            font.pointSize: 12
            color: "#ffffff"
        }

        Text {
            id: incl
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 20
            text: qsTr("10\xB0, 20\xB0, 30\xB0")
            font.pointSize: 12
            color: "#ffffff"
        }

        Text {
            id: arrow7
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 5
            text: qsTr(">")
            font.pointSize: 12
            color: "#ffffff"
        }
    }
    MouseArea{
        id: inclButton
        anchors.fill: inclRect
    }*/
    /*Rectangle {
        id: posRect
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: inclRect.bottom
        anchors.topMargin: 1
        anchors.right: bckgnd1.right
        height: 35
        color: "#000000"
        Switch {
            id: showPosition
            height: 36
            checked: true
            anchors.right: parent.right
            anchors.rightMargin: 7
            anchors.top: tapInterval.bottom
            display: AbstractButton.IconOnly
            background: Material.Green
        }

        Text{
            id: showPositionLabel
            text: qsTr("Show Position")
            font.pointSize: 12
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.verticalCenter: showPosition.verticalCenter
            color: "#ffffff"
        }
    }*/


    /*Rectangle {
        id: depthRect
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: posRect.bottom
        anchors.topMargin: 1
        anchors.right: bckgnd1.right
        height: 35
        color: "#000000"
        Switch {
            id: showDepth
            height: 36
            checked: true
            anchors.right: parent.right
            anchors.rightMargin: 7
            anchors.top: showPosition.bottom
            background: Material.Green
        }

        Text{
            id: showDepthLabel
            text: qsTr("Show Depth")
            font.pointSize: 12
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.verticalCenter: showDepth.verticalCenter
            color: "#ffffff"
        }
    }*/

    Rectangle {
        id: targetTorqRect
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: loggingIntRect.bottom
        anchors.topMargin: 1
        anchors.right: bckgnd1.right
        height: 40
        color: "#000000"
        Switch {
            id: showTargetTorque
            height: 36
            checked: true
            anchors.right: parent.right
            anchors.rightMargin: 7
            anchors.top: showDepth.bottom
            background: Material.Green
        }

        Text{
            id: showTargetTorqueLabel
            text: qsTr("Show Target Torque")
            font.pointSize: 12
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.verticalCenter: showTargetTorque.verticalCenter
            color: "#ffffff"
        }
    }


    /*Rectangle {
        id: torqueTapRect
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: loggingIntRect.bottom
        anchors.topMargin: 1
        anchors.right: bckgnd1.right
        height: 40
        color: "#000000"
        Switch {
            id: torqueTap
            height: 36
            checked: false
            enabled: true
            anchors.right: parent.right
            anchors.rightMargin: 7
            anchors.top: loggingIntRect.bottom
            background: Material.Green
        }

        Text{
            id: torqueTapLabel
            text: qsTr("Torque Tap")
            font.pointSize: 12
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.verticalCenter: torqueTap.verticalCenter
            color: "#ffffff"
        }
    }*/

    Rectangle {
        id: emailRect
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: targetTorqRect.bottom
        anchors.topMargin: 1
        anchors.right: bckgnd1.right
        height: 35
        color: "#000000"

        TextField {
            id: emailInput
            width:0.5*parent.width
            height: parent.height
            bottomPadding: 7
            anchors.right: parent.right
            anchors.bottom: emailRect.bottom
            anchors.rightMargin: 7
            anchors.top: torqueTap.bottom
            placeholderText: qsTr("--")
            horizontalAlignment: Text.AlignHCenter
            color: "#ffffff"
        }

        Text {
            id: emailLabel
            anchors.verticalCenter: emailRect.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 7
            text: qsTr("Email")
            font.pointSize: 12
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            color: "#ffffff"
        }
    }
}

