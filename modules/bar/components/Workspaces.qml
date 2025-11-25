pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland
import qs.lib.containers
import qs.config

StyledContainer {
  id: root
  required property ShellScreen screen
  property real activeWidth: 48
  property real inactiveWidth: 10
  property real gapSize: 10

  implicitWidth: (repeater.model.length - 1) * inactiveWidth + (repeater.model.length + 1) * gapSize + activeWidth

  FlexboxLayout {
    id: workspaces
    anchors.fill: root.container
    alignItems: FlexboxLayout.AlignCenter
    justifyContent: FlexboxLayout.JustifySpaceEvenly

    Repeater {
      id: repeater
      model: Hyprland.workspaces.values.filter(w => w.monitor.name == screen.name)

      Rectangle {
        id: workspace
        required property int index
        required property HyprlandWorkspace modelData

        implicitWidth: root.inactiveWidth
        implicitHeight: root.inactiveWidth
        radius: 20
        color: Theme.secondaryColor

        states: State {
          name: "active"
          when: workspace.modelData.active
          PropertyChanges {
            workspace {
              implicitWidth: root.activeWidth
              color: Theme.accentColor
            }
          }
        }

        transitions: Transition {
          from: ""
          to: "active"
          reversible: true

          NumberAnimation {
            properties: "implicitWidth"
            duration: 150
            easing.type: Easing.InOutQuad
          }

          ColorAnimation {
            duration: 150
          }
        }
      }
    }
  }
}
