import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.3
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0
import QtQuick.Shapes 1.12
import QtCharts 2.3


Item {
    id: svdJbs
    width: 400
    height: 520
    anchors.fill: parent

    property alias bckgnd1: bckgnd1
    property alias frstDate: frstDate
    property alias frstJS: frstJS
    property alias frstBtn: frstBtn
    property alias frstRect: frstRect
    property alias scndJS: scndJS
    property alias scndBtn: scndBtn
    property alias scndDate: scndDate
    property alias scndRect: scndRect
    property alias thrdJS: thrdJS
    property alias thrdBtn: thrdBtn
    property alias thrdDate: thrdDate
    property alias thrdRect: thrdRect
    property alias frthJS: frthJS
    property alias frthBtn: frthBtn
    property alias frthDate: frthDate
    property alias frthRect: frthRect
    property alias ffthJS: ffthJS
    property alias ffthBtn: ffthBtn
    property alias ffthDate: ffthDate
    property alias ffthRect: ffthRect
    property alias sxthJS: sxthJS
    property alias sxthBtn: sxthBtn
    property alias sxthDate: sxthDate
    property alias sxthRect: sxthRect
    property alias svnthJS: svnthJS
    property alias svnthBtn: svnthBtn
    property alias svnthDate: svnthDate
    property alias svnthRect: svnthRect
    property alias eighthJS: eighthJS
    property alias eighthBtn: eighthBtn
    property alias eighthDate: eighthDate
    property alias eighthRect: eighthRect
    property alias nnthJS: nnthJS
    property alias nnthBtn: nnthBtn
    property alias nnthDate: nnthDate
    property alias nnthRect: nnthRect
    property alias tnthJS: tnthJS
    property alias tnthBtn: tnthBtn
    property alias tnthDate: tnthDate
    property alias tnthRect: tnthRect
    property alias centerPop: centerPop
    property alias remove: remove
    property alias send: send
    property alias view: view
    property alias centerPop2: centerPop2
    property alias remove2: remove2
    property alias send2: send2
    property alias view2: view2
    property alias centerPop3: centerPop3
    property alias remove3: remove3
    property alias send3: send3
    property alias view3: view3
    property alias centerPop4: centerPop4
    property alias remove4: remove4
    property alias send4: send4
    property alias view4: view4
    property alias centerPop5: centerPop5
    property alias remove5: remove5
    property alias send5: send5
    property alias view5: view5
    property alias centerPop6: centerPop6
    property alias remove6: remove6
    property alias send6: send6
    property alias view6: view6
    property alias centerPop7: centerPop7
    property alias remove7: remove7
    property alias send7: send7
    property alias view7: view7
    property alias centerPop8: centerPop8
    property alias remove8: remove8
    property alias send8: send8
    property alias view8: view8
    property alias centerPop9: centerPop9
    property alias remove9: remove9
    property alias send9: send9
    property alias view9: view9
    property alias centerPop10: centerPop10
    property alias remove10: remove10
    property alias send10: send10
    property alias view10: view10
    property alias batteryInd: batteryInd
    property alias batteryAmnt: batteryAmnt


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
            startX: ((svdJbs.width/2)-25); startY: 75
            PathLine { x: (svdJbs.width/2)+10; y: 45}
            PathLine { x: ((svdJbs.width/2)-25); y: 45 }
            PathLine { x: ((svdJbs.width/2)-25); y: 75 }
        }
    }

    /*Rectangle {
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
            startX: ((svdJbs.width/2)+25); startY: (svdJbs.height - 75)
            PathLine { x: (svdJbs.width/2)-10; y: (svdJbs.height - 45)}
            PathLine { x: ((svdJbs.width/2)+25); y: (svdJbs.height - 45)}
            PathLine { x: ((svdJbs.width/2)+25); y: (svdJbs.height - 75)}
        }
    }*/

    Image {
        id: batteryInd
        height: 19
        width: 37
        anchors.bottom: topLeftBorder.bottom
        anchors.bottomMargin: 6
        anchors.left: svdJbs.left
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

    Popup {
        id: centerPop
        anchors.centerIn: svdJbs
        height: 150
        width: 250
        dim: true
        contentItem:
            Item {
            id: baseItem
            anchors.fill: centerPop
            Button {
                id: view
                anchors.bottom: baseItem.bottom
                anchors.right: send.left
                anchors.rightMargin: 5
                Material.background: "#000000"
                text: qsTr("View")
                contentItem: Text {
                    text: view.text
                    font: view.font
                    color: "#ffffff"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }
            Button {
                id: send
                anchors.bottom: baseItem.bottom
                anchors.horizontalCenter: baseItem.horizontalCenter
                anchors.rightMargin: 10
                Material.background: "#000000"
                text: qsTr("email")
                contentItem: Text {
                    text: send.text
                    font: send.font
                    color: "#ffffff"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }
            Button {
                id: remove
                anchors.bottom: baseItem.bottom
                anchors.left: send.right
                anchors.leftMargin: 5
                Material.background: "#000000"
                text: qsTr("Remove")
                contentItem: Text {
                    text: remove.text
                    font: remove.font
                    color: "#ffffff"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }

            Rectangle {
                anchors.horizontalCenter: baseItem.horizontalCenter
                anchors.left: baseItem.left
                anchors.leftMargin: 10
                anchors.bottom: send.top
                anchors.bottomMargin: 5
                height: 1
                color: "#ffffff"
            }

            Text {
                id: cenQues
                text: qsTr("What would you like to do?")
                font.family: "Arial"
                font.pointSize: 10
                color: "#ffffff"
                anchors.horizontalCenter: baseItem.horizontalCenter
                anchors.bottom: send.top
                anchors.bottomMargin: 15
            }

            Text {
                id: cenTitle
                text: qsTr("Saved Jobs Menu")
                font.family: "Arial"
                font.pointSize: 10
                font.bold: true
                color: "#ffffff"
                anchors.horizontalCenter: baseItem.horizontalCenter
                anchors.bottom: cenQues.top
                anchors.bottomMargin: 15
            }
        }
    }

    Popup {
        id: centerPop2
        anchors.centerIn: svdJbs
        height: 150
        width: 250
        dim: true
        contentItem:
            Item {
            id: baseItem2
            anchors.fill: centerPop2
            Button {
                id: view2
                anchors.bottom: baseItem2.bottom
                anchors.right: send2.left
                anchors.rightMargin: 5
                Material.background: "#000000"
                text: qsTr("View")
                contentItem: Text {
                    text: view2.text
                    font: view2.font
                    color: "#ffffff"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }
            Button {
                id: send2
                anchors.bottom: baseItem2.bottom
                anchors.horizontalCenter: baseItem2.horizontalCenter
                anchors.rightMargin: 10
                Material.background: "#000000"
                text: qsTr("email")
                contentItem: Text {
                    text: send2.text
                    font: send2.font
                    color: "#ffffff"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }
            Button {
                id: remove2
                anchors.bottom: baseItem2.bottom
                anchors.left: send2.right
                anchors.leftMargin: 5
                Material.background: "#000000"
                text: qsTr("Remove")
                contentItem: Text {
                    text: remove2.text
                    font: remove2.font
                    color: "#ffffff"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }

            Rectangle {
                anchors.horizontalCenter: baseItem2.horizontalCenter
                anchors.left: baseItem2.left
                anchors.leftMargin: 10
                anchors.bottom: send2.top
                anchors.bottomMargin: 5
                height: 1
                color: "#ffffff"
            }

            Text {
                id: cenQues2
                text: qsTr("What would you like to do?")
                font.family: "Arial"
                font.pointSize: 10
                color: "#ffffff"
                anchors.horizontalCenter: baseItem2.horizontalCenter
                anchors.bottom: send2.top
                anchors.bottomMargin: 15
            }

            Text {
                id: cenTitle2
                text: qsTr("Saved Jobs Menu")
                font.family: "Arial"
                font.pointSize: 10
                font.bold: true
                color: "#ffffff"
                anchors.horizontalCenter: baseItem2.horizontalCenter
                anchors.bottom: cenQues2.top
                anchors.bottomMargin: 15
            }
        }
    }
    Popup {
        id: centerPop3
        anchors.centerIn: svdJbs
        height: 150
        width: 250
        dim: true
        contentItem:
            Item {
            id: baseItem3
            anchors.fill: centerPop3
            Button {
                id: view3
                anchors.bottom: baseItem3.bottom
                anchors.right: send3.left
                anchors.rightMargin: 5
                Material.background: "#000000"
                text: qsTr("View")
                contentItem: Text {
                    text: view3.text
                    font: view3.font
                    color: "#ffffff"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }
            Button {
                id: send3
                anchors.bottom: baseItem3.bottom
                anchors.horizontalCenter: baseItem3.horizontalCenter
                anchors.rightMargin: 10
                Material.background: "#000000"
                text: qsTr("email")
                contentItem: Text {
                    text: send3.text
                    font: send3.font
                    color: "#ffffff"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }
            Button {
                id: remove3
                anchors.bottom: baseItem3.bottom
                anchors.left: send3.right
                anchors.leftMargin: 5
                Material.background: "#000000"
                text: qsTr("Remove")
                contentItem: Text {
                    text: remove3.text
                    font: remove3.font
                    color: "#ffffff"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }

            Rectangle {
                anchors.horizontalCenter: baseItem3.horizontalCenter
                anchors.left: baseItem3.left
                anchors.leftMargin: 10
                anchors.bottom: send3.top
                anchors.bottomMargin: 5
                height: 1
                color: "#ffffff"
            }

            Text {
                id: cenQues3
                text: qsTr("What would you like to do?")
                font.family: "Arial"
                font.pointSize: 10
                color: "#ffffff"
                anchors.horizontalCenter: baseItem3.horizontalCenter
                anchors.bottom: send3.top
                anchors.bottomMargin: 15
            }

            Text {
                id: cenTitle3
                text: qsTr("Saved Jobs Menu")
                font.family: "Arial"
                font.pointSize: 10
                font.bold: true
                color: "#ffffff"
                anchors.horizontalCenter: baseItem3.horizontalCenter
                anchors.bottom: cenQues3.top
                anchors.bottomMargin: 15
            }
        }
    }

    Popup {
        id: centerPop4
        anchors.centerIn: svdJbs
        height: 150
        width: 250
        dim: true
        contentItem:
            Item {
            id: baseItem4
            anchors.fill: centerPop4
            Button {
                id: view4
                anchors.bottom: baseItem4.bottom
                anchors.right: send4.left
                anchors.rightMargin: 5
                Material.background: "#000000"
                text: qsTr("View")
                contentItem: Text {
                    text: view4.text
                    font: view4.font
                    color: "#ffffff"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }
            Button {
                id: send4
                anchors.bottom: baseItem4.bottom
                anchors.horizontalCenter: baseItem4.horizontalCenter
                anchors.rightMargin: 10
                Material.background: "#000000"
                text: qsTr("email")
                contentItem: Text {
                    text: send4.text
                    font: send4.font
                    color: "#ffffff"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }
            Button {
                id: remove4
                anchors.bottom: baseItem4.bottom
                anchors.left: send4.right
                anchors.leftMargin: 5
                Material.background: "#000000"
                text: qsTr("Remove")
                contentItem: Text {
                    text: remove4.text
                    font: remove4.font
                    color: "#ffffff"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }

            Rectangle {
                anchors.horizontalCenter: baseItem4.horizontalCenter
                anchors.left: baseItem4.left
                anchors.leftMargin: 10
                anchors.bottom: send4.top
                anchors.bottomMargin: 5
                height: 1
                color: "#ffffff"
            }

            Text {
                id: cenQues4
                text: qsTr("What would you like to do?")
                font.family: "Arial"
                font.pointSize: 10
                color: "#ffffff"
                anchors.horizontalCenter: baseItem4.horizontalCenter
                anchors.bottom: send4.top
                anchors.bottomMargin: 15
            }

            Text {
                id: cenTitle4
                text: qsTr("Saved Jobs Menu")
                font.family: "Arial"
                font.pointSize: 10
                font.bold: true
                color: "#ffffff"
                anchors.horizontalCenter: baseItem4.horizontalCenter
                anchors.bottom: cenQues4.top
                anchors.bottomMargin: 15
            }
        }
    }

    Popup {
        id: centerPop5
        anchors.centerIn: svdJbs
        height: 150
        width: 250
        dim: true
        contentItem:
            Item {
            id: baseItem5
            anchors.fill: centerPop5
            Button {
                id: view5
                anchors.bottom: baseItem5.bottom
                anchors.right: send5.left
                anchors.rightMargin: 5
                Material.background: "#000000"
                text: qsTr("View")
                contentItem: Text {
                    text: view5.text
                    font: view5.font
                    color: "#ffffff"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }
            Button {
                id: send5
                anchors.bottom: baseItem5.bottom
                anchors.horizontalCenter: baseItem5.horizontalCenter
                anchors.rightMargin: 10
                Material.background: "#000000"
                text: qsTr("email")
                contentItem: Text {
                    text: send5.text
                    font: send5.font
                    color: "#ffffff"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }
            Button {
                id: remove5
                anchors.bottom: baseItem5.bottom
                anchors.left: send5.right
                anchors.leftMargin: 5
                Material.background: "#000000"
                text: qsTr("Remove")
                contentItem: Text {
                    text: remove5.text
                    font: remove5.font
                    color: "#ffffff"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }

            Rectangle {
                anchors.horizontalCenter: baseItem5.horizontalCenter
                anchors.left: baseItem5.left
                anchors.leftMargin: 10
                anchors.bottom: send5.top
                anchors.bottomMargin: 5
                height: 1
                color: "#ffffff"
            }

            Text {
                id: cenQues5
                text: qsTr("What would you like to do?")
                font.family: "Arial"
                font.pointSize: 10
                color: "#ffffff"
                anchors.horizontalCenter: baseItem5.horizontalCenter
                anchors.bottom: send5.top
                anchors.bottomMargin: 15
            }

            Text {
                id: cenTitle5
                text: qsTr("Saved Jobs Menu")
                font.family: "Arial"
                font.pointSize: 10
                font.bold: true
                color: "#ffffff"
                anchors.horizontalCenter: baseItem5.horizontalCenter
                anchors.bottom: cenQues5.top
                anchors.bottomMargin: 15
            }
        }
    }

    Popup {
        id: centerPop6
        anchors.centerIn: svdJbs
        height: 150
        width: 250
        dim: true
        contentItem:
            Item {
            id: baseItem6
            anchors.fill: centerPop6
            Button {
                id: view6
                anchors.bottom: baseItem6.bottom
                anchors.right: send6.left
                anchors.rightMargin: 5
                Material.background: "#000000"
                text: qsTr("View")
                contentItem: Text {
                    text: view6.text
                    font: view6.font
                    color: "#ffffff"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }
            Button {
                id: send6
                anchors.bottom: baseItem6.bottom
                anchors.horizontalCenter: baseItem6.horizontalCenter
                anchors.rightMargin: 10
                Material.background: "#000000"
                text: qsTr("email")
                contentItem: Text {
                    text: send6.text
                    font: send6.font
                    color: "#ffffff"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }
            Button {
                id: remove6
                anchors.bottom: baseItem6.bottom
                anchors.left: send6.right
                anchors.leftMargin: 5
                Material.background: "#000000"
                text: qsTr("Remove")
                contentItem: Text {
                    text: remove6.text
                    font: remove6.font
                    color: "#ffffff"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }

            Rectangle {
                anchors.horizontalCenter: baseItem6.horizontalCenter
                anchors.left: baseItem6.left
                anchors.leftMargin: 10
                anchors.bottom: send6.top
                anchors.bottomMargin: 5
                height: 1
                color: "#ffffff"
            }

            Text {
                id: cenQues6
                text: qsTr("What would you like to do?")
                font.family: "Arial"
                font.pointSize: 10
                color: "#ffffff"
                anchors.horizontalCenter: baseItem6.horizontalCenter
                anchors.bottom: send6.top
                anchors.bottomMargin: 15
            }

            Text {
                id: cenTitle6
                text: qsTr("Saved Jobs Menu")
                font.family: "Arial"
                font.pointSize: 10
                font.bold: true
                color: "#ffffff"
                anchors.horizontalCenter: baseItem6.horizontalCenter
                anchors.bottom: cenQues6.top
                anchors.bottomMargin: 15
            }
        }
    }
    Popup {
        id: centerPop7
        anchors.centerIn: svdJbs
        height: 150
        width: 250
        dim: true
        contentItem:
            Item {
            id: baseItem7
            anchors.fill: centerPop7
            Button {
                id: view7
                anchors.bottom: baseItem7.bottom
                anchors.right: send7.left
                anchors.rightMargin: 5
                Material.background: "#000000"
                text: qsTr("View")
                contentItem: Text {
                    text: view7.text
                    font: view7.font
                    color: "#ffffff"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }
            Button {
                id: send7
                anchors.bottom: baseItem7.bottom
                anchors.horizontalCenter: baseItem7.horizontalCenter
                anchors.rightMargin: 10
                Material.background: "#000000"
                text: qsTr("email")
                contentItem: Text {
                    text: send7.text
                    font: send7.font
                    color: "#ffffff"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }
            Button {
                id: remove7
                anchors.bottom: baseItem7.bottom
                anchors.left: send7.right
                anchors.leftMargin: 5
                Material.background: "#000000"
                text: qsTr("Remove")
                contentItem: Text {
                    text: remove7.text
                    font: remove7.font
                    color: "#ffffff"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }

            Rectangle {
                anchors.horizontalCenter: baseItem7.horizontalCenter
                anchors.left: baseItem7.left
                anchors.leftMargin: 10
                anchors.bottom: send7.top
                anchors.bottomMargin: 5
                height: 1
                color: "#ffffff"
            }

            Text {
                id: cenQues7
                text: qsTr("What would you like to do?")
                font.family: "Arial"
                font.pointSize: 10
                color: "#ffffff"
                anchors.horizontalCenter: baseItem7.horizontalCenter
                anchors.bottom: send7.top
                anchors.bottomMargin: 15
            }

            Text {
                id: cenTitle7
                text: qsTr("Saved Jobs Menu")
                font.family: "Arial"
                font.pointSize: 10
                font.bold: true
                color: "#ffffff"
                anchors.horizontalCenter: baseItem7.horizontalCenter
                anchors.bottom: cenQues7.top
                anchors.bottomMargin: 15
            }
        }
    }
    Popup {
        id: centerPop8
        anchors.centerIn: svdJbs
        height: 150
        width: 250
        dim: true
        contentItem:
            Item {
            id: baseItem8
            anchors.fill: centerPop8
            Button {
                id: view8
                anchors.bottom: baseItem8.bottom
                anchors.right: send8.left
                anchors.rightMargin: 5
                Material.background: "#000000"
                text: qsTr("View")
                contentItem: Text {
                    text: view8.text
                    font: view8.font
                    color: "#ffffff"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }
            Button {
                id: send8
                anchors.bottom: baseItem8.bottom
                anchors.horizontalCenter: baseItem8.horizontalCenter
                anchors.rightMargin: 10
                Material.background: "#000000"
                text: qsTr("email")
                contentItem: Text {
                    text: send8.text
                    font: send8.font
                    color: "#ffffff"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }
            Button {
                id: remove8
                anchors.bottom: baseItem8.bottom
                anchors.left: send8.right
                anchors.leftMargin: 5
                Material.background: "#000000"
                text: qsTr("Remove")
                contentItem: Text {
                    text: remove8.text
                    font: remove8.font
                    color: "#ffffff"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }

            Rectangle {
                anchors.horizontalCenter: baseItem8.horizontalCenter
                anchors.left: baseItem8.left
                anchors.leftMargin: 10
                anchors.bottom: send8.top
                anchors.bottomMargin: 5
                height: 1
                color: "#ffffff"
            }

            Text {
                id: cenQues8
                text: qsTr("What would you like to do?")
                font.family: "Arial"
                font.pointSize: 10
                color: "#ffffff"
                anchors.horizontalCenter: baseItem8.horizontalCenter
                anchors.bottom: send8.top
                anchors.bottomMargin: 15
            }

            Text {
                id: cenTitle8
                text: qsTr("Saved Jobs Menu")
                font.family: "Arial"
                font.pointSize: 10
                font.bold: true
                color: "#ffffff"
                anchors.horizontalCenter: baseItem8.horizontalCenter
                anchors.bottom: cenQues8.top
                anchors.bottomMargin: 15
            }
        }
    }

    Popup {
        id: centerPop9
        anchors.centerIn: svdJbs
        height: 150
        width: 250
        dim: true
        contentItem:
            Item {
            id: baseItem9
            anchors.fill: centerPop9
            Button {
                id: view9
                anchors.bottom: baseItem9.bottom
                anchors.right: send9.left
                anchors.rightMargin: 5
                Material.background: "#000000"
                text: qsTr("View")
                contentItem: Text {
                    text: view9.text
                    font: view9.font
                    color: "#ffffff"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }
            Button {
                id: send9
                anchors.bottom: baseItem9.bottom
                anchors.horizontalCenter: baseItem9.horizontalCenter
                anchors.rightMargin: 10
                Material.background: "#000000"
                text: qsTr("email")
                contentItem: Text {
                    text: send9.text
                    font: send9.font
                    color: "#ffffff"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }
            Button {
                id: remove9
                anchors.bottom: baseItem9.bottom
                anchors.left: send9.right
                anchors.leftMargin: 5
                Material.background: "#000000"
                text: qsTr("Remove")
                contentItem: Text {
                    text: remove9.text
                    font: remove9.font
                    color: "#ffffff"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }

            Rectangle {
                anchors.horizontalCenter: baseItem9.horizontalCenter
                anchors.left: baseItem9.left
                anchors.leftMargin: 10
                anchors.bottom: send9.top
                anchors.bottomMargin: 5
                height: 1
                color: "#ffffff"
            }

            Text {
                id: cenQues9
                text: qsTr("What would you like to do?")
                font.family: "Arial"
                font.pointSize: 10
                color: "#ffffff"
                anchors.horizontalCenter: baseItem9.horizontalCenter
                anchors.bottom: send9.top
                anchors.bottomMargin: 15
            }

            Text {
                id: cenTitle9
                text: qsTr("Saved Jobs Menu")
                font.family: "Arial"
                font.pointSize: 10
                font.bold: true
                color: "#ffffff"
                anchors.horizontalCenter: baseItem9.horizontalCenter
                anchors.bottom: cenQues9.top
                anchors.bottomMargin: 15
            }
        }
    }

    Popup {
        id: centerPop10
        anchors.centerIn: svdJbs
        height: 150
        width: 250
        dim: true
        contentItem:
            Item {
            id: baseItem10
            anchors.fill: centerPop10
            Button {
                id: view10
                anchors.bottom: baseItem10.bottom
                anchors.right: send10.left
                anchors.rightMargin: 5
                Material.background: "#000000"
                text: qsTr("View")
                contentItem: Text {
                    text: view10.text
                    font: view10.font
                    color: "#ffffff"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }
            Button {
                id: send10
                anchors.bottom: baseItem10.bottom
                anchors.horizontalCenter: baseItem10.horizontalCenter
                anchors.rightMargin: 10
                Material.background: "#000000"
                text: qsTr("email")
                contentItem: Text {
                    text: send10.text
                    font: send10.font
                    color: "#ffffff"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }
            Button {
                id: remove10
                anchors.bottom: baseItem10.bottom
                anchors.left: send10.right
                anchors.leftMargin: 5
                Material.background: "#000000"
                text: qsTr("Remove")
                contentItem: Text {
                    text: remove10.text
                    font: remove10.font
                    color: "#ffffff"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }

            Rectangle {
                anchors.horizontalCenter: baseItem10.horizontalCenter
                anchors.left: baseItem10.left
                anchors.leftMargin: 10
                anchors.bottom: send10.top
                anchors.bottomMargin: 5
                height: 1
                color: "#ffffff"
            }

            Text {
                id: cenQues10
                text: qsTr("What would you like to do?")
                font.family: "Arial"
                font.pointSize: 10
                color: "#ffffff"
                anchors.horizontalCenter: baseItem10.horizontalCenter
                anchors.bottom: send10.top
                anchors.bottomMargin: 15
            }

            Text {
                id: cenTitle10
                text: qsTr("Saved Jobs Menu")
                font.family: "Arial"
                font.pointSize: 10
                font.bold: true
                color: "#ffffff"
                anchors.horizontalCenter: baseItem10.horizontalCenter
                anchors.bottom: cenQues10.top
                anchors.bottomMargin: 15
            }
        }
    }

    Rectangle {
        id: bckgnd1
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.top: topLeftBorder.bottom
        anchors.topMargin: 15
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
            id: frstJS
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.leftMargin: 5
            text: qsTr("Job Site 25")
            font.pointSize: 12
            color: "#ffffff"
        }

        Text {
            id: frstDate
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.leftMargin: 5
            text: qsTr("07-12-19")
            font.pointSize: 10
            color: "#ffffff"
        }

        Text {
            id: frstArrw
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 5
            text: qsTr(">")
            font.pointSize: 16
            font.bold: true
            color: "#ffffff"
        }
    }

    MouseArea {
        id: frstBtn
        anchors.fill: frstRect
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
            id: scndJS
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.leftMargin: 5
            text: qsTr("Job Site 45")
            font.pointSize: 12
            color: "#ffffff"
        }

        Text {
            id: scndDate
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.leftMargin: 5
            text: qsTr("07-20-19")
            font.pointSize: 10
            color: "#ffffff"
        }

        Text {
            id: scndArrw
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 5
            text: qsTr(">")
            font.pointSize: 16
            font.bold: true
            color: "#ffffff"
        }
    }

    MouseArea {
        id: scndBtn
        anchors.fill: scndRect
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
            id: thrdJS
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.leftMargin: 5
            text: qsTr("Job Site 125")
            font.pointSize: 12
            color: "#ffffff"
        }

        Text {
            id: thrdDate
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.leftMargin: 5
            text: qsTr("07-30-19")
            font.pointSize: 10
            color: "#ffffff"
        }

        Text {
            id: thrdArrw
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 5
            text: qsTr(">")
            font.pointSize: 16
            font.bold: true
            color: "#ffffff"
        }
    }

    MouseArea {
        id: thrdBtn
        anchors.fill: thrdRect
    }

    Rectangle {
        id: frthRect
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: thrdRect.bottom
        anchors.topMargin: 1
        anchors.right: bckgnd1.right
        height: 40
        color: "#000000"

        Text {
            id: frthJS
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.leftMargin: 5
            text: qsTr("Job Site 25")
            font.pointSize: 12
            color: "#ffffff"
        }

        Text {
            id: frthDate
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.leftMargin: 5
            text: qsTr("07-12-19")
            font.pointSize: 10
            color: "#ffffff"
        }

        Text {
            id: frthArrw
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 5
            text: qsTr(">")
            font.pointSize: 16
            font.bold: true
            color: "#ffffff"
        }
    }

    MouseArea {
        id: frthBtn
        anchors.fill: frthRect
    }

    Rectangle {
        id: ffthRect
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: frthRect.bottom
        anchors.topMargin: 1
        anchors.right: bckgnd1.right
        height: 40
        color: "#000000"

        Text {
            id: ffthJS
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.leftMargin: 5
            text: qsTr("Job Site 45")
            font.pointSize: 12
            color: "#ffffff"
        }

        Text {
            id: ffthDate
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.leftMargin: 5
            text: qsTr("07-20-19")
            font.pointSize: 10
            color: "#ffffff"
        }

        Text {
            id: ffthArrw
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 5
            text: qsTr(">")
            font.pointSize: 16
            font.bold: true
            color: "#ffffff"
        }
    }

    MouseArea {
        id: ffthBtn
        anchors.fill: ffthRect
    }

    Rectangle {
        id: sxthRect
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: ffthRect.bottom
        anchors.topMargin: 1
        anchors.right: bckgnd1.right
        height: 40
        color: "#000000"

        Text {
            id: sxthJS
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.leftMargin: 5
            text: qsTr("Job Site 125")
            font.pointSize: 12
            color: "#ffffff"
        }

        Text {
            id: sxthDate
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.leftMargin: 5
            text: qsTr("07-30-19")
            font.pointSize: 10
            color: "#ffffff"
        }

        Text {
            id: sxthArrw
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 5
            text: qsTr(">")
            font.pointSize: 16
            font.bold: true
            color: "#ffffff"
        }
    }

    MouseArea {
        id: sxthBtn
        anchors.fill: sxthRect
    }

    Rectangle {
        id: svnthRect
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: sxthRect.bottom
        anchors.topMargin: 1
        anchors.right: bckgnd1.right
        height: 40
        color: "#000000"

        Text {
            id: svnthJS
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.leftMargin: 5
            text: qsTr("Job Site 25")
            font.pointSize: 12
            color: "#ffffff"
        }

        Text {
            id: svnthDate
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.leftMargin: 5
            text: qsTr("07-12-19")
            font.pointSize: 10
            color: "#ffffff"
        }

        Text {
            id: svnthArrw
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 5
            text: qsTr(">")
            font.pointSize: 16
            font.bold: true
            color: "#ffffff"
        }
    }

    MouseArea {
        id: svnthBtn
        anchors.fill: svnthRect
    }

    Rectangle {
        id: eighthRect
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: svnthRect.bottom
        anchors.topMargin: 1
        anchors.right: bckgnd1.right
        height: 40
        color: "#000000"

        Text {
            id: eighthJS
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.leftMargin: 5
            text: qsTr("Job Site 45")
            font.pointSize: 12
            color: "#ffffff"
        }

        Text {
            id: eighthDate
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.leftMargin: 5
            text: qsTr("07-20-19")
            font.pointSize: 10
            color: "#ffffff"
        }

        Text {
            id: eighthArrw
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 5
            text: qsTr(">")
            font.pointSize: 16
            font.bold: true
            color: "#ffffff"
        }
    }

    MouseArea {
        id: eighthBtn
        anchors.fill: eighthRect
    }


    Rectangle {
        id: nnthRect
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: eighthRect.bottom
        anchors.topMargin: 1
        anchors.right: bckgnd1.right
        height: 40
        color: "#000000"

        Text {
            id: nnthJS
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.leftMargin: 5
            text: qsTr("Job Site 125")
            font.pointSize: 12
            color: "#ffffff"
        }

        Text {
            id: nnthDate
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.leftMargin: 5
            text: qsTr("07-30-19")
            font.pointSize: 10
            color: "#ffffff"
        }

        Text {
            id: nnthArrw
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 5
            text: qsTr(">")
            font.pointSize: 16
            font.bold: true
            color: "#ffffff"
        }
    }

    MouseArea {
        id: nnthBtn
        anchors.fill: nnthRect
    }

    Rectangle {
        id: tnthRect
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: nnthRect.bottom
        anchors.topMargin: 1
        anchors.right: bckgnd1.right
        height: 40
        color: "#000000"

        Text {
            id: tnthJS
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.leftMargin: 5
            text: qsTr("Job Site 25")
            font.pointSize: 12
            color: "#ffffff"
        }

        Text {
            id: tnthDate
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.leftMargin: 5
            text: qsTr("07-12-19")
            font.pointSize: 10
            color: "#ffffff"
        }

        Text {
            id: tnthArrw
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 5
            text: qsTr(">")
            font.pointSize: 16
            font.bold: true
            color: "#ffffff"
        }
    }

    MouseArea {
        id: tnthBtn
        anchors.fill: tnthRect
    }
}
