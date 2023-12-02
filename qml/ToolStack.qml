import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    id: toolStackRectangle
    color: "white"
    property alias currentIndex: pageStack.currentIndex
    property var pageMap: {
        "欢迎": "/qml/pages/WelcomePage.qml",
        "圣遗物扫描": "/qml/pages/ArtifactScannerPage.qml",
        "默认": "/qml/pages/DefaultPage.qml"
    }

    Connections {
        target: UIManager
        function onToolItemsChanged() {
            createPages(UIManager.sidebarMenuItems)
        }
    }

    StackLayout {
        id: pageStack
        anchors.fill: parent
        Component.onCompleted: createWelcomePage()
   }

    function createPages(menuItems) {
        for (let i = 0; i < menuItems.length; i++) {
            let name = menuItems[i]
            if (name in pageMap) {
                createPage(pageMap[name])
            } else {
                createDefaultPage()
            }
        }
    }

    function createPage(qmlPath) {
        let component = Qt.createComponent(qmlPath)
        if (component.status === Component.Ready) {
            let sprite = component.createObject(pageStack, {});
            if (sprite === null) {
                // Error Handling
                console.log("Error creating object");
            }
        } else if (component.status === Component.Error) {
            // Error Handling
            console.log("Error loading component:", component.errorString());
        }

    }

    function createDefaultPage() {
        createPage(pageMap["默认"])
    }

    function createWelcomePage() {
        createPage(pageMap["欢迎"])
    }
}
