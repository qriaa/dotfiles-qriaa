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
    // Actual button hitbox is invisible.
    // The active workspace indicator is smaller than the button.
    property int workspaceButtonWidth: 26
    property int visualButtonMargin: 2
    property int visualButtonWidth: workspaceButtonWidth - visualButtonMargin
    property real workspaceIconWidth: workspaceButtonWidth * 0.7

    readonly property int workspacesShown: 10

    readonly property HyprlandMonitor monitor: Hyprland.monitorFor(root.QsWindow.window?.screen)
    property int workspaceOccupied: 0

    implicitWidth: (workspaceButtonWidth * workspacesShown)
    implicitHeight: 30

    // Background
    Rectangle {
        anchors.fill: parent
        radius: 5
        color: Colors.sys.surface
    }

    // Active button
    Rectangle {
        implicitHeight: root.visualButtonWidth
        implicitWidth: root.visualButtonWidth
        anchors.verticalCenter: parent.verticalCenter
        x: root.workspaceButtonWidth * (root.monitor?.activeWorkspace.id - 1)
            + root.visualButtonMargin/2

        radius: width/2
        color: Colors.sys.surfaceHighest
    }

    // Buttons
    RowLayout {
        anchors.fill: parent
        spacing: 0

        Repeater {
            model: root.workspacesShown

            Item {
                id: rootButton
                property int workspace: index + 1
                implicitHeight: root.workspaceButtonWidth
                implicitWidth: root.workspaceButtonWidth

                Button {
                    id: hitbox

                    anchors.fill: parent
                    opacity: 0

                    hoverEnabled: true
                    onPressed: Hyprland.dispatch(`focusworkspaceoncurrentmonitor ${workspace}`)
                }

                Rectangle {
                    id: visualButton

                    anchors.fill: parent
                    color: Colors.sys.surfaceHigh //Colors.sys.surfaceHighest
                    opacity: hitbox.hovered
                    radius: width/2
                }

                StyledText {
                    anchors.centerIn: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    text: rootButton.workspace
                }
            }
        }
    }
}
