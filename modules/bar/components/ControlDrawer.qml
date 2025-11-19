import QtQuick
import QtQuick.Layouts
import Quickshell
import "../../"

PopupWindow {
  implicitWidth: 350
  implicitHeight: parentWindow.implicitHeight
  color: "transparent"
  visible: true

  Rectangle {
    anchors.fill: parent
    color: "black"
  }

  Text {
    anchors.centerIn: parent
    anchors.horizontalCenter: parent
    color: "white"
    text: SystemInfo.username + "@" + SystemInfo.hostname
  }
}
