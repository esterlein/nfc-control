import QtQuick 2.7
import QtQuick.Controls 2.0

Rectangle {
    anchors.fill: parent

    Button {
        id: nfcbutton
        anchors.centerIn: parent

        onClicked: nfcManager.startNfcDetection()
    }
}
