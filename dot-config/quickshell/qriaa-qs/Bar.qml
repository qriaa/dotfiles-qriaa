import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Layouts

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

      RowLayout {
          id: leftSection
          anchors {
              top: parent.top
              bottom: parent.bottom
              left: parent.left
              right: centerSection.left
          }
          spacing: 0

          Text {
              text: 'hemlo'
          }

          Rectangle {
              color: 'orange'
              Layout.fillHeight: true
              Layout.fillWidth: true
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
          spacing: 0


          Rectangle {
              color: 'green'
              Layout.fillHeight: true
              Layout.fillWidth: true
          }
          ClockWidget {}
      }
    }
  }
}
