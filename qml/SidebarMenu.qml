import QtQuick
import QtQuick.Controls


Rectangle {
    color: "#FCFCFC"
    property int lastSelectIndex: -1

    ScrollView {
        anchors.fill: parent

        ListView {
            id: menuList
            width: parent.width
            height: parent.height
            model: ListModel {
                id: dynamicModel
                Component.onCompleted: {
                    for (let i = 1; i <= 5; i++) {
                        dynamicModel.append({text: "功能" + i})
                    }
                }
            }

            delegate: Item {
                width: menuList.width
                height: 40
                property alias backgroundColor: buttonBackgroundRectangle.color
                Button {
                    anchors.fill: parent
                    text: "按钮"
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
