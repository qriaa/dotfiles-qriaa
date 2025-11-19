import QtQuick
import Quickshell

pragma Singleton

Singleton {
    id: root
    property QtObject family
    property QtObject pixelSize

    family: QtObject {
        property string main: "Roboto"
    }

    pixelSize: QtObject {
        property int smallest: 10
        property int smaller: 12
        property int smallO: 13
        property int small: 15
        property int normal: 16
        property int large: 17
        property int larger: 19
        property int largest: 22
    }

}
