import QtQuick 2.8
import QtQuick.Controls 2.1
import QtQuick.Controls.impl 2.1
import QtQuick.Templates 2.1 as T

T.PageIndicator {
    id: control

    implicitWidth: Math.max(background ? background.implicitWidth : 0,
                            contentItem.implicitWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(background ? background.implicitHeight : 0,
                             contentItem.implicitHeight + topPadding + bottomPadding)

    padding: 6
    spacing: 6
	
	
	property color ld:themeData.background[1]
	property color fore:themeData.foreground[1]

	property color invertBgColor:ld.hslLightness > 0.5 ?"black":"white"
	
	
	


    delegate: Rectangle {
        id:background
        implicitWidth: 10
        implicitHeight: 10

        radius: width / 2
        color: ld
        border.color: fore

        //opacity: index === currentIndex ? 0.95 : pressed ? 0.7 : 0.45
       // Behavior on opacity { OpacityAnimator { duration: 100 } }

        Rectangle{
            width: index === currentIndex ? background.width :0
            height: width
            x:background.width/2-width/2
            y:x
            color:invertBgColor
            border.color: ld
            Behavior on width { NumberAnimation { duration: 100 } }
            radius: width / 2
        }
    }

    contentItem: Row {
        spacing: control.spacing

        Repeater {
            model: control.count
            delegate: control.delegate
        }
    }
}
