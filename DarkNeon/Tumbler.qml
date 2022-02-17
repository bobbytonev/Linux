import QtQuick 2.8
import QtQuick.Controls 2.1
import QtQuick.Controls.impl 2.1
import QtQuick.Templates 2.1 as T

T.Tumbler {
    id: control
    implicitWidth: 60
    implicitHeight: 200


	property color ld:themeData.background[1]
	property color fore:themeData.foreground[1]
	property color press:themeData.pressed[1]

    delegate: Text {
        id: label
        text: modelData
		color:control.ld.hslLightness > 0.5 ? "black"  : "white"
		
        font: control.font
        opacity: (1.0 - Math.abs(Tumbler.displacement) / (visibleItemCount / 2)) * (control.enabled ? 1 : 0.6)
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }

    contentItem: TumblerView {
        id: tumblerView
        model: control.model
        delegate: control.delegate
        path: Path {
            startX: tumblerView.width / 2
            startY: -tumblerView.delegateHeight / 2
            PathLine {
                x: tumblerView.width / 2
                y: (control.visibleItemCount + 1) * tumblerView.delegateHeight - tumblerView.delegateHeight / 2
            }
        }

        property real delegateHeight: control.availableHeight / control.visibleItemCount
    }
}

  