import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.Layouts 1.1

Page {
    id: loginPage
    objectName: "RegisterPage"

    PageHeader {
        id: pageHeader
        title: qsTr("Регистрация")
        description: qsTr("Страница регистрации пользователя")
    }

    signal clicked

    allowedOrientations: defaultAllowedOrientations

    SilicaFlickable {
        id: flickableArea
        anchors.top: pageHeader.bottom
        anchors.bottom: footer.top
        width: parent.width
        contentHeight: column.height
        clip: true

        VerticalScrollDecorator {
            flickable: flickableArea
        }

        ColumnLayout {
            id: column
            spacing: Theme.paddingLarge
            width: parent.width - 2.0 * Theme.horizontalPageMargin
            anchors.horizontalCenter: parent.horizontalCenter

            Label {
                id: label1
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("Здравствуйте!")
                font.pixelSize: Theme.fontSizeLarge
                font.family: Theme.fontFamilyHeading
                font.underline: true
                highlighted: true
            }

            Label {
                id: label2
                width: parent.width
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("Введите свои регистрационные данные")
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter
                font.pixelSize: Theme.fontSizeLarge
                font.family: Theme.fontFamilyHeading
                font.letterSpacing: -1
                wrapMode: Label.WordWrap
                color: Theme.secondaryColor
                font.italic: true
            }

            TextField {
                id: userName
                width: parent.width
                placeholderText: qsTr("Логин")
                placeholderColor: Theme.secondaryHighlightColor
                label: qsTr("Login")
                color: Theme.secondaryColor
                inputMethodHints: Qt.ImhNoAutoUppercase
                maximumLength: 30
                validator: RegExpValidator { regExp: /^[\w]{2,32}$/ }
                EnterKey.enabled: !errorHighlight
                EnterKey.iconSource: "image://theme/icon-m-enter-next"
                EnterKey.onClicked: userLastName.focus = true
            }

            PasswordField {
                id: userLastName
                width: parent.width
                placeholderText: qsTr("Пароль")
                placeholderColor: Theme.secondaryHighlightColor
                label: qsTr("Password")
                color: Theme.secondaryColor
                inputMethodHints: Qt.ImhNoAutoUppercase
                maximumLength: 30
                validator: RegExpValidator { regExp: /^[\w]{2,32}$/ }
                EnterKey.enabled: !errorHighlight
                EnterKey.iconSource: "image://theme/icon-m-enter-next"
                EnterKey.onClicked: footer.button.onClicked()
            }
        }
    }

    Item {
        id: footer
        width: parent.width
        height: button.height + 2.0 * Theme.paddingLarge
        anchors.bottom: parent.bottom

        Button {
            id: button
            anchors.centerIn: parent
            preferredWidth: Theme.buttonWidthLarge
            height: Theme.itemSizeMedium
            text: qsTr("Зарегистрироваться")
            color: Theme.secondaryColor
            backgroundColor: Theme.highlightBackgroundColor
            onPressed: Qt.darker(color, 1.2)
            onReleased: Qt.lighter(color, 1.2)
            onClicked: pageStack.push(Qt.resolvedUrl("InformationPage.qml"))
        }
    }
}
