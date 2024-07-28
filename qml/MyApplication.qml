import QtQuick 2.0
import Sailfish.Silica 1.0

ApplicationWindow {
    id: applicationWindow
    objectName: "applicationWindow"

    property string currentPageName: qsTr("Main")

    initialPage: Qt.resolvedUrl("pages/RegisterPage.qml")
    cover: Qt.resolvedUrl("cover/DefaultCoverPage.qml")
    allowedOrientations: defaultAllowedOrientations

    Connections {
        target: pageStack
        onDepthChanged: {
            if (pageStack.depth == 1) applicationWindow.currentPageName = qsTr("Main")
        }
    }
}
