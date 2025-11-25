import Quickshell
import Quickshell.Wayland
import qs.lib

Scope {
  id: root

  Variants {
    model: Quickshell.screens

    PanelWindow {
      id: topLevel

      WlrLayershell.exclusionMode: ExclusionMode.Ignore
      WlrLayershell.layer: WlrLayer.Background

      required property var modelData

      anchors {
        top: true
        bottom: true
        right: true
        left: true
      }

      color: "transparent"

      Frame {
        anchors.fill: parent
        color: "black"
        radius: 14
      }
    }
  }
}
