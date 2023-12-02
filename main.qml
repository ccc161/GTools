import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts
import "./qml"

Window {
    id: mainWindow
    width: 800
    height: 600
    minimumWidth: 800
    minimumHeight: 600
    visible: true
    title: qsTr("GTools")
    property double sidebarMenuFraction: 0.25

    RowLayout {
        anchors.fill: parent

        SidebarMenu {
            Layout.fillHeight: true
            Layout.preferredWidth: parent.width * sidebarMenuFraction
        }

        ToolStack {
            Layout.fillHeight: true
            Layout.preferredWidth: parent.width * (1 - sidebarMenuFraction)
        }
    }

}
