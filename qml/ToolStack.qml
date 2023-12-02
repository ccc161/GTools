import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    color: "white"
    property alias currentIndex: toolContentStack.currentIndex

    StackLayout {
        id: toolContentStack
        anchors.fill: parent

        // Initial content
        WelcomePage {}

        // Content for Button1
        Item {
            Label {
                text: "Content for Button1"
                anchors.centerIn: parent
            }
        }

        // Content for Button2
        Item {
            Label {
                text: "Content for Button2"
                anchors.centerIn: parent
            }
        }

        // Content for Button3
        Item {
            Label {
                text: "Content for Button3"
                anchors.centerIn: parent
            }
        }
    }
}
