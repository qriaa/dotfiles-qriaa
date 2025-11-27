import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Layouts
import qs.style

Scope {
  Variants {
    model: Quickshell.screens

    PanelWindow {
      required property var modelData
      screen: modelData

      anchors {
        top: true
        left: true
        right: true
      }

      implicitHeight: 30

      // Background
      Rectangle {
          anchors.fill: parent
          color: Colors.sys.surfaceLow
      }

      RowLayout {
          id: leftSection
          anchors {
              top: parent.top
              bottom: parent.bottom
              left: parent.left
              right: centerSection.left
          }
          spacing: 0

          WindowName {
              Layout.fillHeight: true
          }
      }

      RowLayout {
          id: centerSection
          anchors {
              top: parent.top
              bottom: parent.bottom
              horizontalCenter: parent.horizontalCenter
          }
          spacing: 0

          Workspaces {}
      }

      RowLayout {
          id: rightSection
          anchors {
              top: parent.top
              bottom: parent.bottom
              left: centerSection.right
              right: parent.right
          }
          layoutDirection: Qt.RightToLeft
          spacing: 0


          ClockWidget {
              Layout.fillHeight: true
          }
      }
    }
  }
}
