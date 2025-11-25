import QtQuick
import QtQuick.Effects
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland
import qs.lib
import qs.lib.containers
import qs.modules

PanelWindow {
  id: root

  property real minHeight: 40
  property real buttonPadding: 4

  implicitWidth: layout.implicitWidth
  implicitHeight: layout.implicitHeight
  color: "transparent"

  WlrLayershell.exclusionMode: ExclusionMode.Ignore
  WlrLayershell.layer: WlrLayer.Top

  anchors.top: true

  FlexboxLayout {
    id: layout

    StyledContainer {
      implicitWidth: root.minHeight
      implicitHeight: root.minHeight
      margins: root.buttonPadding

      Frame {
        anchors.fill: parent
        topRightRadius: 15
      }
    }

    Item {
      implicitHeight: root.minHeight
      implicitWidth: 230

      RectangularShadow {
        anchors.fill: tab
        radius: tab.radius
        color: "black"
        spread: -5
        blur: 3
      }

      StyledRectangle {
        id: tab
        anchors.fill: parent
        bottomLeftRadius: 20
        bottomRightRadius: 20
      }

      StyledText {
        anchors.centerIn: tab
        text: SystemInfo.username + "@" + SystemInfo.hostname
      }
    }

    StyledContainer {
      implicitWidth: root.minHeight
      implicitHeight: root.minHeight
      margins: root.buttonPadding

      Frame {
        anchors.fill: parent
        topLeftRadius: 15
      }
    }
  }
}
