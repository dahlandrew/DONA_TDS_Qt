/*
 * Written by Andrew Dahl, Mechatronics Engineer at Bravo Team 2019
 */

#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QTranslator>

#include "handler.h"
//#include "tcp.h"
//#include "pdfwriter.h"


int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QApplication app(argc, argv);

    handler handler; //handler runs on main thread.

    QTranslator myappTranslator;
    myappTranslator.load(QLocale::system().name());
    app.installTranslator(&myappTranslator);

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("handler", &handler);  //allows main thread to communicate with frontend either can call the other
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

#ifdef Q_OS_ANDROID
    auto  result = QtAndroid::checkPermission(QString("android.permission.WRITE_EXTERNAL_STORAGE"));
    if(result == QtAndroid::PermissionResult::Denied){
        QtAndroid::PermissionResultMap resultHash = QtAndroid::requestPermissionsSync(QStringList({"android.permission.WRITE_EXTERNAL_STORAGE"}));
        if(resultHash["android.permission.WRITE_EXTERNAL_STORAGE"] == QtAndroid::PermissionResult::Denied)
            return 0;
    }
#endif

    handler.initialize(); //call handler function

    return app.exec();
}
