#include "graphtimer.h"

GraphTimer::GraphTimer(QObject *parent) : QObject(parent)
{

}

void GraphTimer::timer()
{
    qDebug() << "graph timer has started";
    graphTimer->setInterval(delay);
    graphTimer->start();
    QObject::connect(graphTimer, SIGNAL(timeout()), this, SLOT(appendToGraph()));
}

void GraphTimer::stop()
{
    graphTimer->stop();

}

void GraphTimer::appendToGraph()
{
    emit publishGraph();
}
