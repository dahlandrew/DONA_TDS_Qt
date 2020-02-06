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
