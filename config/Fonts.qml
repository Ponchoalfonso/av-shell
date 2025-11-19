pragma Singleton

import QtQuick
import Quickshell

Singleton {
  id: root

  readonly property FontLoader tablerIcons: FontLoader {
    source: Qt.resolvedUrl(`${Quickshell.shellDir}/assets/fonts/tabler-icons.ttf`)
  }
}
