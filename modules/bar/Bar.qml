import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Effects
import Quickshell
import "components"
import qs.config
import qs.modules

Scope {
  Variants {
    model: Quickshell.screens

    PanelWindow {
      id: topLevel

      required property var modelData
      property color mainColor: "black"
      property real barHeight: 40

      implicitHeight: barHeight
      screen: modelData
      color: "transparent"

      anchors {
        top: true
        left: true
        right: true
      }

      // Popups
      ControlDrawer {
        anchor.window: topLevel
        anchor.rect.x: anchor.window.width / 2 - width / 2
        anchor.rect.y: 0
        drawerColor: topLevel.mainColor
        minHeight: topLevel.barHeight
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
            color: topLevel.mainColor

            Button {
              anchors.fill: osIcon.container
              background: Rectangle {
                anchors.fill: parent
                color: "transparent"
              }
              icon.source: Config.osIconPath
              icon.color: "white"
              icon.height: 20
              icon.width: 20
            }
          }
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
            implicitWidth: 60
            implicitHeight: topLevel.height
            color: topLevel.mainColor

            Text {
              id: time
              anchors.centerIn: clock.container
              color: "white"
              font.bold: true
              text: SystemInfo.time
            }
          }

          StyledContainer {
            id: power
            implicitWidth: topLevel.height
            implicitHeight: topLevel.height
            color: topLevel.mainColor

            Button {
              anchors.fill: power.container
              background: Rectangle {
                anchors.fill: parent
                color: "transparent"
              }
              Text {
                anchors.centerIn: parent
                color: "white"
                font.family: Fonts.tablerIcons
                text: "\ueb0d"
              }
            }
          }
        }
      }
    }
  }
}
