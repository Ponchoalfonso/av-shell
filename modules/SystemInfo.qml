pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
  id: root
  property string username
  property string hostname
  property string time: Qt.formatDateTime(clock.date, "hh:mm")

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

  SystemClock {
    id: clock
    precision: SystemClock.Seconds
  }
}
