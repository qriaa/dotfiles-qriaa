import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import qs.style
import qs.widgets

Item {
    id: root
    // Actual buttons are invisible.
    // The active workspace indicator is smaller than the button.
    property int workspaceButtonWidth: 26
    property int workspaceButtonSpacing: 2
    property int activeWorkspaceMargin: 2
    property real workspaceIconWidth: workspaceButtonWidth * 0.7

    property int workspaceOccupied: 0

    readonly property HyprlandMonitor monitor: Hyprland.monitorFor(root.QsWindow.window?.screen)
    readonly property int workspacesShown: 10

    implicitWidth: (workspaceButtonWidth * workspacesShown)
                    + (workspaceButtonSpacing * (workspacesShown - 1))
    implicitHeight: 30

    // Background
    Rectangle {
        anchors.fill: parent
        radius: 5
        color: Colors.sys.surface
    }

    // Buttons
    RowLayout {
        anchors.fill: parent
        anchors.leftMargin: 2
        spacing: root.workspaceButtonSpacing

        Repeater {
            model: root.workspacesShown

            Item {
                id: button
                property int workspace: index + 1

                Layout.alignment: Qt.AlignVCenter
                implicitHeight: root.workspaceButtonWidth
                implicitWidth: root.workspaceButtonWidth
                // color: "#00000000"//Colors.sys.surfaceHighest
                // radius: width/2
                Button {
                    anchors.fill: parent
                    opacity: 0
                    onPressed: Hyprland.dispatch(`focusworkspaceoncurrentmonitor ${workspace}`)
                }
                StyledText {
                    anchors.centerIn: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    text: button.workspace//root.monitor.activeWorkspace.id
                }
            }
        }
    }
}
