#ifndef GRAPHTIMER_H
#define GRAPHTIMER_H

#include <QObject>
#include <QTimer>
#include <QDebug>

class GraphTimer : public QObject
{

    Q_OBJECT
public:
    explicit GraphTimer(QObject *parent = nullptr);

    void timer();
    void stop();

signals:

    void publishGraph();

public slots:

    void appendToGraph();

private:

    int delay = 1000;

    QTimer *graphTimer = new QTimer(this);
};

#endif // GRAPHTIMER_H
