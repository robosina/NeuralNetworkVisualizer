#ifndef ACCOUNT_MANAGEMENT_H
#define ACCOUNT_MANAGEMENT_H

#include <QObject>
#include <QProcess>
#include <QDebug>
#include <QCryptographicHash>‬‬
#include <QDir>
#include <QFile>
#include <QTextStream>
#include <iostream>
#include <QDebug>
#include <QGuiApplication>
using namespace std;
using dense_type=vector<std::pair<int,int>>;

class account_management : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int new_connection READ new_connection WRITE setNew_connection NOTIFY new_connectionChanged)
    // 1: check root user name and password
public:
    explicit account_management(QObject *parent = nullptr);
    Q_INVOKABLE bool check_that_admin_exist();
    Q_INVOKABLE void register_new_node(int layer_number);
    Q_INVOKABLE void request_to_plot_connection();
    int new_connection() const;
    Q_INVOKABLE void setNew_connection(int i);
    Q_INVOKABLE QList<int> get_layers_information(void);
    void filter_layers(int layer_number);
signals:
    void new_connectionChanged();
public slots:

private:
    dense_type dense_layer;
    int layer1,n_nodes1,layer2,n_nodes2;
    QFile file;
    QTextStream out;
    QList<int> output;
};

#endif // ACCOUNT_MANAGEMENT_H
