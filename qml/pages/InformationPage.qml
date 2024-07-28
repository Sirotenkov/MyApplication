import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.Layouts 1.1

Page {
    id: loginPage
    objectName: "InformationPage"

    PageHeader {
        id: pageHeader
        title: qsTr("Информация")
        description: qsTr("Плодробная информация о пользователе")
    }

    property string currentPageName: qsTr("Information")

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

            Item {
                width: parent.width
                implicitHeight: label1.contentHeight

                Label {
                    id: label1
                    width: parent.width // - 2.0 * Theme.horizontalPageMargin
                    padding: Theme.paddingMedium
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: qsTr("Заполните, пожалуйста, более подробные сведения о себе на данной странице")
                    horizontalAlignment: Qt.AlignHCenter
                    verticalAlignment: Qt.AlignVCenter
                    font.pixelSize: Theme.fontSizeLarge
                    font.letterSpacing: -1
                    wrapMode: Label.WordWrap
                    highlighted: true
                }
            }

            TextField {
                id: userName
                width: parent.width
                placeholderText: qsTr("Ваше имя")
                placeholderColor: Theme.secondaryHighlightColor
                label: qsTr("Имя пользователя")
                color: Theme.secondaryColor
                inputMethodHints: Qt.ImhNoAutoUppercase
                maximumLength: 30
                validator: RegExpValidator { regExp: /^[A-zА-яЁё]{2,32}$/ }
                EnterKey.enabled: !errorHighlight
                EnterKey.iconSource: "image://theme/icon-m-enter-next"
                EnterKey.onClicked: console.log(text)
            }

            TextField {
                id: userLastName
                width: parent.width
                placeholderText: qsTr("Ваша фамилия")
                placeholderColor: Theme.secondaryHighlightColor
                label: qsTr("Фамилия пользователя")
                color: Theme.secondaryColor
                inputMethodHints: Qt.ImhNoAutoUppercase
                maximumLength: 30
                validator: RegExpValidator { regExp: /^[A-zА-яЁё]{2,32}$/ }
                EnterKey.enabled: !errorHighlight
                EnterKey.iconSource: "image://theme/icon-m-enter-next"
                EnterKey.onClicked: console.log(text)
            }

            Label {
                id: label3
                width: parent.width
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("Вы являетесь гражданином РФ?")
                horizontalAlignment: Qt.AlignHCenter
                font.pixelSize: Theme.fontSizeLarge
                font.letterSpacing: -1
                color: Theme.secondaryColor
                font.italic: true
            }

            TextSwitch {
                width: parent.width
                text: checked ? qsTr("Да") : qsTr("Нет")
                description: qsTr("Наличие гражданства РФ")
            }

            Label {
                id: label4
                width: parent.width
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("Введите адрес электронной почты")
                horizontalAlignment: Qt.AlignHCenter
                font.pixelSize: Theme.fontSizeLarge
                font.letterSpacing: -1
                color: Theme.secondaryColor
                font.italic: true
            }

            TextField {
                id: email
                width: parent.width
                placeholderText: qsTr("username@yandex.ru")
                label: qsTr("E-mail")
                leftItem: Icon { source: "image://theme/icon-m-mail" }
                inputMethodHints: Qt.ImhFormattedNumbersOnly
                validator: RegExpValidator { regExp: /^[A-z0-9@A-z.A-z]{6,32}$/ }
                EnterKey.enabled: !errorHighlight
                EnterKey.iconSource: "image://theme/icon-m-enter-next"
                EnterKey.onClicked: console.log(text)
            }

            Label {
                id: label5
                width: parent.width
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("Введите номер мобильного телефона")
                horizontalAlignment: Qt.AlignHCenter
                font.pixelSize: Theme.fontSizeLarge
                font.letterSpacing: -1
                color: Theme.secondaryColor
            }

            TextField {
                id: telephoneNumber
                width: parent.width
                placeholderText: qsTr("Номер телефона")
                placeholderColor: Theme.primaryColor
                backgroundStyle: TextEditor.FilledBackground
                label: qsTr("Mobile phone number")
                inputMethodHints: Qt.ImhDialableCharactersOnly
                validator: RegExpValidator { regExp: /^[0-9\+\-#\*\ ]{3,11}$/ }
                EnterKey.enabled: !errorHighlight
                EnterKey.iconSource: "image://theme/icon-m-enter-next"
                EnterKey.onClicked: console.log(text)
            }

            Label {
                id: label6
                width: parent.width
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("Введите что-нибудь ещё")
                horizontalAlignment: Qt.AlignHCenter
                font.pixelSize: Theme.fontSizeLarge
                font.letterSpacing: -1
                color: Theme.secondaryColor
                font.italic: true
            }

            TextArea {
                id: textArea
                width: parent.width
                label: qsTr("Информация в произвольном виде")
                font.letterSpacing: -1
                placeholderText: qsTr("Любая информация...")
                description: qsTr("Дополнительная информация")
                placeholderColor: Theme.secondaryColor
                wrapMode: TextEdit.Wrap
                highlighted: true
            }
        }
    }

    Column {
        id: footer
        width: parent.width
        height: childrenRect.height + 2.0 * Theme.paddingLarge
        anchors.bottom: parent.bottom
        spacing: Theme.paddingLarge

        Button {
            id: buttonReg
            anchors.horizontalCenter: parent.horizontalCenter
            preferredWidth: Theme.buttonWidthLarge
            height: Theme.itemSizeMedium
            text: qsTr("Отправить сведения")
            color: Theme.secondaryColor
            backgroundColor: Theme.highlightBackgroundColor
            onPressed: Qt.darker(color, 1.2)
            onReleased: Qt.lighter(color, 1.2)
            onClicked: console.log("Information save to server")
        }

        Button {
            id: buttonBack
            anchors.horizontalCenter: parent.horizontalCenter
            preferredWidth: Theme.buttonWidthLarge
            height: Theme.itemSizeMedium
            text: qsTr("Предыдущая страница")
            color: Theme.secondaryColor
            backgroundColor: Theme.highlightBackgroundColor
            onPressed: Qt.darker(color, 1.2)
            onReleased: Qt.lighter(color, 1.2)
            onClicked: pageStack.pop()
        }

    }
}
