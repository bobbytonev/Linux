import QtQuick 2.8
import QtQuick.Templates 2.1 as T
import QtQuick.Controls 2.1
import QtQuick.Controls.impl 2.1

T.CheckBox {
    id: control

    implicitWidth: Math.max(background ? background.implicitWidth : 0,
                            contentItem.implicitWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(background ? background.implicitHeight : 0,
                             Math.max(contentItem.implicitHeight,
                                      indicator ? indicator.implicitHeight : 0) + topPadding + bottomPadding)
    baselineOffset: contentItem.y + contentItem.baselineOffset

    padding: 6
    spacing: 6
	
	
	
		
	property color ld:themeData.background[1]
	property color fore:themeData.foreground[1]
//font.family: tcm.theme[0];
    background: Rectangle{
    color:themeData.pressed[1]//"#1d1d1d"
    opacity: control.down ? 0.5:0
    Behavior on opacity {
    NumberAnimation {duration:100}
    }
    }
   // onCheckedChanged: {
      //  if(control.checked){
         //  backgroundIndicator.width=background.width
          // backgroundIndicator.width= control.indicator.width

            //animation.from=0
            //animation.to=background.width
            //animation.start()
       // }else{
            //animation.from=backgroundIndicator.width
             //animation.to=0
            //animation.start()


           // backgroundIndicator.width=0
       // }

   // }

    indicator: Rectangle {
       // id:background
            implicitWidth: 26
            implicitHeight: 26
            x: (parent.width-control.indicator.width)-16//control.leftPadding
            y: parent.height / 2 - height / 2
            radius: 12
            color:ld//"black"
            border.color: fore//"#0080c0"

            Rectangle {
            // id:backgroundIndicator
                width: control.checked ? parent.width : 0
                height:width
                x:control.indicator.width/2-width/2
                y: x
                radius: 12
                color: fore//"#0080c0"
                border.color:control.ld.hslLightness > 0.5 ? "black" :"white"
            //    visible: control.checked
                Behavior on width {
                    NumberAnimation{duration:100}
                }
            }
        }
contentItem: Text {
		leftPadding: 16
        text: qsTr( control.text)
        font: control.font
       
		color:control.down ? fore:control.ld.hslLightness > 0.5 ? "black"  : "white"
		elide: Text.ElideRight
        visible: control.text
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        opacity: enabled ? 1 : 0.3
    }
}
