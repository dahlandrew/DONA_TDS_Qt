import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Shapes 1.12
import QtCharts 2.3
import QtQuick.Extras 1.4

Page
{
    id: element
    width: 400
    height: 520
    anchors.fill: parent
    //property alias next: next
    property alias jobName: jobName
    property alias firstAnchor: firstAnchor
    //property alias location: location
    property alias customer: customer
    property alias tarTor: tarTor
    property alias loggingInt: loggingInt
    property alias loggingIntButton: loggingIntButton
    property alias torqueUnits: torqueUnits
    property alias torqueUnitsButton: torqueUnitsButton
    property alias setupDone: setupDone
    property alias outStages: outStages
    property alias outStagesBtn: outStagesBtn
    /*property alias singleSpeed: singleSpeed
    property alias twoSpeed: twoSpeed
    property alias variableSpeed: variableSpeed
    property alias driveModelSelect: driveModelSelect*/
    property alias driveSerialNum: driveSerialNum
    property alias batteryInd: batteryInd
    property alias batteryAmnt: batteryAmnt
    /*property alias driveModelColumn: driveModelColumn
    property alias depthInt: depthInt
    property alias depthUnitTnl: depthUnitTnl
    property alias depthUnits: depthUnits
    property alias depthUnitsButton: depthUnitsButton*/


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
    /*Flickable
    {
        id: flickMe
        anchors.top: topLeftBorder.bottom
        height: parent.height - topLeftBorder.height
        width: parent.width
        contentHeight: parent.height *1.25
        clip: true

        ScrollBar.vertical: ScrollBar {
                parent: flickMe.parent
                anchors.top: flickMe.top
                anchors.right: flickMe.right
                anchors.bottom: flickMe.bottom
            }

        Column {
            id: contentCol
            anchors.fill: parent*/

    Image {
        id: batteryInd
        height: 19
        width: 37
        anchors.bottom: topLeftBorder.bottom
        anchors.bottomMargin: 6
        anchors.left: topLeftBorder.left
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
        id: jobNameLabel
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: topLeftBorder.bottom
        width: 102
        height: 18
        color: "#FFD81E"
        text: qsTr("Record Name")
        font.bold: true
        font.pointSize: 12
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
    }

    TextField {
        id: jobName
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: jobNameLabel.bottom
        x: 112
        y: 50
        width: 296
        height: 40
        placeholderText: qsTr("--")
        horizontalAlignment: Text.AlignHCenter
        color: "#ffffff"
        Material.theme: "Dark"
    }

    Text {
        id: customerLabel
        anchors.horizontalCenter: parent.horizontalCenter

        anchors.top: jobName.bottom
        width: 102
        height: 18
        color: "#FFD81E"
        text: qsTr("Customer")
        font.bold: true
        font.pointSize: 12
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
    }

    TextField {
        id: customer
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: customerLabel.bottom
        width: 296
        height: 40
        placeholderText: qsTr("--")
        horizontalAlignment: Text.AlignHCenter
        color: "#ffffff"
        Material.theme: "Dark"
    }

    Text {
        id: firstAnchorLabel
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: customer.bottom
        width: 102
        height: 18
        color: "#FFD81E"
        text: qsTr("Enter Output Ratio")
        font.bold: true
        font.pointSize: 12
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
    }

    TextField {
        id: firstAnchor
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: firstAnchorLabel.bottom
        width: 296
        height: 40
        placeholderText: qsTr("--")
        validator: DoubleValidator{bottom: 1.00; top: 10.00;}
        horizontalAlignment: Text.AlignHCenter
        color: "#ffffff"
        Material.theme: "Dark"
    }

    /*Text {
        id: locationLabel
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: location.top
        width: 102
        height: 18
        color: "#FFD81E"
        text: qsTr("Location")
        font.bold: true
        font.pointSize: 12
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
    }

    TextField {
        id: location
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: 20
        width: 296
        height: 40
        placeholderText: qsTr("--")
        horizontalAlignment: Text.AlignHCenter
        color: "#ffffff"
    }*/

    Rectangle {
        id: bckgnd1
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.right: jobName.right
        anchors.top: firstAnchor.bottom
        anchors.topMargin: 5
        height: 124
        color: "#ffffff"
    }

    Rectangle {
        id: torqueUnitsRect
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: outStagesRect.bottom
        anchors.topMargin: 1
        anchors.right: jobName.right
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
            text: qsTr("--")
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
        anchors.right: jobName.right
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
            id: arrow2
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
    }

    Rectangle {
        id: depthIntRect
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: depthUnitsRect.bottom
        anchors.topMargin: 1
        anchors.right: jobName.right
        height: 35
        color: "#000000"
        Text {
            id: depthIntLabel
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 5
            text: qsTr("Depth Interval")
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
        }

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
            id: arrow3
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 5
            text: qsTr(">")
            font.pointSize: 12
            color: "#ffffff"
        }
    }*/

    Rectangle {
        id: loggingIntRect
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: torqueUnitsRect.bottom
        anchors.topMargin: 1
        anchors.right: jobName.right
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
            text: qsTr("--")
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

    MouseArea{
        id:loggingIntButton
        anchors.fill: loggingIntRect
    }

    Rectangle {
        id: outStagesRect
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: bckgnd1.top
        anchors.topMargin: 1
        anchors.right: jobName.right
        height: 40
        color: "#000000"
        Text {
            id: outStagesLabel
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 5
            text: qsTr("Output Stages")
            font.pointSize: 12
            color: "#ffffff"
        }

        Text {
            id: outStages
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 20
            text: qsTr("--")
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
        id: outStagesBtn
        anchors.fill: outStagesRect
    }

    Text {
        id: tarTorLabel
        anchors.verticalCenter: tarTor.verticalCenter
        anchors.left: customer.left
        anchors.top: loggingIntRect.bottom
        width: 102
        height: 18
        color: "#FFD81E"
        text: qsTr("Set Target Torque")
        font.bold: true
        font.pointSize: 12
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
    }

    TextField {
        id: tarTor
        anchors.top: bckgnd1.bottom
        anchors.topMargin: 15
        anchors.right: customer.right
        width: 110
        height: 40
        placeholderText: qsTr("--")
        horizontalAlignment: Text.AlignHCenter
        color: "#ffffff"
        Material.theme: "Dark"
        validator: IntValidator{bottom: 0; top: 1000000;}
    }

    /*Button {
                id: next
                text: "Next"
                enabled: false
                font.capitalization: Font.Capitalize
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: tarTor.bottom
                anchors.bottomMargin: 7
                display: AbstractButton.TextOnly
                Material.background: "#FFD81E"
                Material.theme: "Dark"
            }*/

    /*RoundButton {
                id: singleSpeed
                anchors.verticalCenter: twoSpeed.verticalCenter
                anchors.right: twoSpeed.left
                anchors.rightMargin: 40
                width: 68
                height: 66
                text: "RS"
                font.pointSize: 10
                Material.background: "#000000"
                contentItem: Text {
                    text: singleSpeed.text
                    font: singleSpeed.font
                    color: "#ffffff"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }

                Label {
                    id: singleSpeedLabel
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.bottom
                    width: 56
                    height: 33
                    text: qsTr("Single Speed")
                    font.pointSize: 11
                    font.family: "Arial"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    wrapMode: Text.WordWrap
                    color: "#ffffff"
                }
            }

            RoundButton {
                id: twoSpeed
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: driveSeriesLabel.bottom
                width: 68
                height: 66
                text: "RT"
                font.pointSize: 10
                Material.background: "#000000"
                contentItem: Text {
                    text: twoSpeed.text
                    font: twoSpeed.font
                    color: "#ffffff"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }
            Label {
                id: twoSpeedLabel
                anchors.horizontalCenter: twoSpeed.horizontalCenter
                anchors.top: twoSpeed.bottom
                anchors.bottomMargin: 10
                width: 55
                height: 32
                text: qsTr("Two Speed")
                font.pointSize: 11
                font.family: "Arial"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.WordWrap
                color: "#ffffff"
            }

            RoundButton {
                id: variableSpeed
                anchors.left: twoSpeed.right
                anchors.leftMargin: 40
                anchors.verticalCenter: twoSpeed.verticalCenter
                width: 63
                height: 66
                text: "RV"
                font.pointSize: 10
                Material.background: "#000000"
                contentItem: Text {
                    text: variableSpeed.text
                    font: variableSpeed.font
                    color: "#ffffff"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                Label {
                    id: variableSpeedLabel
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.bottom
                    width: 59
                    height: 33
                    text: qsTr("Variable Speed")
                    font.pointSize: 11
                    font.family: "Arial"
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    wrapMode: Text.WordWrap
                    color: "#ffffff"
                }
            }*/

    TextField {
        id: driveSerialNum
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: driveSerialNumLabel.bottom
        anchors.topMargin: 5
        width: 294
        height: 43
        anchors.horizontalCenterOffset: 5
        placeholderText: qsTr("--")
        horizontalAlignment: Text.AlignHCenter
        color: "#ffffff"
        Material.theme: "Dark"
        validator: IntValidator{bottom: 0; top: 1000000;}
    }

    Button {
        id: setupDone
        text: "Done"
        enabled: false
        font.capitalization: Font.Capitalize
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: driveSerialNum.bottom
        anchors.bottomMargin: 7
        display: AbstractButton.TextOnly
        Material.background: "#FFD81E"
        Material.theme: "Light"
    }

    Text {
        id: driveSerialNumLabel
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: tarTor.bottom
        anchors.topMargin: 15
        width: 102
        height: 19
        color: "#FFD81E"
        text: qsTr("Enter Serial Number")
        font.bold: true
        font.pointSize: 12
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
    }

    /*Text {
                id: driveSeriesLabel
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: tarTor.bottom
                anchors.topMargin: 10
                width: 153
                height: 23
                color: "#FFD81E"
                text: qsTr("Select Anchor Drive Series")
                font.bold: true
                font.pointSize: 12
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }

            Text {
                id: driveModelLabel
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: twoSpeedLabel.bottom
                anchors.topMargin: 15
                anchors.bottomMargin: 10
                width: 146
                height: 23
                color: "#FFD81E"
                text: qsTr("Select Anchor Drive Model")
                font.bold: true
                font.pointSize: 12
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }

    Tumbler {
        id: driveModelSelect
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: driveModelLabel.bottom
        anchors.verticalCenterOffset: 55
        //anchors.top: driveModelLabel.bottom
        anchors.topMargin: 5
        width: 170
        height: 115

        TumblerColumn {
            id: driveModelColumn
            width: driveModelSelect.width
            model:["RS-5", "RS-6", "RS-7", "RS-12", "RS-16"]
            /*columnForeground: Text {
                        id: modelText
                        text: driveModelColumn.model.text
                        color: "#ffffff"
                    }*/
    //}

    /*visible: false
        style: TumblerStyle {
            id: tumblerStyle
            delegate: Item {
                implicitHeight: (driveModelSelect.height - padding.top - padding.bottom) / tumblerStyle.visibleItemCount

                /*Text {
                                id: driveModelText
                                font.pointSize: 12
                                text: driveModelColumn.model
                                color: "#f26522"
                                anchors.centerIn: parent
                            }*/
    /*Text {
                    id: label
                    text: styleData.value
                    color: styleData.current ? "#FFD81E" : "#ffffff"
                    opacity: 0.4 + Math.max(0, 1 - Math.abs(styleData.displacement)) * 0.6
                    anchors.centerIn: parent
                }
            }
            background: Rectangle{
                color: "#000000"
            }
            frame: Rectangle{
                color: "#000000"
            }*/
    /*foreground: Text {
                        id: modelText
                        text: driveModelColumn.model
                        color: "#ffffff"
                    }*/
    //}
    //}
    /*}
    }*/
}


