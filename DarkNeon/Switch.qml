import QtQuick 2.8
import QtQuick.Templates 2.1 as T
import QtQuick.Controls 2.1
import QtQuick.Controls.impl 2.1

T.Switch {
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
	property color press:themeData.pressed[1]

	
	property color invertBgColor:ld.hslLightness > 0.5 ?"black":"white"

background: Rectangle{
color: press//"#1d1d1d"
opacity: control.down ? 0.5:0
Behavior on opacity {
NumberAnimation {duration:100}
}
}


    indicator: Rectangle {
          implicitWidth: 48
          implicitHeight: 26
          id:rect
          x: (parent.width-rect.width)-16
          y: parent.height / 2 - height / 2
          radius: 13
          color: control.checked ? fore: ld //"#0080c0" : "black"
          border.color: control.checked&&control.ld.hslLightness > 0.5 ? "black":control.checked&&control.ld.hslLightness < 0.5 ? "white" :fore //"white" : "#0080c0"

          Rectangle {
              x: control.checked ? parent.width - width : 0
              width: 26
              height: 26
              radius: 13
              color: control.down ?  invertBgColor: control.checked ?  invertBgColor :  ld//"white": "black"
             // border.color: control.checked ? (control.down ? "#17a81a" : "#21be2b") : "#999999"
         
		 
		 border.color: control.checked ?  ld:control.ld.hslLightness > 0.5 ? "black"  : "white" // msg.colors[2]//"black": "white"
         antialiasing: true
          layer.enabled: true


         Behavior on x{
            NumberAnimation { duration: 120 }
         }
          }

      }


    contentItem: Text {
         /// leftPadding: control.indicator && !control.mirrored ? control.indicator.width + control.spacing : 0
        // rightPadding: control.indicator && control.mirrored ? control.indicator.width + control.spacing : 0
        //x:16
      leftPadding: 16
        text: qsTr( control.text)
        font: control.font
        //color: msg.colors[2]//"white"
				color:control.down ? fore:control.ld.hslLightness > 0.5 ? "black"  : "white"

        elide: Text.ElideRight
        visible: control.text
        horizontalAlignment: Text.AlignHLeft
        verticalAlignment: Text.AlignVCenter
    }
}
