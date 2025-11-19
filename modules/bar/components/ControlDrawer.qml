import QtQuick
import QtQuick.Effects
import QtQuick.Layouts
import Quickshell
import qs.lib
import qs.modules

PopupWindow {
  id: root
  implicitWidth: layout.implicitWidth
  implicitHeight: layout.implicitHeight
  color: "transparent"
  visible: true

  property real minHeight: 40
  property color drawerColor: "black"

  FlexboxLayout {
    id: layout
    property real buttonPadding: 5

    StyledContainer {
      implicitWidth: root.minHeight
      implicitHeight: root.minHeight

      Frame {
        anchors.fill: parent
        topRightRadius: 15
        color: root.drawerColor
      }
    }

    Rectangle {
      id: tab
      implicitHeight: root.minHeight
      implicitWidth: 230
      color: root.drawerColor
      bottomLeftRadius: 20
      bottomRightRadius: 20

      RectangularShadow {
        anchors.fill: parent
        radius: container.radius
        color: Qt.lighter(parent.color, 1.6)
      }

      Text {
        anchors.centerIn: parent
        color: "white"
        font.bold: true
        text: SystemInfo.username + "@" + SystemInfo.hostname
      }
    }

    StyledContainer {
      implicitWidth: root.minHeight
      implicitHeight: root.minHeight

      Frame {
        anchors.fill: parent
        topLeftRadius: 15
        color: root.drawerColor
      }
    }
  }
}
