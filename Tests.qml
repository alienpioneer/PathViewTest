import QtQuick 2.12

Item {
    property Component testDelegate: delegateTest
    property Text txtC1: txt1
    property Text txtC2: txt2
    property Text txtC3: txt3
    property Text txtC4: txt4


    Component {
        id: delegateTest
        Rectangle{
            width: 2
            height: 2
        }
    }


}
