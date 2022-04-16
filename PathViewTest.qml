import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    id: mainWindow
    width: 800
    height: 480
    visible: true
    title: qsTr("Selector")



    Rectangle {
        id: mainRectangle
        anchors.fill: parent
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
        gradient: bkgGradient

        Component {
            id: delegateObj
            Column {
                id: wrapper
                //opacity: PathView.isCurrentItem ? 1 : 0.5
                opacity: PathView.iconOpacity
                scale: PathView.iconScale

                Image {
                    id: delegateImage
                    anchors.horizontalCenter: nameText.horizontalCenter
                    width: pathViewObj.size; height: pathViewObj.size
                    source: icon
                }

                Text {
                    id: nameText
                    text: name
                    font.pointSize: 16
                    color: "white"
                }
            }
        }

        Component {
            id: delegateTest
            Rectangle{
                width: 2
                height: 2
            }
        }

        Gradient {
            id: bkgGradient
            GradientStop { position: 0.0; color: "#0c1215" }
            GradientStop { position: 0.49772 ; color: "#003e5c"}
            GradientStop { position: 1.0; color: "#000f11" }
        }

        PathView{
            id: pathViewObj
            delegate: delegateTest
            model: 300
//            delegate: delegateObj
//            model: modelList
            anchors.fill: parent
            anchors.rightMargin: 285
            anchors.bottomMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 0
            //flickDeceleration: 200
            maximumFlickVelocity: 100
            property int size: 64
            property int handleX: mainWindow.width/6
            property int handleY: mainWindow.height/3

            path: Path{
                id: mainPath

                startX: mainWindow.width/2;
                startY: 2*mainWindow.height/3
                PathAttribute { name: "iconOpacity"; value: 1.0 }
                PathAttribute { name: "iconScale"; value: 1.0 }

                PathQuad
                {  id: pathPoint1;
                    x: pathViewObj.handleX;
                    y: mainWindow.height/2;
                    controlX: x+10 ;
                    controlY: 2*pathViewObj.handleY-20;
                }
                PathAttribute { name: "iconOpacity"; value: 0.7 }
                PathAttribute { name: "iconScale"; value: 0.8 }

                PathQuad
                {  id: pathPoint2;
                    x: mainWindow.width/2;
                    y: pathViewObj.handleY;
                    controlX: pathPoint1.x+10 ;
                    controlY: y+20;
                }
                PathAttribute { name: "iconOpacity"; value: 0.3 }
                PathAttribute { name: "iconScale"; value: 0.5 }

                PathQuad
                {  id: pathPoint3;
                    x: 5*pathViewObj.handleX;
                    y: mainWindow.height/2;
                    controlX: x-10 ;
                    controlY: pathViewObj.handleY+20;
                }
                PathAttribute { name: "iconOpacity"; value: 0.7 }
                PathAttribute { name: "iconScale"; value: 0.8 }

                PathQuad
                {  id: pathPoint4;
                    x: mainWindow.width/2;
                    y: 2*pathViewObj.handleY;
                    controlX: pathPoint3.x-10 ;
                    controlY: y-20;
                }
                PathAttribute { name: "iconOpacity"; value: 1.0 }
                PathAttribute { name: "iconScale"; value: 1.0 }

                //PathCurve { x: mainWindow.width/6; y: mainWindow.height/2}
                //PathCurve { x: mainWindow.width/2; y: mainWindow.height/3}
                //PathCurve { x: 5*mainWindow.width/6; y: mainWindow.height/2}
                //PathCurve { x: mainWindow.width/2; y: 2*mainWindow.height/3}
                //PathAttribute { name: "iconOpacity"; value: 1.0 }
                //PathAttribute { name: "iconScale"; value: 1.0 }
                //PathQuad { id: pathPoint1; x: mainWindow.width/6; y: mainWindow.height/3; controlX: mainWindow.width/6; controlY: mainWindow.height/6 }
                //PathQuad { id: pathPoint2; x: 3*mainWindow.width/6; y: mainWindow.height/4; controlX: mainWindow.width/2; controlY: 60}
                //PathQuad { id: pathPoint3;  x: 4*mainWindow.width/6; y: mainWindow.height/4; controlX: mainWindow.width/3; controlY: 2*mainWindow.height/3 }
            }

        }

        Text {
            text: "C1"
            color: "white"
            x: pathPoint1.controlX; y: pathPoint1.controlY
            //x: mainWindow.width/6; y: mainWindow.height/2
            font.pointSize: 30
        }

        Text {
            text: "C2"
            color: "white"
            x: pathPoint2.controlX; y: pathPoint2.controlY
            //x: 5*mainWindow.width/6; y: mainWindow.height/2
            font.pointSize: 30
        }

        Text {
            text: "C3"
            color: "white"
            x: pathPoint3.controlX; y: pathPoint3.controlY
            //x: mainWindow.width/2; y: mainWindow.height/3
            font.pointSize: 30
        }

        Text {
            text: "C4"
            color: "white"
            x: pathPoint4.controlX; y: pathPoint4.controlY
            //x: mainWindow.width/2; y: mainWindow.height/3
            font.pointSize: 30
        }

        ListModel {
            id: modelList
            ListElement {
                name: "A"
                icon: "pics/qtlogo.png"
            }
            ListElement {
                name: "B"
                icon: "pics/qtlogo.png"
            }
            ListElement {
                name: "C"
                icon: "pics/qtlogo.png"
            }
            ListElement {
                name: "D"
                icon: "pics/qtlogo.png"
            }
            ListElement {
                name: "E"
                icon: "pics/qtlogo.png"
            }
        }
    }

}
