import QtQuick 2.8
import QtQuick.Templates 2.1 as T
import QtQuick.Controls.Material 2.1

T.MenuSeparator {
    id: control

    implicitWidth: Math.max(background ? background.implicitWidth : 0, contentItem.implicitWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(background ? background.implicitHeight : 0, contentItem.implicitHeight + topPadding + bottomPadding)

    topPadding: 8
    bottomPadding: 8
	property color fore:themeData.foreground[1]
    contentItem: Rectangle {
        implicitWidth: 200
        implicitHeight: 1
        color: fore
    }
}
