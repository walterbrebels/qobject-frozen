#pragma once
#include <QObject>
#include "foo.h"

class App : public QObject
{
    Q_OBJECT
    Q_PROPERTY(Foo* fooMember READ fooMember CONSTANT);
    Q_PROPERTY(const Foo* fooMemberConst READ fooMemberConst CONSTANT);
    Q_PROPERTY(Foo* fooMember2 READ fooMember2 CONSTANT);

public:
    App(QObject *parent = nullptr);

    Q_INVOKABLE void triggerSignal();

signals:
    void fooMember2Emitted(const Foo* fooMember2);

private:
    Foo* fooMember();
    const Foo* fooMemberConst() const;
    Foo* fooMember2();

    Foo m_fooMember;
    Foo m_fooMember2;
};
