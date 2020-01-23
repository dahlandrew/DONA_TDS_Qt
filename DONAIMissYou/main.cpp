/*
 * Written by Andrew Dahl, Mechatronics Engineer at Bravo Team 2019
 */

#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "handler.h"
//#include "tcp.h"
//#include "pdfwriter.h"


int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QApplication app(argc, argv);

    handler handler; //handler runs on main thread

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("handler", &handler);  //allows main thread to communicate with frontend either can call the other
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    handler.initialize(); //call handler function

    return app.exec();
}
