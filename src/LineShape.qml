import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Shapes 1.11
import QtGraphicalEffects 1.12
Item {
    property int startx: 0
    property int starty:50
    property int finalx: 30
    property int finaly: 0
    property int xx: 30
    property int yy: 0
    property int xofset: 0
    property int yofset: 0
    property int hheight: 300
    property string colore: "#000000"
    property string nameof: "8"
    Shape{
        x:xx
        y:yy
        width: 160
        height: 700
        layer.enabled: true
        layer.samples: 5

        ShapePath {

            strokeWidth: 1
            strokeStyle: ShapePath.SolidLine
            dashPattern: [ 1, 2 ]
            startX: startx
            startY: starty
            strokeColor: colore
            fillColor: "transparent"
            PathLine {
                x: finalx
                y: finaly
            }
        }
    }
}
