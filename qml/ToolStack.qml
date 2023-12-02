import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    color: "#CFDEDD"

    StackLayout {
        id: toolContentStack
        anchors.fill: parent

        // Initial content
        Item {
            Label {
                text: "Default Content"
                anchors.centerIn: parent
            }
        }

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
        // Add more items for other buttons as needed
    }
}
