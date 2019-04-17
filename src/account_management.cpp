#include "account_management.h"

account_management::account_management(QObject *parent) : QObject(parent)
{
    qDebug()<<qApp->applicationDirPath();
    file.setFileName(qApp->applicationDirPath()+"/nodes.txt");

}

bool account_management::check_that_admin_exist()
{

}

void account_management::register_new_node(int layer_number)
{
    filter_layers(layer_number);

    file.open(QIODevice::ReadWrite | QIODevice::Append);

    out.setDevice(&file);
    for (size_t i = 0; i < dense_layer.size(); ++i)
    {
        qDebug()<<"\033[1;31mlayer:"<<dense_layer[i].first<<" n nodes:"<<dense_layer[i].second<<endl;
        out<<dense_layer[i].first<<":"<<dense_layer[i].second<<endl;
    }
    file.close();
}

void account_management::request_to_plot_connection()
{
    dense_layer.resize(0);
    file.open(QIODevice::ReadOnly);
    out.setDevice(&file);
    while(!out.atEnd())
    {
        QString layer=out.readLine();
        QStringList ll=layer.split(":");
        filter_layers(ll[0].toInt());
    }
    file.close();

    for (size_t i = 0; i < dense_layer.size(); ++i)
    {
        qDebug()<<"\033[1;32mlayer:"<<dense_layer[i].first<<" n nodes:"<<dense_layer[i].second<<
            "\033[0m"<<endl;
//        out<<dense_layer[i].first<<":"<<dense_layer[i].second<<endl;
    }

    double EPS=1e-4;
    for (size_t i = 0; i < dense_layer.size()-1; ++i)
    {
        if(abs(dense_layer[i].first-dense_layer[i+1].first)-1<EPS)
        {
            layer1=dense_layer[i].first;
            n_nodes1=dense_layer[i].second;
            layer2=dense_layer[i+1].first;
            n_nodes2=dense_layer[i+1].second;
            emit new_connectionChanged();
        }
    }
}

int account_management::new_connection() const
{

}

void account_management::setNew_connection(int i)
{

}

QList<int> account_management::get_layers_information()
{
    QList<int> instant;
    instant.push_back(layer1);
    instant.push_back(n_nodes1);
    instant.push_back(layer2);
    instant.push_back(n_nodes2);
    return instant;
}

void account_management::filter_layers(int layer_number)
{
    if(dense_layer.size()==0)
    {
        dense_layer.push_back(std::make_pair(layer_number,1));
    }
    else
    {
        bool founded_layer=false;
        for (size_t i = 0; i < dense_layer.size(); ++i)
        {
            if(dense_layer[i].first==layer_number)
            {
                dense_layer[i].second+=1;
                founded_layer=true;
                break;
            }
        }
        if(!founded_layer)
        {
            dense_layer.push_back(std::make_pair(layer_number,1));
        }
    }
}
