import QtQuick

Item {
    property Component testDelegate: delegateTest

    Component {
        id: delegateTest
        Rectangle{
            width: 2
            height: 2
        }
    }
}
