import QtQuick
import Quickshell

pragma Singleton

// Themed with the assist of some of the material design philosophy
// Material Design: m3.material.io
// Also useful: https://material-foundation.github.io/material-theme-builder/
// Color contribution philosophy:
// 60% - main color
// 30% - secondary color
// 10% - accent color

Singleton {
    id: root
    property QtObject ref
    property QtObject sys
    property QtObject semantic

    ref: QtObject {
        property color black: "#000000"
        property color white: "#FFFFFF"

        property color neutral0: "#000000"
        property color neutral5: "#111111"
        property color neutral10: "#1C1B1B"
        property color neutral15: "#262625"
        property color neutral20: "#313030"
        property color neutral25: "#3C3B3B"
        property color neutral30: "#484646"
        property color neutral35: "#535252"
        property color neutral40: "#605E5E"
        property color neutral50: "#797676"
        property color neutral60: "#939090"
        property color neutral70: "#ADAAAA"
        property color neutral80: "#C9C6C5"
        property color neutral90: "#E5E2E1"
        property color neutral95: "#F4F0EF"
        property color neutral98: "#FDF8F8"
        property color neutral99: "#F6FEFF"
        property color neutral100: "#FFFFFF"
    }

    sys: QtObject {
        property color surfaceLowest: root.ref.neutral5
        property color surfaceLow: root.ref.neutral10
        property color surface: root.ref.neutral15
        property color surfaceHigh: root.ref.neutral20
        property color surfaceHighest: root.ref.neutral25
        property color onsurface: root.ref.white

        property color outline: root.ref.neutral40
    }

    semantic: QtObject {

    }
}
