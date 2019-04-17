#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <account_management.h>
#include <QFile>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QFile file;
    QGuiApplication app(argc, argv);
    file.setFileName(qApp->applicationDirPath()+"/nodes.txt");
    file.remove();
    QQmlApplicationEngine engine;
    qmlRegisterType<account_management>("account_management",1,0,"Dense_Manager");
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
