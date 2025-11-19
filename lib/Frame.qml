pragma ComponentBehavior: Bound

import QtQuick
import qs.lib.effects

Item {
  id: root
  visible: true

  property alias topLeftRadius: maskFrame.topLeftRadius
  property alias topRightRadius: maskFrame.topRightRadius
  property alias bottomLeftRadius: maskFrame.bottomLeftRadius
  property alias bottomRightRadius: maskFrame.bottomRightRadius
  property alias radius: maskFrame.radius
  property color color: "black"

  Rectangle {
    id: frame
    anchors.fill: parent
    layer.enabled: true
    color: root.color
    layer.effect: OpacityMask {
      maskSource: mask
      reverse: true
    }

    Item {
      id: mask
      anchors.fill: parent
      layer.enabled: true
      visible: false

      Rectangle {
        id: maskFrame
        anchors.fill: parent
        opacity: 1
      }
    }
  }
}
