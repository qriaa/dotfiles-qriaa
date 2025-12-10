import Quickshell
import Quickshell.Hyprland
import Quickshell.Wayland
import QtQuick
import QtQuick.Layouts
import qs.style
import qs.widgets
import qs.logic

Rectangle {
    id: root
    readonly property int margin: 5
    property HyprlandMonitor monitor: Hyprland.monitorFor(root.QsWindow.window?.screen)
    property HyprlandWorkspace workspace: monitor.activeWorkspace
    property HyprlandToplevel activeToplevel: Hyprland.activeToplevel
    property bool focusingThisMonitor: Hyprland.focusedWorkspace?.monitor?.name === monitor?.name

    function updateTitleText() {
        // console.log("-----")
        // console.log(root.monitor.name)
        // console.log(root.activeToplevel.monitor.name)
        // console.log(JSON.stringify(HyprlandExt.version))
        if (activeToplevel.monitor.name === monitor.name)
            root.titleText = activeToplevel.title
    }

    onActiveToplevelChanged: updateTitleText()
    // TODO: write HyprlandData

    // function updateIfOnThisMonitor(monitor: HyprlandMonitor, activeToplevel: HyprlandToplevel): string {
    //     console.log("-----")
    //     console.log(monitor.name)
    //     console.log(activeToplevel.monitor.name)
    //     // if (!focusingThisMonitor)
    //     //     return root.titleText
    //     if (activeToplevel.monitor.name === monitor.name)
    //         return activeToplevel.title
    //     // console.log(root.monitor.activeWorkspace.toplevels.values[0].wayland.screens)
    //     // This doesn't update when workspaces trade monitors (hyprctl focusworkspaceoncurrentmonitor)
    //     // The error seems to originate with the wayland Toplevel.screens; they don't change when the workspace
    //     // trades places with other screen
    //     // if (activeToplevel.screens.some((el) => screen.name === el.name))
    //     //     return activeToplevel.title
    //     // console.log(screen in activeToplevel.screens)
    //     // console.log(screen === activeToplevel.screens[0])
    //     return root.titleText
    // }

    property string titleText: "none"//updateIfOnThisMonitor(monitor, activeToplevel)//activeToplevel.title
    property string subtitleText: activeToplevel.wayland.appId

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
