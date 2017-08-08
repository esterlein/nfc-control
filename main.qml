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

    Drawer {
        id: drawer
        y: header.height
        width: window.width * 0.85
        height: window.height - header.height

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
        ListElement {fragment: "Login"}
        ListElement {fragment: "Smth2"}
    }

    Loader {
        id: loader
        anchors.fill: parent

        function loadFragment(index){
            switch(index){
            case 0:
                loader.source = "FragmentNFC.qml"
                drawer.close()
                break;
            case 1:
                loader.source = "Login.qml"
                drawer.close()
                break;
            default:
                loader.source = "Login.qml"
                drawer.close()
                break;
            }
        }
    }
}
