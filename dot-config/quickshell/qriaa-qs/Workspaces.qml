import QtQuick
import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland

Item {
    id: root
    property int widgetPadding: 4
    property int workspaceButtonWidth: 26
    property int workspaceOccupied: 0
    property real workspaceIcon: workspaceButtonWidth * 0.7

    Text {
        text: Hyprland.monitorFor(root.QsWindow.window?.screen).activeWorkspace.id
    }
}
