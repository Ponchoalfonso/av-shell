import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell.Services.Pipewire
import qs.assets.icons
import qs.lib
import qs.lib.containers

StyledContainer {
  id: audio
  implicitWidth: volumeIcon.width + 10 * 2

  PwObjectTracker {
    objects: [Pipewire.defaultAudioSink]
  }

  function resolveIcon() {
    if (!Pipewire.ready)
      return TablerIcons.volumeOff;
    if (Pipewire.defaultAudioSink.audio.volume == 0 || Pipewire.defaultAudioSink.audio.muted)
      return TablerIcons.volume3;
    if (Pipewire.defaultAudioSink.audio.volume > 0.5)
      return TablerIcons.volume;
    if (Pipewire.defaultAudioSink.audio.volume > 0)
      return TablerIcons.volume2;
    return TablerIcons.volume;
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
        font.family: TablerIcons.tablerIconsFont.font.family
        font.pointSize: 12
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
