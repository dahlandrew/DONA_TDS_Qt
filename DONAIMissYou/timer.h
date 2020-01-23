#ifndef TIMER_H
#define TIMER_H

#include <QObject>
#include <QTimer>
#include <QDebug>

class timer : public QObject
{
    Q_OBJECT
public:
    explicit timer(QObject *parent = nullptr);

    void timerSet(int delay);
    void timerSlot();
    void stop();

signals:

    void timerNote();

public slots:

    void record();

private:

    int recDelay;

    QTimer *recTimer = new QTimer(this);
};

#endif // TIMER_H
