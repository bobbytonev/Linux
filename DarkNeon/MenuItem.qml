import QtQuick 2.8
import QtQuick.Controls 2.1
import QtQuick.Controls.impl 2.1
import QtQuick.Templates 2.1 as T

T.MenuItem {
    id: control

    implicitWidth: Math.max(background ? background.implicitWidth : 0,
                            contentItem.implicitWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(background ? background.implicitHeight : 0,
                             Math.max(contentItem.implicitHeight,
                                      indicator ? indicator.implicitHeight : 0) + topPadding + bottomPadding)
    baselineOffset: contentItem.y + contentItem.baselineOffset

    padding: 6
	
	//font.family: tcm.theme[0];
	property color ld:themeData.background[1]
	property color fore:themeData.foreground[1]
	property color press:themeData.pressed[1]

    contentItem: Text {
        text: qsTr( control.text)
        font: control.font
		
        //font.pixelSize:control.hovered ? control.font.pixelSize*1.2 :control.font.pixelSize
        opacity: enabled || control.highlighted || control.checked ? 1 : 0.3
      
		
		color:control.ld.hslLightness > 0.5 ? "black" : control.down ? fore : "white"
        
		horizontalAlignment:control.display===Button.TextUnderIcon||control.display===Button.TextOnly ?  Text.AlignHCenter: Text.AlignHLeft
        leftPadding: control.display===Button.TextUnderIcon||control.display===Button.TextOnly ? 0:16
		topPadding:control.display===Button.TextUnderIcon ? image.height+20:0
		
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
		visible:control.display!==Button.IconOnly
    }
    indicator: Image {
        x: control.mirrored ? control.width - width - control.rightPadding : control.leftPadding
        y: control.topPadding + (control.availableHeight - height) / 2

        visible: control.checked
        source: control.checkable ? "qrc:/qt-project.org/imports/QtQuick/Controls.2/images/check.png" : ""
    }

    background: Item {
        implicitWidth: 200
        implicitHeight: 40

        Rectangle {
            x: 1
            y: 1
            width: parent.width - 2
            height: parent.height - 2
            color: control.visualFocus || control.down ? "white" : "transparent"
        }
    }
}