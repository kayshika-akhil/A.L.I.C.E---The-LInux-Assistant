import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.0
import QtQuick.Controls.Material 2.0
import QtQuick.Controls.impl 2.3


Window {
    id: window
    width: 640
    height: 640
    visible: true
    color: "black"
    title: "A.L.I.C.E :-The Linux Assistant"

    SwipeView {
        id: view

        currentIndex: 0
        anchors.fill: parent
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0

        Item {
            id: firstPage

            AnimatedImage {
                id: animatedImage
                x: 8
                y: 108
                width: 624
                height: 406
                source: "../Downloads/d13449fb76b34cb71584f5bfb7c6dee9.gif"
                playing: false

                Text {
                    id: text6
                    x: 177
                    y: -77
                    width: 281
                    height: 81
                    color: "sky blue"
                    text: qsTr("A.L.I.C.E")
                    font.pixelSize: 73
                    styleColor: "#232326"
                    layer.enabled: true
                    layer.effect: Glow {
                        samples: 1
                        color: "sky blue"
                        transparentBorder: true
                    }
                }
            }

            Button {
                id: button
                x: 251
                y: 566
                width: 139
                height: 45
                text: qsTr("SPEAK")
                focus: true
                flat: false
                autoRepeat: false
                layer.enabled: true
                spacing: -9999999
                focusPolicy: Qt.StrongFocus
                highlighted: true






                background: Rectangle{
                    radius: 10
                    color: "black"
                    opacity: enabled ? 1 : 0.3
                    border.color: button.down ? "#009dff" : "#009dff"
                    border.width: 2


                    MouseArea {
                           anchors.fill: parent
                           hoverEnabled: true
                           onEntered:{ parent.color = 'sky blue' }
                           onExited: {parent.color = 'black'}
                           onClicked: {animatedImage.playing=true}
                       }

                }

            }
        }

        Item {
            id: secondPage

            TextField {
                id: textField
                x: 8
                y: 575
                width: 546
                height: 46
                placeholderTextColor: "#ffffff"
                font.pointSize: 13
                layer.smooth: true
                placeholderText: qsTr("Ask Que to Bot")


                background: Rectangle{
                    height: textField.height
                    width: textField.width
                    color: "black"
                    border.color: "#009dff"
                    border.width: 1

                }
            }

            AnimatedImage {
                id: animatedImage1
                x: 83
                y: 0
                width: 442
                height: 394
                source: "../Downloads/original.gif"
                antialiasing: true
                layer.enabled: true
                layer.smooth: true
                playing: false
            }

            RoundButton {
                id: roundButton1
                x: 580
                y: 575
                width: 46
                height: 46
                text: ""
                autoRepeat: false
                flat: true
                wheelEnabled: true

                layer.enabled: true
                focusPolicy: Qt.WheelFocus
                highlighted: true
                icon.name: "submit"
                icon.source: "/home/kayshika/Downloads/compass.svg"


                background: Rectangle{
                    radius: roundButton1.radius
                    color: "black"
                    border.color: "#009dff"
                    border.width: 2


                    MouseArea{
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered:{ parent.color = 'sky blue' }
                        onExited: {parent.color = 'black'}
                        onClicked: animatedImage1.playing=true
                    }




                    BorderImage {
                        id: name
                        width: 100; height: 100
                        border.left: 5; border.top: 5
                        border.right: 5; border.bottom: 5
                    }

                }



            }

            ScrollView {
                id: scrollView
                x: 8
                y: 413
                width: 546
                height: 156
                ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
                ScrollBar.vertical.policy: ScrollBar.AlwaysOn
                ScrollBar.horizontal.interactive: true
                ScrollBar.vertical.interactive: true


                background: Rectangle{
                    width: scrollView.width
                    height: scrollView.height
                    color: "black"
                    border.color: "#009dff"
                }
            }
        }
        Item {
            id: thirdPage

            Image {
                id: image
                x: 8
                y: 8
                width: 119
                height: 105
                source: "../Downloads/private-instruction-icon-hangar-18-indoor-climbing-gyms-instruction-png-300_300.png"
                fillMode: Image.PreserveAspectFit
            }

            Text {
                id: text1
                x: 133
                y: 16
                width: 367
                height: 97
                color: "sky blue"
                text: qsTr("Instructions:-")
                font.pixelSize: 65
                font.bold: false
            }

            Text {
                id: text3
                x: 8
                y: 130
                width: 603
                height: 19
                color: "white"
                text: qsTr("1. Before you use Alice The LInux Assitant you want to know something. ")
                font.pixelSize: 17
            }

            Text {
                id: text4
                x: 8
                y: 155
                width: 603
                height: 19
                color: "white"
                text: qsTr("2. Click on the Speak button to start the assitant.")
                font.pixelSize: 17
            }

            Text {
                id: text5
                x: 8
                y: 180
                width: 603
                height: 23
                color: "white"
                text: qsTr("3. You can gives the commad with microphone or without .")
                font.pixelSize: 18
                styleColor: "#232326"
            }
        }
        Item {
            id: fourthpage
        }

    }

    PageIndicator {
        id: indicator

        count: view.count

        anchors.bottom: view.bottom
        hoverEnabled: true
        interactive: false
        currentIndex: view.currentIndex
        anchors.horizontalCenter: parent.horizontalCenter


    }

}
