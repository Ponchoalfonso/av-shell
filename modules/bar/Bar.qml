import QtQuick
import QtQuick.Layouts
import Quickshell
import "components"

Scope {
  Variants {
    model: Quickshell.screens

    PanelWindow {
      id: topLevel
      required property var modelData
      screen: modelData

      anchors {
        top: true
        left: true
        right: true
      }

      implicitHeight: 30

      // Popups
      ControlDrawer {
        anchor.window: topLevel
        anchor.rect.x: anchor.window.width / 2 - width / 2
        anchor.rect.y: 0
      }

      FlexboxLayout {
        anchors.fill: parent
        anchors.leftMargin: 5
        anchors.rightMargin: 6
        justifyContent: FlexboxLayout.JustifySpaceBetween
        alignItems: FlexboxLayout.AlignCenter

        FlexboxLayout {
          id: left
          Text {
            text: "Left"
          }
        }

        FlexboxLayout {
          id: right
          Text {
            text: "Right"
          }
        }
      }
    }
  }
}
