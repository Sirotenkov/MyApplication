import QtQuick 2.0
import Sailfish.Silica 1.0

ApplicationWindow {
    id: applicationWindow
    objectName: "applicationWindow"

    initialPage: Qt.resolvedUrl("pages/RegisterPage.qml")
    cover: Qt.resolvedUrl("cover/DefaultCoverPage.qml")
    allowedOrientations: defaultAllowedOrientations
}
