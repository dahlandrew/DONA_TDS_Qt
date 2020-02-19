/*
 * Written by Andrew Dahl, Mechatronics Engineer at Bravo Team 2019
 *
 * This is the timer class
 * Timer class starts a timer when 'start record' is pressed
 * When the timer times out it lets handler know to record data and then it repeats until 'stop record' is pressed
 */

#include "timer.h"

timer::timer(QObject *parent) : QObject(parent)
{
    QObject::connect(recTimer, SIGNAL(timeout()), this, SLOT(record()));        //timer automatically emits a timeout() signal which then notifiies the handler function it is time to record
}

timer::~timer()
{
    recTimer->stop();
    delete recTimer;
}

void timer::timerSet(int delay)
{
    recDelay = delay;
    timer::timerSlot();
}

void timer::timerSlot()
{
    recTimer->setInterval(recDelay*1000);
    recTimer->start();      //starts timer of delay seconds set by user
}

void timer::stop()
{
    recTimer->stop();
}

void timer::record()
{
    emit timerNote();
    //timer::timerSlot();
}
