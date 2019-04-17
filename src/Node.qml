import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0
import QtQuick.Dialogs 1.1
import QtQuick.Controls.Styles 1.4
import QtCharts 2.3

Item {
    property int width2: 100
    property int height2: 50

    Rectangle {
        id:remove_user
        width: width2
        height: height2
        radius: width/2
        border.color: "#123108"
        border.width: 3
        color: "#123108"
    }
}
