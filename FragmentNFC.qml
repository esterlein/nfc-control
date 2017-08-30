import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.2

ColumnLayout {
    anchors.fill: parent
    anchors.margins: 3
    spacing: 3

    Text {
        id: nfcrecord
        anchors.horizontalCenter: parent.horizontalCenter
        Layout.fillWidth: true
        width: paintedWidth
        //height: paintedHeight
        horizontalAlignment: Text.AlignHCenter

        font.pointSize: parent.height * 0.05

        text: nfcManager.m_nfcRecord
    }

    Button {
        id: nfcbutton
        Layout.fillWidth: true
        anchors.bottom: parent.bottom

        Layout.minimumHeight: 150

        onClicked: nfcManager.startNfcDetection()
    }
}
