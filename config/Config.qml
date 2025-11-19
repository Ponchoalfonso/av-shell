pragma Singleton

import QtQuick
import Quickshell

Singleton {
  id: root
  readonly property color mainColor: "black"
  readonly property string osIconPath: "/usr/share/pixmaps/archlinux-logo.svg"
}
