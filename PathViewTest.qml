import QtQuick
// import QtQuick.Window

Window {
    id: mainWindow
    width: 600
    height: 400
    visible: true
    title: qsTr("Selector")

    Tests{
        id: testFile
    }

    ListModel {
        id: modelList
        ListElement {
            name: "A"
            icon: "pics/qtlogoAlpha.png"
        }
        ListElement {
            name: "B"
            icon: "pics/qtlogoAlpha.png"
        }
        ListElement {
            name: "C"
            icon: "pics/qtlogoAlpha.png"
        }
        ListElement {
            name: "D"
            icon: "pics/qtlogoAlpha.png"
        }
        ListElement {
            name: "E"
            icon: "pics/qtlogoAlpha.png"
        }
        ListElement {
            name: "F"
            icon: "pics/qtlogoAlpha.png"
        }
        ListElement {
            name: "G"
            icon: "pics/qtlogoAlpha.png"
        }
    }

    Rectangle {
        id: bkgRectangle
        anchors.fill: parent
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
        gradient: bkgGradient

        Gradient {
            id: bkgGradient
            GradientStop { position: 0.0; color: "#0c1215" }
            GradientStop { position: 0.49772 ; color: "#003e5c"}
            GradientStop { position: 1.0; color: "#000f11" }
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
                mipmap: true
                smooth: true
                width: 80; height: 80
                source: icon
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

    PathView{
        id: pathViewObj
        x: 0
        y: 0
        width: mainWindow.width-widthMargins
        height: mainWindow.height-heightMargins

        delegate: testFile.testDelegate
        model: 300
        // delegate: delegateObj
        // model: modelList

        focus: true
        antialiasing: true
        flickDeceleration: 200
        maximumFlickVelocity: 500

        property int controlPointsOffsetX: 0
        property int controlPointsOffsetY: 0
        property int widthMargins: 100
        property int heightMargins: 150

        path:   Path{
                    id: mainPath

                    startX: pathViewObj.x +pathViewObj.width/2;
                    startY: pathViewObj.y +pathViewObj.height;
                    PathAttribute { name: "iconOpacity"; value: 1.0 }
                    PathAttribute { name: "iconScale"; value: 1.0 }
                    PathAttribute { name: "z"; value: 0 }

                    //Left
                    PathQuad
                    {  id: pathPoint1;
                        x: pathViewObj.x;
                        y: pathViewObj.y +pathViewObj.height/2;
                        controlX: x;
                        controlY: y + pathViewObj.height/2;
                    }
                    PathAttribute { name: "iconOpacity"; value: 1 }
                    PathAttribute { name: "iconScale"; value: 0.6 }
                    PathAttribute { name: "z"; value: 0 }

                    //Upper Center
                    PathQuad
                    {  id: pathPoint2;
                        x: pathViewObj.x +pathViewObj.width/2;
                        y: pathViewObj.y;
                        controlX: x - pathViewObj.width/2;
                        controlY: y ;
                    }
                    PathAttribute { name: "iconOpacity"; value: 0.2 }
                    PathAttribute { name: "iconScale"; value: 0.3 }
                    PathAttribute { name: "z"; value: -1 }

                    //Right
                    PathQuad
                    {  id: pathPoint3;
                        x: pathViewObj.x +pathViewObj.width;
                        y: pathViewObj.y +pathViewObj.height/2;
                        controlX: x;
                        controlY: y - pathViewObj.height/2;
                    }
                    PathAttribute { name: "iconOpacity"; value: 1 }
                    PathAttribute { name: "iconScale"; value: 0.6 }
                    PathAttribute { name: "z"; value: 0 }

                    //Lower Center
                    PathQuad
                    {  id: pathPoint4;
                        x: pathViewObj.x +pathViewObj.width/2;
                        y: pathViewObj.y +pathViewObj.height;
                        controlX: x + pathViewObj.width/2;
                        controlY: y;
                    }
        }

        Rectangle {
            id: testRectangle
            x: pathViewObj.x +pathViewObj.width/2
            y: pathViewObj.y +pathViewObj.height/2
            width: 6
            height: 6
        }

        Text {
            id: txt1
            text: "C1"
            color: "white"
            //x: mainPath.startX; y: mainPath.startY
            x: pathPoint1.controlX; y: pathPoint1.controlY
            //x: pathViewObj.pathViewObj.x +pathViewObj.width/2; y: pathViewObj.pathViewObj.y +pathViewObj.height/2;
            font.pointSize: 30
        }

        Text {
            id: txt2
            text: "C2"
            color: "white"
            x: pathPoint2.controlX; y: pathPoint2.controlY
            font.pointSize: 30
        }

        Text {
            id: txt3
            text: "C3"
            color: "white"
            x: pathPoint3.controlX; y: pathPoint3.controlY
            font.pointSize: 30
        }

        Text {
            id: txt4
            text: "C4"
            color: "white"
            x: pathPoint4.controlX; y: pathPoint4.controlY
            font.pointSize: 30
        }

        Rectangle {
            id: testRectangleC1
            x: pathPoint1.controlX;
            y: pathPoint1.controlY
            width: 6
            height: 6
        }

        Rectangle {
            id: testRectangleC2
            x: pathPoint2.controlX;
            y: pathPoint2.controlY
            width: 6
            height: 6
        }

        Rectangle {
            id: testRectangleC3
            x: pathPoint3.controlX;
            y: pathPoint3.controlY
            width: 6
            height: 6
        }

        Rectangle {
            id: testRectangleC4
            x: pathPoint4.controlX;
            y: pathPoint4.controlY
            width: 6
            height: 6
        }
    }
}
