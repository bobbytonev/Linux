import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.11
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.12
RoundButton {
    id: button
    width: 32

    property var imageSource

    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
    Layout.preferredHeight: 48
    Layout.preferredWidth: 48
	icon.source:imageSource
}


/*##^##
Designer {
    D{i:0;formeditorZoom:8;height:48;width:48}
}
##^##*/
