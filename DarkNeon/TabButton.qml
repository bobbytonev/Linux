import QtQuick 2.8
import QtQuick.Templates 2.1 as T
import QtQuick.Controls.Material 2.1
import QtQuick.Controls.Material.impl 2.1

T.TabButton {
    id: control

    implicitWidth: Math.max(background ? background.implicitWidth : 0,
                            contentItem.implicitWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(background ? background.implicitHeight : 0,
                             contentItem.implicitHeight + topPadding + bottomPadding)
    baselineOffset: contentItem.y + contentItem.baselineOffset

    padding: 12
	

	property color ld:themeData.background[1]
	property color fore:themeData.foreground[1]
	property color press:themeData.pressed[1]

    contentItem: Text {
        text: qsTr( control.text)
        font: control.font
        elide: Text.ElideRight
        color: control.ld.hslLightness > 0.5 ? "black" : !control.enabled ? press: control.down || control.checked ?  fore : "white"//"#0080c0" : "white"
		


	   horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter

    }
    background:Rectangle{
        color:"transparent"
        Rectangle{
            color: press //control.down || control.checked ?  fore : press//"#0080c0" : "white"
            width: parent.width
            height: 1
            y:0
            Rectangle{
               width:control.checked ? parent.width : 0
               height:1
               x:parent.width/2-width/2
               color:fore;

               Behavior on width{
                   NumberAnimation{duration: 200}
               }
            }


        }
       // Rectangle{
          //  color:control.down || control.checked ? fore :press//"#0080c0" : "white"
            // width: parent.width
            // height: 1
            // y:parent.height-1
            // Rectangle{
               // width:control.checked ? parent.width : 0
                //height:1
               // x:parent.width/2-width/2
               // color:msg.colors[1];

                //Behavior on width{
                   // NumberAnimation{duration: 100}
              //  }
            // }


       // }
    }


}
