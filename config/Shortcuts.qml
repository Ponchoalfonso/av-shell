pragma Singleton

import Quickshell
import Quickshell.Hyprland

Singleton {
  id: root

  readonly property GlobalShortcut toggleControlDrawer: GlobalShortcut {
    appid: "av-shell"
    name: "toggle-control-drawer"
    description: "Opens the control drawer menu"
  }
}
