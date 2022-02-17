
import QtGraphicalEffects 1.12
import QtQuick 2.12
import QtQuick.Templates 2.12 as T
import QtQuick.Controls.impl 2.12

T.RoundButton {
    id: control

    implicitWidth: Math.max(background ? background.implicitWidth : 0,
                            contentItem.implicitWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(background ? background.implicitHeight : 0,
                             contentItem.implicitHeight + topPadding + bottomPadding)
    baselineOffset: contentItem.y + contentItem.baselineOffset

    padding: 6
	property color ld:themeData.background[1]
	property color fore:themeData.foreground[1]
	property color press:themeData.pressed[1]


    //! [contentItem]
    contentItem: Text {
        text: control.text
        font: control.font
        opacity:1
       // color: control.down ?fore :press//"#0080c0" : "white"
		color:control.down ? fore:control.ld.hslLightness > 0.5 ? "black"  : "white"

        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignBottom
        elide: Text.ElideRight
        styleColor: "#cc000000"
 wrapMode: Text.WordWrap
  maximumLineCount :3
  style: Text.Outline
      renderType: Text.NativeRendering;
	  //height:control.height/2-control.height/4

    }
    //! [contentItem]

    //! [background]
    background: Rectangle {
        //x:6
        //y:6
        implicitWidth: 40
        implicitHeight: 40
        radius: control.radius
        opacity: control.down ? 0.7 :0
        Behavior on opacity {
            NumberAnimation{duration: 100}
        }

        visible: true
        color: press

    }
	
	 Image{
	source:control.icon.source
      
        id:image
		anchors.fill: parent
        horizontalAlignment: Image.AlignHCenter
        verticalAlignment: Image.AlignVCenter
        mipmap: true
        anchors.bottomMargin: 10
        anchors.rightMargin: 10
        anchors.leftMargin: 10
        anchors.topMargin: 10
        antialiasing: true
        autoTransform: false
        fillMode: Image.Stretch
        width:implicitWidth ===0 ? 0:control.height/2.3
        height: width
		ColorOverlay {
                        anchors.fill: image
                        source: image
                        color:fore
                      
                    }
	

    }
	

    //! [background]
}
