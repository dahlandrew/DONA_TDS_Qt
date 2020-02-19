#include "graphtimer.h"

GraphTimer::GraphTimer(QObject *parent) : QObject(parent)
{
    QObject::connect(graphTimer, &QTimer::timeout, this, &GraphTimer::appendToGraph);
}

GraphTimer::~GraphTimer()
{
    graphTimer->stop();
    delete graphTimer;
}

void GraphTimer::timer()
{
    //qDebug() << "graph timer has started";
    graphTimer->setInterval(delay);
    graphTimer->start();

    //graphTimer->callOnTimeout(&GraphTimer::appendToGraph, Qt::DirectConnection);
}

void GraphTimer::stop()
{
    //qDebug() << "everything should stop";
    //GraphTimer::~GraphTimer();
    graphTimer->stop();
}

void GraphTimer::appendToGraph()
{
    emit publishGraph();
    //qDebug() << "published";
}
