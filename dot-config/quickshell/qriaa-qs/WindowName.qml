import Quickshell
import Quickshell.Hyprland
import Quickshell.Wayland
import QtQuick
import QtQuick.Layouts
import qs.style
import qs.widgets

Rectangle {
    id: root
    readonly property int margin: 5
    readonly property HyprlandMonitor monitor: Hyprland.monitorFor(root.QsWindow.window?.screen)
    readonly property Toplevel activeWindow: ToplevelManager.activeToplevel
    readonly property bool focusingThisMonitor: Hyprland.focusedWorkspace?.monitor?.name == monitor?.name

    readonly property string titleText: activeWindow.title
    readonly property string subtitleText: activeWindow.appId

    implicitWidth: colLayout.implicitWidth + margin*2

    radius: 5
    color: Colors.sys.surface

    ColumnLayout {
        id: colLayout
        anchors {
            left: parent.left
            right: parent.right
            margins: root.margin
            verticalCenter: parent.verticalCenter
        }
        spacing: -5

        StyledText {
            id: subtitleText
            Layout.fillWidth: true
            text: root.subtitleText
            font.pixelSize: Fonts.pixelSize.smaller
            color: Colors.sys.subtleonsurface
        }

        StyledText {
            id: titleText
            Layout.fillWidth: true
            text: root.titleText
        }
    }
}
