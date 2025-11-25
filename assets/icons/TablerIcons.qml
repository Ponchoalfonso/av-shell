pragma Singleton

import Quickshell

Singleton {
  id: root

  readonly property var nameIconMap: {
    const map = new Map();
    map.set('volume-off', '\uf1c3');
    map.set('volume', '\ueb51');
    map.set('volume-2', '\ueb4f');
    map.set('volume-3', '\ueb50');
    return map;
  }

  function resolveName(name) {
    return this.nameIconMap.get(name) || '';
  }
}
