#include "UserInterfaceManager.h"

UserInterfaceManager::UserInterfaceManager(QObject *parent) : QObject(parent) {
    updateMenuAndTools();
}

void UserInterfaceManager::updateMenuAndTools() {
    // define sidebar menu
    m_sidebarMenuItems.clear();
    m_sidebarMenuItems.append("圣遗物扫描");
    m_sidebarMenuItems.append("使用说明");
    m_sidebarMenuItems.append("关于");
    emit sidebarMenuItemsChanged();



    emit toolItemsChanged();
}

QStringList UserInterfaceManager::sidebarMenuItems() const {
    return m_sidebarMenuItems;
}

QVariantList UserInterfaceManager::toolItems() const {
    return m_toolItems;
}
