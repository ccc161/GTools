#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QIcon>
#include <QQmlContext>
#include "UserInterfaceManager.h"

int main(int argc, char *argv[])
{


#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);
    app.setWindowIcon(QIcon(":/resource/icon/mainWindow.png"));

    // C++ classes interact with QML
    UserInterfaceManager UIManager;


    QQmlApplicationEngine engine;

    // Register C++ classes
    engine.rootContext()->setContextProperty("UIManager", &UIManager);


    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreated,
        &app,
        [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection);

    engine.load(url);


    return app.exec();
}
