import QtQuick 2.9
import QtQuick.Controls 2.2
import account_management 1.0
ApplicationWindow {
    id:main_parent
    MouseArea{
        anchors.fill: parent
        onMouseXChanged: {
            console.log('x=',mouseX,'y=',mouseY)
        }
    }


    visible: true
    width: 1300
    height: 1000
    title: qsTr("Scroll")

    property real start_x:20
    property real start_x_plot: 20
    property int nObjs: 0
    property var anArray: []
    Dense_Manager
    {
        id:connection_manager
        onNew_connectionChanged: {
            var layer=get_layers_information()
            console.log(layer)
            var first_y1=-25*layer[1]+510
            console.log('y1',first_y1)
            var first_y2=-25*layer[3]+510
            for(var i1=0;i1<layer[1];i1++)
            {
                for(var i2=0;i2<layer[3];i2++)
                {
                    //                    console.log('i1='+Number(i1),',i2='+Number(i2))
                    var our_string='LineShape{startx:'+Number(30)+
                            ';finalx:'+Number(125)+
                            ';starty:'+Number(first_y1+50*i1)+
                            ';finaly:'+Number(first_y2+50*i2)+
                            ';xx:'+Number(start_x_plot)+'}'
                    var newObject = Qt.createQmlObject(our_string,
                                                       main_parent,
                                                       "LineShape");
                    anArray.push(newObject)
                }
            }


            start_x_plot=start_x_plot+110

            //
            //            console.log(our_string)
        }
    }

    Newbutton {
        id: button
        xxx: 20
        yyy: 20
        back_ground_color:"#AA7d23"
        back_ground_color_2:"#AA7d2f"
        name_of: qsTr("Add")
        status: "Add layer"
        onButton_clicked: {
            console.log(start_x)
            nObjs=nObjs+1
            var newObject = Qt.createQmlObject('Denselayer{object_number:'+Number(nObjs)+';xx:'+Number(start_x)+';yy:400;width2: 50;height2: 10;window_height:'+Number(parent.height)+'}',
                                               main_parent,
                                               "Denselayer");
            start_x=start_x+110
            for(var i=0;i<anArray.length;++i)
            {
                anArray[i].destroy()
            }
            anArray=[]

            console.log('size of array ',anArray.length)
        }
    }

    Newbutton{
        id: plot_connection
        xxx: 800
        yyy: 20
        back_ground_color:"#AA7d23"
        back_ground_color_2:"#AA7d2f"
        name_of: qsTr("plot")
        status: ""
        onButton_clicked: {
            for(var i=0;i<anArray.length;++i)
            {
                anArray[i].destroy()
            }
            anArray=[]
            start_x_plot=20
            connection_manager.request_to_plot_connection()
        }
    }

    Newbutton{
        id: clear_lines
        xxx: 940
        yyy: 20
        back_ground_color:"#AA7d23"
        back_ground_color_2:"#AA7d2f"
        name_of: qsTr("clear lines")
        status: ""
        onButton_clicked: {
            start_x_plot=20
            for(var i=0;i<anArray.length;++i)
            {
                anArray[i].destroy()
            }
            anArray=[]
        }
    }
}
