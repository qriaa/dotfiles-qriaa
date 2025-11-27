pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
  id: root
  property string time: Qt.formatDateTime(clock.date, "hh:mm:ss - yyyy-MM-dd")

  SystemClock {
      id: clock
      precision: SystemClock.seconds
  }
}
