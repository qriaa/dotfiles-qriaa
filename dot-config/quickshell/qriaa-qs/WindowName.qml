import Quickshell
import Quickshell.Hyprland
import QtQuick
import qs.style
import qs.widgets

Rectangle {
    id: root
    property int margin: 5

    implicitWidth: timeText.implicitWidth + 2*margin

    radius: 5
    color: Colors.sys.surface

    StyledText {
        id: timeText
        anchors {
            verticalCenter: parent.verticalCenter
            horizontalCenter: parent.horizontalCenter
        }
        
        text: Hyprland.activeToplevel.title
    }
}
