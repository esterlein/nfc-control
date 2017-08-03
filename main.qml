import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Window 2.2
import QtNfc 5.2

ApplicationWindow {
    id: window
    visible: true
    width: 200
        height: 228

    header: ToolBar {
        Button {
            id: navbutton
        }
    }

    Drawer {
        id: drawer
        y: header.height
        width: window.width * 0.6
        height: window.height - header.height
    }

    Label {
            id: content

            text: "Aa"
            font.pixelSize: 96
            anchors.fill: parent
            verticalAlignment: Label.AlignVCenter
            horizontalAlignment: Label.AlignHCenter

            transform: Translate {
                x: drawer.position * content.width * 0.33
            }
        }
}
