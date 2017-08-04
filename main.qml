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
            onClicked: drawer.interact()
        }
    }

    Drawer {
        id: drawer
        y: header.height
        width: window.width * 0.7
        height: window.height - header.height

        Button {
            id: nfcbutton
            width: parent.width
        }

        function interact(){
            if(!this.visible)
                this.open()
            else
                this.close()
        }
    }

    Loader {
        id: loader

        function loadFragment(index){
            switch(index){
            case 0:
                loader.source = "FragmentNFC.qml"
                break;
            default:
                loader.source = "FragmentNFC.qml"
                break;
            }
        }
    }

    Label {
            id: content

            text: "Transcash"
            font.pixelSize: 50
            anchors.fill: parent
            verticalAlignment: Label.AlignVCenter
            horizontalAlignment: Label.AlignHCenter

            transform: Translate {
                x: drawer.position * content.width * 0.33
            }
        }
}
