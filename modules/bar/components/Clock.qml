import qs.modules
import qs.lib
import qs.lib.containers

StyledContainer {
  id: clock
  implicitWidth: time.width + 10 * 2

  StyledText {
    id: time
    anchors.centerIn: clock.container
    font.bold: true
    text: SystemInfo.time
  }
}
