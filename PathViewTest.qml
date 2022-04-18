import QtQuick 2.12
import QtQuick.Window 2.12
//import QtGraphicalEffects 1.12

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
            ListElement {
                name: "F"
                icon: "pics/qtlogo.png"
            }
            ListElement {
                name: "G"
                icon: "pics/qtlogo.png"
            }
        }

        Component {
            id: delegateObj
            Column {
                id: columnWrapper
                //opacity: PathView.isCurrentItem ? 1 : 0.5
                opacity: PathView.iconOpacity
                scale: PathView.iconScale
                z: PathView.z

                Image {
                    id: delegateImage
                    anchors.horizontalCenter: parent.horizontalCenter
                    //anchors.verticalCenter: parent.verticalCenter
                    fillMode: Image.PreserveAspectFit
                    width: 80; height: 80
                    source: icon

//                    ColorOverlay {
//                            anchors.fill: delegateImage
//                            source: delegateImage
//                            color:  columnWrapper.isCurrentItem ? "#80800000" : "transparent"
//                    }
                }

                Text {
                    id: nameText
                    text: name
                    font.pointSize: 16
                    anchors.horizontalCenter: parent.horizontalCenter
                    color: "white"
                }
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
//            delegate: delegateTest
//            model: 300
            delegate: delegateObj
            model: modelList
            anchors.fill: parent
            focus: true
            antialiasing: true
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 0
            flickDeceleration: 200
            maximumFlickVelocity: 500
            property int centerX: mainWindow.width/2
            property int centerY: mainWindow.height/2 - mainWindow.height/10
            property int circleWidth: mainWindow.width/2
            property int circleHeight: mainWindow.height/4
            property int controlPointsOffsetX: 10
            property int controlPointsOffsetY: 20

            path: Path{
                id: mainPath

                startX: pathViewObj.centerX;
                startY: pathViewObj.centerY + pathViewObj.circleHeight/2;
                PathAttribute { name: "iconOpacity"; value: 1.0 }
                PathAttribute { name: "iconScale"; value: 1.0 }
                PathAttribute { name: "z"; value: 0 }

                //Left
                PathQuad
                {  id: pathPoint1;
                    x: pathViewObj.centerX - pathViewObj.circleWidth/2;
                    y: pathViewObj.centerY;
                    controlX: x + pathViewObj.controlPointsOffsetX - pathViewObj.controlPointsOffsetX ;
                    controlY: y + pathViewObj.circleHeight/2 - pathViewObj.controlPointsOffsetY;
                }
                PathAttribute { name: "iconOpacity"; value: 1 }
                PathAttribute { name: "iconScale"; value: 0.6 }
                PathAttribute { name: "z"; value: 0 }

                //Upper Center
                PathQuad
                {  id: pathPoint2;
                    x: pathViewObj.centerX;
                    y: pathViewObj.centerY - pathViewObj.circleHeight/2;
                    controlX: x - pathViewObj.circleWidth/2 //+ pathViewObj.controlPointsOffsetX ;
                    controlY: y //+ pathViewObj.controlPointsOffsetY;
                }
                PathAttribute { name: "iconOpacity"; value: 0.2 }
                PathAttribute { name: "iconScale"; value: 0.3 }
                PathAttribute { name: "z"; value: -1 }

                //Right
                PathQuad
                {  id: pathPoint3;
                    x: pathViewObj.centerX + pathViewObj.circleWidth/2;
                    y: pathViewObj.centerY;
                    controlX: x - pathViewObj.controlPointsOffsetX ;
                    controlY: y - pathViewObj.circleHeight/2 //+ pathViewObj.controlPointsOffsetY;
                }
                PathAttribute { name: "iconOpacity"; value: 1 }
                PathAttribute { name: "iconScale"; value: 0.6 }
                PathAttribute { name: "z"; value: 0 }

                //Lower Center
                PathQuad
                {  id: pathPoint4;
                    x: pathViewObj.centerX;
                    y: pathViewObj.centerY + pathViewObj.circleHeight/2;
                    controlX: x + pathViewObj.circleWidth/2 - pathViewObj.controlPointsOffsetX ;
                    controlY: y - pathViewObj.controlPointsOffsetY;
                }
            }

//            highlight: Rectangle {
//                x: pathPoint1.x
//                y: pathPoint1.y
//                width: 100; height: 120
//                color: "transparent"
//                border.color: "lightblue"
//            }

        }


        // ------------------------------ TESTS ----------------------------------------------------------

//        Component {
//            id: delegateTest
//            Rectangle{
//                width: 2
//                height: 2
//            }
//        }

//        Text {
//            text: "C1"
//            color: "white"
//            x: mainPath.startX; y: mainPath.startY
//            //x: pathPoint1.controlX; y: pathPoint1.controlY
//            //x: pathViewObj.centerX; y: pathViewObj.centerY;
//            font.pointSize: 30
//        }

//        Text {
//            text: "C2"
//            color: "white"
//            x: pathPoint2.controlX; y: pathPoint2.controlY
//            font.pointSize: 30
//        }

//        Text {
//            text: "C3"
//            color: "white"
//            x: pathPoint3.controlX; y: pathPoint3.controlY
//            font.pointSize: 30
//        }

//        Text {
//            text: "C4"
//            color: "white"
//            x: pathPoint4.controlX; y: pathPoint4.controlY
//            font.pointSize: 30
//        }

    }

}
