#include "UserInterfaceManager.h"

UserInterfaceManager::UserInterfaceManager(QObject *parent) : QObject(parent) {
    updateSidebarMenu();
}

void UserInterfaceManager::updateSidebarMenu() {
    // define sidebar menu
    m_sidebarMenuItems.clear();
    m_sidebarMenuItems.append("圣遗物扫描");
    m_sidebarMenuItems.append("使用说明");
    m_sidebarMenuItems.append("关于");
    emit sidebarMenuItemsChanged();
}

QStringList UserInterfaceManager::sidebarMenuItems() const {
    return m_sidebarMenuItems;
}
