import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0
import QtQuick.Dialogs 1.1
import QtQuick.Controls.Styles 1.4
import QtCharts 2.3

Item {
    signal button_clicked()
    function restore()
    {
        img_source="qrc:/white_n.png"
        back_ground_color="#237d2f"
        back_ground_color_2="#237d2f"
        back_ground_color_3=back_ground_color
        back_ground_color_4=back_ground_color_2
    }

    function activated()
    {
        back_ground_color_3="#000000"
    }

    property int xxx: 370
    property int yyy: 80
    property int width2: 100
    property int height2: 50
    property string back_ground_color:"#237d2f"//
    property string back_ground_color_2:"#237d2f"
    property string back_ground_color_3:back_ground_color
    property string back_ground_color_4:back_ground_color_2

    property string name_of: "Menu"
    property string status: "Status"
    property string this_situation: "Menu"
    property bool area_using_that: false
    property int  radius2: 0
    property string  img_source: ""
    property int f_size: 12
    Rectangle {
        id:remove_user
        x: xxx
        y: yyy
        width: width2
        height: height2
        radius: radius2
        border.color: "#123108"
        border.width: 3
        LinearGradient {
            anchors.fill: parent
            start: Qt.point(0, 0)
            end: Qt.point(0, height2)
            gradient: Gradient {
                GradientStop { position: 0.0; color:back_ground_color;  }
                GradientStop { position: 1.0; color:back_ground_color_2; }
            }
        }

        Rectangle{
            x:0
            y:0
            width: 10
            height: height2
            LinearGradient {
                anchors.fill: parent
                start: Qt.point(0, 0)
                end: Qt.point(0, height2)
                gradient: Gradient {
                    GradientStop { position: 0.0; color:back_ground_color_3;  }
                    GradientStop { position: 1.0; color:back_ground_color_4; }
                }
            }
        }

        color: back_ground_color
        z:10
        Label{
            text: name_of
            anchors.fill: parent
            font.family: "Times New Roman"
            horizontalAlignment: Text.AlignLeft
            font.pointSize: f_size
            anchors.bottomMargin: 10
            anchors.leftMargin: 20
            color: "#EEEEEE"
        }
        Label{
            text: status
            anchors.fill: parent
            font.family: "Times New Roman"
            horizontalAlignment: Text.AlignLeft
            font.pointSize: 11
            anchors.topMargin: 25
            anchors.leftMargin: 20
            color: "#EEEEEE"
        }
        MouseArea {
            id: mouseArea8;
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 0
            anchors.fill: parent

            Timer {
                id: pass_timer5
                interval:1000;
                running: false;
                repeat: false;
            }

            onClicked: {

                remove_user.state = "pressed"
                stateremove.start()
                pass_timer5.start()
                button_clicked()
            }
        }

        states: State {
            name: "pressed"
            PropertyChanges { target: remove_user; scale: 0.95 }
        }

        Timer {
            id: stateremove
            interval: 120;
            repeat: false
            onTriggered: remove_user.state = 'State0'
        }

        transitions: Transition {
            NumberAnimation { properties: "scale"; duration: 120; easing.type: Easing.InOutQuad }
        }
    }
}
