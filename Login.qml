import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.2

ColumnLayout {
    anchors.fill: parent
    //anchors.margins: 3
    //spacing: 3

    Item {
        anchors.verticalCenter: parent.verticalCenter

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
            id: proccessButton
            Layout.fillWidth: true
        }

        TextArea {
            id: data
            text: "Not logged in.\n\n"
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
                    target: proccessButton
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
                    target: proccessButton
                    text: "Authenticating..."
                    enabled: false
                }
            },
            State {
                name: "AuthenticationFailure"
                //when: enginioClient.authenticationState == Enginio.AuthenticationFailure
                PropertyChanges {
                    target: proccessButton
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
                    target: proccessButton
                    text: "Logout"
                    onClicked: {
                        //enginioClient.identity = null
                    }
                }
            }
        ]
    }
}
