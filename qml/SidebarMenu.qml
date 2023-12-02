import QtQuick
import QtQuick.Controls

Rectangle {
    color: "#FCFCFC"
    property int lastSelectIndex: -1

    function refreshSidebarMenu() {
        // call function to update menu
        UIManager.updateSidebarMenu();
        let total = UIManager.sidebarMenuItems.length
        // Clear existing items in the model
        dynamicModel.clear();
        // Add new items based on UIManager.sidebarMenuItems
        for (let i = 0; i < UIManager.sidebarMenuItems.length; ++i) {
            let menuText = UIManager.sidebarMenuItems[i]
            dynamicModel.append({"buttonText": menuText})
        }
    }

    ScrollView {
        anchors.fill: parent

        ListView {
            id: menuList
            width: parent.width
            height: parent.height
            model: ListModel {
                id: dynamicModel
                Component.onCompleted: {
                    refreshSidebarMenu()
                }
            }

            delegate: Item {
                width: menuList.width
                height: 40
                property alias backgroundColor: buttonBackgroundRectangle.color
                Button {
                    id: sidebarButton
                    anchors.fill: parent
                    text: model.buttonText
                    font.pixelSize: parent.height * 0.4
                    Rectangle {
                        id: buttonBackgroundRectangle
                        anchors.fill: parent
                    }
                    Rectangle {
                        width: parent.width
                        height: index === 0 ? 0 : 2
                        color: "#B0B0B0"
                        anchors.top: parent.top
                    }
                    onClicked: {
                        if (lastSelectIndex !== -1) {
                            menuList.itemAtIndex(lastSelectIndex).backgroundColor = "white"
                        }
                        backgroundColor = "#CFCFCF"
                        lastSelectIndex = index
                    }
                }
            }
        }
    }
}
