#include "app.h"

App::App(QObject *parent) : QObject(parent)
{
}

void App::triggerSignal()
{
    emit fooMember2Emitted(&m_fooMember2);
}

Foo* App::fooMember()
{
    return &m_fooMember;
}


const Foo* App::fooMemberConst() const
{
    return &m_fooMember;
}

Foo* App::fooMember2()
{
    return &m_fooMember2;
}
