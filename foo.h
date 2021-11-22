#pragma once
#include <QObject>
#include <QString>

class Foo : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString name MEMBER m_name NOTIFY nameChanged)

public:
    Foo(QObject *parent = nullptr);

signals:
    void nameChanged();

private:
    QString m_name{ "Foo" };
};
