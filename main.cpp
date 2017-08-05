#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "NFCManager.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    NFCManager nfcManager;
    QQmlApplicationEngine engine;
    QQmlContext* context = engine.rootContext();
    context->setContextProperty("nfcManager", &nfcManager);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if(engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
