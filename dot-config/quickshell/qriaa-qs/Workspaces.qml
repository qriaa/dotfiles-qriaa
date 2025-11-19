import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import qs.style

Item {
    id: root
    property int widgetPadding: 4
    property int workspaceButtonWidth: 26
    property int workspaceOccupied: 0
    property real workspaceIcon: workspaceButtonWidth * 0.7

    readonly property HyprlandMonitor monitor: Hyprland.monitorFor(root.QsWindow.window?.screen)
    readonly property int workspacesShown: 10

    implicitWidth: root.workspaceButtonWidth * workspacesShown
    implicitHeight: 30

    // Background
    Rectangle {
        anchors.fill: parent
        radius: 5
        color: Colors.sys.surface

        RowLayout {
            anchors.centerIn: parent
            spacing: 0

            Rectangle {
                Layout.alignment: Qt.AlignVCenter
                implicitHeight: root.workspaceButtonWidth
                implicitWidth: root.workspaceButtonWidth
                color: Colors.sys.surfaceHighest
                radius: width/2
                Text {
                    anchors.centerIn: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    text: root.monitor.activeWorkspace.id
                    color: Colors.sys.onsurface
                }
            }
        }
    }
}
