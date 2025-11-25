import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell.Services.Pipewire
import qs.assets.icons
import qs.config
import qs.lib
import qs.lib.containers

StyledContainer {
  id: audio
  implicitWidth: volumeIcon.width + 10 * 2

  PwObjectTracker {
    objects: [Pipewire.defaultAudioSink]
  }

  function resolveIcon() {
    if (!Pipewire.ready || Pipewire.defaultAudioSink.audio.muted)
      return TablerIcons.resolveName('volume-off');
    if (Pipewire.defaultAudioSink.audio.volume > 0.5)
      return TablerIcons.resolveName('volume');
    if (Pipewire.defaultAudioSink.audio.volume > 0)
      return TablerIcons.resolveName('volume-2');
    if (Pipewire.defaultAudioSink.audio.volume == 0)
      return TablerIcons.resolveName('volume-3');
    return TablerIcons.resolveName('volume-off');
  }

  Button {
    id: volumeIndicator
    anchors.fill: parent.container
    background: Rectangle {
      anchors.fill: parent
      color: "transparent"
    }

    FlexboxLayout {
      anchors.fill: parent
      alignItems: FlexboxLayout.AlignCenter
      justifyContent: FlexboxLayout.JustifyCenter

      StyledText {
        id: volumeIcon
        anchors.topMargin: 3
        font.family: Fonts.tablerIcons.font.family
        font.pointSize: 12
        font.bold: true
        text: audio.resolveIcon()
      }

      // StyledText {
      //   id: volumeText
      //   font.bold: true
      //   text: (Pipewire.defaultAudioSink.audio.volume * 100).toFixed(0) + "%"
      // }
    }
  }
}
