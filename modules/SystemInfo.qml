pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
  id: root
  property string username
  property string hostname

  Process {
    command: ["whoami"]
    running: true

    stdout: StdioCollector {
      onStreamFinished: root.username = this.text.trim()
    }
  }

  Process {
    command: ["hostnamectl", "hostname"]
    running: true

    stdout: StdioCollector {
      onStreamFinished: root.hostname = this.text.trim()
    }
  }
}
