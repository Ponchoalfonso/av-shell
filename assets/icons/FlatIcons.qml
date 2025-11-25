pragma Singleton

import QtQuick
import Quickshell

Singleton {
  id: root

  readonly property FontLoader fontSolidRounded: FontLoader {
    source: Qt.resolvedUrl(`${Quickshell.shellDir}/assets/fonts/fi-sr-uicons.woff2`)
  }
  readonly property FontLoader fontBoldRounded: FontLoader {
    source: Qt.resolvedUrl(`${Quickshell.shellDir}/assets/fonts/fi-br-uicons.woff2`)
  }

  readonly property string volume: '\uf44a'
  readonly property string volumeMute: '\uf44d'
  readonly property string volumeSlash: '\uf44f'
  readonly property string volumeDown: '\uf44c'
  readonly property string volumeOff: '\uf44e'
}
