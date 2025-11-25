import QtQuick
import QtQuick.Effects
import qs.config

Item {
  id: root
  readonly property Rectangle container: container
  property color color: Theme.primaryColor
  property real radius: 14
  property string flow: "center"
  property real margins: 4

  RectangularShadow {
    anchors.fill: container
    radius: container.radius
    color: "black"
    blur: 3
  }

  Rectangle {
    id: container
    anchors.fill: root
    anchors.margins: root.margins
    anchors.leftMargin: root.flow == "right" ? 0 : root.margins
    anchors.rightMargin: root.flow == "left" ? 0 : root.margins
    color: root.color
    radius: root.radius
  }
}
