import QtQuick 2.0
import QtQuick 2.9
import QtQuick.Controls 2.5
import account_management 1.0
Item {
    signal new_node_added()
    property int object_number: 0
    property int xx: 370
    property int yy: 80
    property int width2: 100
    property int height2: 20
    property int num_of_nodes: 0
    property int window_height: 10
    property var anArray: []
    Dense_Manager
    {
        id:fc_manager    //fully connected layer manager
    }

    Rectangle{
        id:parent_id
        x: xx
        y: window_height/2-height2
        width: width2
        height: height2
//        border.color: "#000000"
        radius: 1
        ListView {
            id: gridView
            x: 0
            y: 0
            width: 50
            height: parent_id.height
            model: mymodel
            delegate: Item {
                x: 0
                height: 50
                Node{
                    x:15
                    y:10
                    height2: 20
                    width2: 20
                }
            }
        }
    }
    ListModel {
        id:mymodel
    }

    Newbutton{
        id:btn_id
        yyy:100+btn_id.height
        xxx:xx
        name_of: "Add node"
        status:Number(num_of_nodes+1)
        onButton_clicked: {
            console.log(anArray)
            mymodel.append({})
            num_of_nodes=num_of_nodes+1
            if(parent_id.y>30)
            {
                parent_id.y=parent_id.y-height2/2
                parent_id.height=parent_id.height+height2
            }
            fc_manager.register_new_node(object_number)
            new_node_added()
        }
    }
}
