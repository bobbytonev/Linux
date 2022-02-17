
import QtQuick 2.8
import QtQuick.Controls 2.1
import QtQuick.Controls.impl 2.1
import QtQuick.Templates 2.1 as T

T.TextField {
    id: control

    implicitWidth: Math.max(background ? background.implicitWidth : 0,
                            placeholderText ? placeholder.implicitWidth + leftPadding + rightPadding : 0)
                            || contentWidth + leftPadding + rightPadding
    implicitHeight: Math.max(contentHeight + topPadding + bottomPadding,
                             background ? background.implicitHeight : 0,
                             placeholder.implicitHeight + topPadding + bottomPadding)

   padding: 6
  property color ld:themeData.background[1]
	property color fore:themeData.foreground[1]
	property color press:themeData.pressed[1]

           leftPadding: padding + 4

           opacity: enabled ? 1 : 0.2
           color:control.ld.hslLightness > 0.5 ? "black" : "white"
           selectionColor:fore
           selectedTextColor: color
           verticalAlignment: TextInput.AlignVCenter
           font.pixelSize: control.height*0.20

           Text {
               id: placeholder
               x: control.leftPadding
               y: control.topPadding
               width: control.width - (control.leftPadding + control.rightPadding)
               height: control.height - (control.topPadding + control.bottomPadding)

               text: control.placeholderText
               font: control.font
               //color: Default.textDisabledColor
               horizontalAlignment: control.horizontalAlignment
               verticalAlignment: control.verticalAlignment
               visible: !control.length && !control.preeditText && (!control.activeFocus || control.horizontalAlignment !== Qt.AlignHCenter)
               elide: Text.ElideRight
               color:control.ld.hslLightness > 0.5 ? "black" : "white"
           }

           background: Rectangle {
               implicitWidth: 200
               implicitHeight: 40

               color: "transparent"
               Rectangle{

                   y:parent.height-1
                   x:parent.width/2-width/2
                   color:fore
                   width: control.activeFocus ? parent.width:0
                   height: 1
                    Behavior on width {
                        NumberAnimation{duration: 100}
                    }


               }

           }

    }
