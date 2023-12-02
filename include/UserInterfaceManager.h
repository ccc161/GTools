#ifndef USERINTERFACEMANAGER_H
#define USERINTERFACEMANAGER_H

#include <QObject>
#include <QStringList>
#include <map>
#include <iostream>

class UserInterfaceManager : public QObject {
    Q_OBJECT // macro for feature like signals and slots
    // Q_PROPERTY macro defines property, used to communicate with QML
    Q_PROPERTY(QStringList sidebarMenuItems READ sidebarMenuItems NOTIFY sidebarMenuItemsChanged FINAL)

public:

    explicit UserInterfaceManager(QObject *parent=nullptr);

    Q_INVOKABLE void updateSidebarMenu();

    QStringList sidebarMenuItems() const;

signals:
    void sidebarMenuItemsChanged();

private:
    QStringList m_sidebarMenuItems;
    std::map<QString, QString> menuMap;
};


#endif // USERINTERFACEMANAGER_H
