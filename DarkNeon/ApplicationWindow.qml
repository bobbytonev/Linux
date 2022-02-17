import QtQuick 2.8
import QtQuick.Controls 2.1
import QtQuick.Controls.impl 2.1
import QtQuick.Window 2.2
import QtQuick.Templates 2.1 as T

T.ApplicationWindow {
    id: window

    color: themeData.background[1]

    overlay.modal: Rectangle {
        color: Default.overlayModalColor
    }

    overlay.modeless: Rectangle {
        color: Default.overlayDimColor
    }
}