import Quickshell
import QtQuick
import qs.widgets
import qs.style

Rectangle {
    id: root
    property int margin: 5

    implicitWidth: timeText.implicitWidth + 2*margin
    anchors {
        top: parent.top
        bottom: parent.bottom
    }

    radius: 5
    color: Colors.sys.surface

    StyledText {
        id: timeText
        anchors {
            verticalCenter: parent.verticalCenter
            horizontalCenter: parent.horizontalCenter
        }
        
        text: Time.time
    }
}
