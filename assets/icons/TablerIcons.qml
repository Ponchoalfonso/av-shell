pragma Singleton

import QtQuick
import Quickshell

Singleton {
  id: root

  readonly property FontLoader tablerIconsFont: FontLoader {
    source: Qt.resolvedUrl(`${Quickshell.shellDir}/assets/fonts/tabler-icons.ttf`)
  }

  readonly property string volume: '\ueb51'
  readonly property string volumeOff: '\uf1c3'
  readonly property string volume2: '\ueb4f'
  readonly property string volume3: '\ueb50'
}
