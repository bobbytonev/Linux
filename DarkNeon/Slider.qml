import QtQuick 2.8
import QtQuick.Templates 2.1 as T
import QtQuick.Controls.Material 2.1

import Qt.labs.settings 1.1





T.Slider {
    id: control
padding: 6

property color ld:themeData.background[1]
	property color fore:themeData.foreground[1]
	


    background: Rectangle {
                          x: control.leftPadding
                          y: control.topPadding + control.availableHeight / 2 - height / 2
                          implicitWidth: 200
                          implicitHeight: 1
                          width: control.availableWidth
                          height: implicitHeight
                          radius: 2
                          color: "#717171"

                          Rectangle {
                              width: control.visualPosition * parent.width
                              height: parent.height
                              color:  fore//"#0080c0"
                              radius: 2
                          }
                      }

                      handle: Rectangle {


                          id:rectHandler
                          x: control.leftPadding + control.visualPosition * (control.availableWidth - width)
                          y: control.topPadding + control.availableHeight / 2 - height / 2
                         // color: control.pressed ? "white":"black"
                          //color:"black"
                         color:ld===undefined ?"black":ld//:"black"

                          implicitWidth: 24
                          implicitHeight: 24
                          radius: 13
                         // border.color:control.pressed? "black":"#0080c0"
                          border.color: fore//"#0080c0"
                            Rectangle{
                            width: control.pressed? rectHandler.width : 0
                            height: width
                           x:rectHandler.width/2-width/2
                           y:x
                           radius: 13
                            color:  fore//"#0080c0"
                            border.color: control.ld.hslLightness > 0.5 ? "black" :"white"//msg.colors[2]//"white"
                           Behavior on width {
                               NumberAnimation{duration: 100}
                           }

                          }
                      }
}
