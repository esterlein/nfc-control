import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.2
/*
Rectangle {
  width: 640
  height: 480
  Background { anchors.fill: parent }
  Column {
    anchors.centerIn: parent
    spacing: 16
    Column {
      spacing: 4
      MediumText { text: "Username" }
      LineInput { focus: true }
    }
    Column {
      spacing: 4
      MediumText { text: "Password" }
      LineInput { input.echoMode: TextInput.Password }
    }
    Row {
      spacing: 16
      anchors.horizontalCenter: parent.horizontalCenter
      Button { text: "Login"; onClicked: console.log("login") }
      Button { text: "Guest"; onClicked: console.log("guest") }
    }
  }
}
*/
Rectangle {
    anchors.fill: parent
    width: parent.width

    ColumnLayout {
        anchors.centerIn: parent
        width: parent.width / 2
        spacing: 16

        TextField {
            id: login
            Layout.fillWidth: true
            placeholderText: "Username"
            //enabled: enginioClient.authenticationState == Enginio.NotAuthenticated
        }

        TextField {
            id: password
            Layout.fillWidth: true
            placeholderText: "Password"
            echoMode: TextInput.PasswordEchoOnEdit
            //enabled: enginioClient.authenticationState == Enginio.NotAuthenticated
        }

        Button {
            id: loginButton
            Layout.fillWidth: true
        }

        TextArea {
            id: status
            text: "Not logged in\n\n"
            readOnly: true
            Layout.fillHeight: true
            Layout.fillWidth: true

            /*Connections {
                    target: enginioClient
                    onSessionAuthenticated: {
                        data.text = data.text + "User '"+ login.text +"' is logged in.\n\n" + JSON.stringify(reply.data, undefined, 2) + "\n\n"
                    }
                    onSessionAuthenticationError: {
                        data.text = data.text + "Authentication of user '"+ login.text +"' failed.\n\n" + JSON.stringify(reply.data, undefined, 2) + "\n\n"
                    }
                    onSessionTerminated: {
                        data.text = data.text + "Session closed.\n\n"
                    }
                }*/
        }

        states: [
            State {
                name: "NotAuthenticated"
                //when: enginioClient.authenticationState == Enginio.NotAuthenticated
                PropertyChanges {
                    target: loginButton
                    text: "Login"
                    onClicked: {
                        //enginioClient.identity = identity
                    }
                }
            },
            State {
                name: "Authenticating"
                //when: enginioClient.authenticationState == Enginio.Authenticating
                PropertyChanges {
                    target: loginButton
                    text: "Authenticating..."
                    enabled: false
                }
            },
            State {
                name: "AuthenticationFailure"
                //when: enginioClient.authenticationState == Enginio.AuthenticationFailure
                PropertyChanges {
                    target: loginButton
                    text: "Authentication failed, restart"
                    onClicked: {
                        //enginioClient.identity = null
                    }
                }
            },
            State {
                name: "Authenticated"
                //when: enginioClient.authenticationState == Enginio.Authenticated
                PropertyChanges {
                    target: loginButton
                    text: "Logout"
                    onClicked: {
                        //enginioClient.identity = null
                    }
                }
            }
        ]
    }
}
