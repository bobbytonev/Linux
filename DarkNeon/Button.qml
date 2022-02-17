
import QtGraphicalEffects 1.12
import QtQuick 2.12
import QtQuick.Templates 2.12 as T
import QtQuick.Controls.impl 2.12


T.Button {
    id: control
	display:Button.TextBesideIcon
    implicitWidth: Math.max(background ? background.implicitWidth : 0,
                            contentItem.implicitWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(background ? background.implicitHeight : 0,
                             contentItem.implicitHeight + topPadding + bottomPadding)
    baselineOffset: contentItem.y + contentItem.baselineOffset

    padding: 6
    leftPadding: control.display===Button.TextUnderIcon||control.display===Button.TextOnly ? 0: padding + 2+image.width

    rightPadding:control.display===Button.TextUnderIcon||control.display===Button.TextOnly ? 0: padding + 2
	
	font.family: themeData.fontFamilly[1];
	property color ld:themeData.background[1]
	property color fore:themeData.foreground[1]
	property color press:themeData.pressed[1]

    contentItem: Text {
        text: qsTr( control.text)
        font: control.font
		
        //font.pixelSize:control.hovered ? control.font.pixelSize*1.2 :control.font.pixelSize
        opacity: enabled || control.highlighted || control.checked ? 1 : 0.3
       // color: control.down ? fore : press//"#0080c0" : "white"
		
		color:control.down||control.highlighted ? fore:control.ld.hslLightness > 0.5 ? "black"  : "white"
        
		horizontalAlignment:control.display===Button.TextUnderIcon||control.display===Button.TextOnly ?  Text.AlignHCenter: Text.AlignHLeft
        leftPadding: control.display===Button.TextUnderIcon||control.display===Button.TextOnly ? 0:16
		topPadding:control.display===Button.TextUnderIcon ? image.height+20:0
		
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
		visible:control.display!==Button.IconOnly
    }

    background: Rectangle {

        implicitWidth: 100
        implicitHeight: 40
        //visible: !control.flat || control.down || control.checked || control.highlighted
        visible:true
        //color: control.checked || control.highlighted ?
          //  (control.visualFocus ? (control.down ? Default.buttonCheckedFocusColor : Default.focusColor) : (control.down ? Default.buttonCheckedpressColor : Default.textColor)) :
            //(control.visualFocus ? (control.down ? Default.focuspressColor : Default.focusLightColor) : (control.down ? Default.buttonpressColor : Default.buttonColor))
        //border.color:control.down ? "white": "#0080c0"
        //border.width: 1
       // color:"black"
        color:press//"#1d1d1d"
        opacity: control.highlighted ? 0.7 :control.down ? 0.7 :0
        Behavior on opacity {
            NumberAnimation{duration: 100}
        }
	//radius:16




    }
	icon.color:"black"
    //property alias source:image.source
    Image{
	source:control.icon.source//"image://icons/font"//
       // source:"images/"+imagesNames[index]
        id:image
		
        width:implicitWidth ===0 ? 0:control.height/2.3
		
        height: width
        x:control.display===Button.TextBesideIcon? 16:control.width/2-width/2
        y:control.height/2-height/2
//||control.display===Button.IconOnly 

		
		//test
		 ColorOverlay {
                        anchors.fill: image
                        source: image
                        color:control.icon.color!="#00000000" ? control.ld.hslLightness > 0.5 ? "black" : "white"  : "transparent"
                        //color: control.icon.color
						
                    }
					
		//test

    }
   // height: 74


}
