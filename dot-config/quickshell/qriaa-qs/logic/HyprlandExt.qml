import QtQuick
import Quickshell
import Quickshell.Io
import Quickshell.Hyprland

// Extended Hyprland functionality
// Functionality missing from Quickshell (contribution ideas essentially)
// All of this should be considered a hack and removed the moment it is added to Quickshell
pragma Singleton
Singleton {
    id: root

    // Those are QJSValues, run the command to the right to obtain the shape of the JSON
    // or console.log(JSON.stringify(<json var>)) (otherwise [object Object])
    property var version: null
    property var monitors: null
    property var workspaces: null
    // property var activeWorkspace: null // Quickshell Hyprland does that fine
    property var clients: null
    // property var activeWindow: null // Quickshell Hyprland does that fine
    property var devices: null
    property var layers: null

    function largestToplevelInWorkspace(workspaceId) {
        const workspace = workspaces.find((el) => el.id === workspaceId)
        if (workspace == null)
            return null;
        console.log(workspace)
    }

    function updateAll() {
        getVersion.running = true
        getMonitors.running = true
        getWorkspaces.running = true
        getClients.running = true
        getDevices.running = true
        getLayers.running = true
    }

    Component.onCompleted: {
        root.updateAll()
    }

    Connections {
        target: Hyprland
        function onRawEvent(event) {
            // We have to update everything all the time,
            // there is no Hyprland event for the monitor changing its settings...
            // the next Hyprland event will update its values
            // Same for devices
            root.updateAll()
        }
    }

    Process {
        id: getVersion
        command: ['hyprctl', 'version', '-j']
        stdout: StdioCollector {
            id: versionCollector
            onStreamFinished: {
                root.version = JSON.parse(versionCollector.text);
            }
        }
    }

    Process {
        id: getMonitors
        command: ['hyprctl', 'monitors', '-j']
        stdout: StdioCollector {
            id: monitorsCollector
            onStreamFinished: {
                root.monitors = JSON.parse(monitorsCollector.text);
            }
        }
    }

    Process {
        id: getWorkspaces
        command: ['hyprctl', 'workspaces', '-j']
        stdout: StdioCollector {
            id: workspacesCollector
            onStreamFinished: {
                root.workspaces = JSON.parse(workspacesCollector.text);
            }
        }
    }

    Process {
        id: getClients
        command: ['hyprctl', 'clients', '-j']
        stdout: StdioCollector {
            id: clientsCollector
            onStreamFinished: {
                root.clients = JSON.parse(clientsCollector.text);
            }
        }
    }

    Process {
        id: getDevices
        command: ['hyprctl', 'devices', '-j']
        stdout: StdioCollector {
            id: devicesCollector
            onStreamFinished: {
                root.devices = JSON.parse(devicesCollector.text);
            }
        }
    }

    // Process {
    //     id: getActiveWindow
    //     command: ['hyprctl', 'activewindow', '-j']
    //     stdout: StdioCollector {
    //         id: activeWindowCollector
    //         onStreamFinished: {
    //             root.activeWindow = JSON.parse(activeWindowCollector.text);
    //         }
    //     }
    // }

    // Process {
    //     id: getActiveWorkspace
    //     command: ['hyprctl', 'activeworkspace', '-j']
    //     stdout: StdioCollector {
    //         id: activeWorkspaceCollector
    //         onStreamFinished: {
    //             root.activeWorkspace = JSON.parse(activeWorkspaceCollector.text);
    //         }
    //     }
    // }

    Process {
        id: getLayers
        command: ['hyprctl', 'layers', '-j']
        stdout: StdioCollector {
            id: layersCollector
            onStreamFinished: {
                root.layers = JSON.parse(layersCollector.text);
            }
        }
    }
}

