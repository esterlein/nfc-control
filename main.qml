import QtQuick 2.7
import QtQuick.Controls 2.0

ApplicationWindow {
    id: window
    visible: true

    header: ToolBar {
        Button {
            id: navbutton
            onClicked: drawer.interact()
        }
    }

    Button {
        anchors.centerIn: parent
        width: parent.width / 1.5
        height: parent.height / 5
    }

    Drawer {
        id: drawer
        y: header.height
        width: window.width * 0.7
        height: window.height - header.height

        /*Button {
            id: nfcbutton
            width: parent.width
        }*/

        ListView {
            anchors.fill: parent

            delegate: Rectangle {
                height: 80
                anchors.left: parent.left
                anchors.right: parent.right

                Text {
                    text: fragment
                    anchors.fill: parent
                    renderType: Text.NativeRendering
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }

                MouseArea {
                    anchors.fill: parent

                    onClicked: loader.loadFragment(index)
                }
            }

            model: navModel
        }

        function interact(){
            if(!this.visible)
                this.open()
            else
                this.close()
        }
    }

    ListModel {
        id: navModel

        ListElement {fragment: "NFC"}
        ListElement {fragment: "Smth1"}
        ListElement {fragment: "Smth2"}
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
