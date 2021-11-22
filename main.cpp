#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "app.h"
#include "foo.h"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);

    qmlRegisterType<App>("Frozen", 1, 0, "App");
    qmlRegisterType<Foo>("Frozen", 1, 0, "Foo");

    qRegisterMetaType<Foo*>("Foo*");
    qRegisterMetaType<const Foo*>("const Foo*");

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
