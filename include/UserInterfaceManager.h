#ifndef USERINTERFACEMANAGER_H
#define USERINTERFACEMANAGER_H

#include <QObject>
#include <QStringList>
#include <QVariantList>
#include <QQuickItem>

class UserInterfaceManager : public QObject {
    Q_OBJECT // macro for feature like signals and slots
    // Q_PROPERTY macro defines property, used to communicate with QML
    Q_PROPERTY(QStringList sidebarMenuItems READ sidebarMenuItems NOTIFY sidebarMenuItemsChanged FINAL)
    Q_PROPERTY(QVariantList toolItems READ toolItems NOTIFY sidebarMenuItemsChanged FINAL)
public:

    explicit UserInterfaceManager(QObject *parent=nullptr);

    Q_INVOKABLE void updateMenuAndTools();

    QStringList sidebarMenuItems() const;

    QVariantList toolItems() const;

signals:
    void sidebarMenuItemsChanged();
    void toolItemsChanged();

private:
    QStringList m_sidebarMenuItems;
    QVariantList m_toolItems;
};


#endif // USERINTERFACEMANAGER_H
