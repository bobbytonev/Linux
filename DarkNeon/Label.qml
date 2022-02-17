import QtQuick 2.0
import QtQuick 2.8
import QtQuick.Templates 2.1 as T
import QtQuick.Controls.Material 2.1

T.Label {
    id: control
	
property color ld:themeData.background[1]
property color fore:themeData.foreground[1]
padding: 6
    //color: msg.colors[2]
	color:control.ld.hslLightness > 0.5 ? "black" : control.down ? fore: "white"
   leftPadding: 22
   font.family: themeData.fontFamilly[1]
           text:qsTr( control.text)
           //font: control.font
          elide: Text.ElideRight
           
           horizontalAlignment: Text.AlignLeft
           verticalAlignment: Text.AlignVCenter
           opacity: enabled ? 1 : 0.3
		 


}
