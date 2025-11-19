import QtQuick
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

    Item {
      implicitWidth: root.minHeight
      implicitHeight: root.minHeight

      Rectangle {
        anchors.fill: parent
        anchors.margins: 4
        color: root.drawerColor
        radius: 14
      }

      Frame {
        anchors.fill: parent
        topRightRadius: 15
        color: root.drawerColor
      }
    }

    Rectangle {
      implicitHeight: root.minHeight
      implicitWidth: 230
      color: root.drawerColor
      bottomLeftRadius: 20
      bottomRightRadius: 20

      Text {
        anchors.centerIn: parent
        color: "white"
        font.bold: true
        text: SystemInfo.username + "@" + SystemInfo.hostname
      }
    }
    Item {
      implicitWidth: root.minHeight
      implicitHeight: root.minHeight

      Rectangle {
        anchors.fill: parent
        anchors.margins: 4
        color: root.drawerColor
        radius: 14
      }

      Frame {
        anchors.fill: parent
        topLeftRadius: 15
        color: root.drawerColor
      }
    }
  }
}
