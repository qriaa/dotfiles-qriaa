import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland

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

    RowLayout {
        spacing:0
        anchors {
            horizontalCenter: parent.horizontalCenter
            verticalCenter: parent.verticalCenter
        }
        implicitHeight: 28
        implicitWidth: 28

        Rectangle {
            color: 'red'
            radius: width/2
            implicitHeight: root.workspaceButtonWidth
            implicitWidth: root.workspaceButtonWidth
            Layout.alignment: Qt.AlignVCenter
            Text {
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    verticalCenter: parent.verticalCenter
                }
                text: root.monitor.activeWorkspace.id
            }
        }
    }

}
