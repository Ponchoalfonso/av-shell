import QtQuick
import QtQuick.Effects
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland
import qs.config
import qs.lib
import qs.lib.containers
import qs.modules

PanelWindow {
  id: root

  property real minHeight: 40
  property real minWidth: 230
  property real maxWidth: 800
  property real maxHeight: 800
  property real buttonPadding: 4

  anchors.top: true
  implicitWidth: maxWidth
  implicitHeight: maxHeight
  color: "transparent"

  property string currentView: ""

  WlrLayershell.exclusionMode: ExclusionMode.Ignore
  WlrLayershell.layer: currentView != "" || anim.running ? WlrLayer.Overlay : WlrLayer.Bottom

  Connections {
    target: Shortcuts.toggleControlDrawer
    function onReleased() {
      if (root.currentView !== "") {
        root.currentView = "";
        drawer.implicitWidth = root.minWidth;
        drawer.implicitHeight = root.minHeight;
      } else {
        root.currentView = "menu";
        drawer.implicitWidth = 400;
        drawer.implicitHeight = 100;
      }
    }
  }

  FlexboxLayout {
    id: layout
    anchors.horizontalCenter: parent.horizontalCenter

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
      id: drawer
      implicitHeight: viewLoader.item ? Math.max(root.minHeight, viewLoader.height) : root.minHeight
      implicitWidth: viewLoader.item ? Math.max(230, viewLoader.width) : 230

      RectangularShadow {
        anchors.fill: drawer
        radius: 20
        color: "black"
        blur: 3
      }

      StyledRectangle {
        id: tab
        anchors.fill: parent
        bottomLeftRadius: 20
        bottomRightRadius: 20
      }

      Loader {
        id: viewLoader
        anchors.centerIn: drawer
        sourceComponent: {
          switch (root.currentView) {
          case "menu":
            return menu;
          default:
            return null;
          }
        }
      }

      Component {
        id: menu
        Item {
          width: 400
          height: 100
        }
      }

      StyledText {
        anchors.centerIn: drawer
        text: SystemInfo.username + "@" + SystemInfo.hostname
      }

      Behavior on implicitHeight {
        NumberAnimation {
          id: anim
          duration: 150
          easing.type: Easing.InOutQuad
        }
      }

      Behavior on implicitWidth {
        NumberAnimation {
          duration: 150
          easing.type: Easing.InOutQuad
        }
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
