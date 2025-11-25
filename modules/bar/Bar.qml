import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Effects
import Quickshell
import "components"
import qs.lib.containers
import qs.lib
import qs.config
import qs.modules

Scope {
  id: root
  Variants {
    model: Quickshell.screens

    PanelWindow {
      id: topLevel

      required property ShellScreen modelData
      property real barHeight: 40

      implicitHeight: barHeight
      screen: modelData
      color: "transparent"

      anchors {
        top: true
        left: true
        right: true
      }

      FlexboxLayout {
        anchors.fill: parent
        justifyContent: FlexboxLayout.JustifySpaceBetween
        alignItems: FlexboxLayout.AlignCenter

        FlexboxLayout {
          id: left

          Component.onCompleted: {
            for (let child of right.children) {
              if (child instanceof StyledContainer)
                child.flow = "right";
            }
          }

          StyledContainer {
            id: osIcon
            implicitWidth: topLevel.height
            implicitHeight: topLevel.height

            Button {
              anchors.fill: osIcon.container
              background: Rectangle {
                anchors.fill: parent
                color: "transparent"
              }
              icon.source: Config.osIconPath
              icon.color: Theme.accentColor
              icon.height: 20
              icon.width: 20
            }
          }

          Workspaces {
            implicitHeight: topLevel.height
            screen: topLevel.modelData
          }
        }

        ControlDrawer {
          minHeight: topLevel.barHeight
        }

        FlexboxLayout {
          id: right

          Component.onCompleted: {
            for (let child of right.children) {
              if (child instanceof StyledContainer)
                child.flow = "right";
            }
          }

          StyledContainer {
            id: clock
            implicitWidth: time.width + 10 * 2
            implicitHeight: topLevel.height

            StyledText {
              id: time
              anchors.centerIn: clock.container
              font.bold: true
              text: SystemInfo.time
            }
          }

          // StyledContainer {
          //   id: power
          //   implicitWidth: topLevel.height
          //   implicitHeight: topLevel.height
          //
          //   Button {
          //     anchors.fill: power.container
          //     background: Rectangle {
          //       anchors.fill: parent
          //       color: "transparent"
          //     }
          //     StyledText {
          //       anchors.centerIn: parent
          //       color: Theme.accentColor
          //       font.family: Fonts.tablerIcons.font.family
          //       font.pointSize: 14
          //       text: "\ueb0d"
          //     }
          //   }
          // }
        }
      }
    }
  }
}
