import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Window {
    visible: true
    minimumWidth: 720
    width: 720
    minimumHeight: 480
    height: 480
    title: qsTr("SIM_USB_SERVICE")

    Component {
        id: subscribersListDelegate
        Item {
            id: wrapper
            width: 150; height: 140
            Rectangle {
                id: wrapperRect
                anchors.fill: parent
                color: "grey"
                opacity: 0.2
                scale: 0.8
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        wrapper.GridView.view.currentIndex = index
                    }
                }

            }
            Column {
                Text {
                    font.weight: Font.Bold
                    text: 'Квартира: ' + flatNumber
                }
                spacing: 2
                Row {
                    Text {
                        font.weight: Font.DemiBold
                        text: "Подключена?"
                    }
                    spacing: 5
                    CheckBox {
                        id: checkIsEnabled
                        enabled: false
                        checked: isEnabled
                        onCheckedChanged: {
                            isEnabled = checked
                        }
                    }
                }
                TextField {
                    id: number1;
                    enabled: false;
                    text: telNumber1
                    validator: DoubleValidator { }
                    inputMethodHints: Qt.ImhDialableCharactersOnly
                    maximumLength: 20
                    style: TextFieldStyle {
                        renderType: Text.QtRendering
                        background: Rectangle {
                            radius: 2
                            border.color: "#2A5A88"
                            border.width: 3
                        }
                    }
                    onTextChanged: {
                        telNumber1 = text
                    }
                }
                TextField {
                    id: number2;
                    enabled: false;
                    text: telNumber2
                    validator: DoubleValidator { }
                    inputMethodHints: Qt.ImhDialableCharactersOnly
                    maximumLength: 20
                    style: TextFieldStyle {
                        renderType: Text.QtRendering
                    }
                    onTextChanged: {
                        telNumber2 = text
                    }
                }
                TextField {
                    id: number3;
                    enabled: false;
                    text: telNumber3
                    validator: DoubleValidator { }
                    inputMethodHints: Qt.ImhDialableCharactersOnly
                    maximumLength: 20
                    style: TextFieldStyle {
                        renderType: Text.QtRendering
                    }
                    onTextChanged: {
                        telNumber3 = text
                    }
                }
                TextField {
                    id: number4;
                    enabled: false;
                    text: telNumber4
                    validator: DoubleValidator { }
                    inputMethodHints: Qt.ImhDialableCharactersOnly
                    maximumLength: 20
                    style: TextFieldStyle {
                        renderType: Text.QtRendering
                    }
                    onTextChanged: {
                        telNumber4 = text
                    }
                }
                TextField {
                    id: number5;
                    enabled: false;
                    text: telNumber5
                    validator: DoubleValidator { }
                    inputMethodHints: Qt.ImhDialableCharactersOnly
                    maximumLength: 20
                    style: TextFieldStyle {
                        renderType: Text.QtRendering
                    }
                    onTextChanged: {
                        telNumber5 = text
                    }
                }
            }

            states: [
                State {
                    name: "checkedNcurrentItem"
                    when: ((checkIsEnabled.checked == true) & (wrapper.GridView.isCurrentItem))
                    PropertyChanges { target: scaleTransform; scale: 1.3; }
                    PropertyChanges { target: wrapperRect; color: "green"; }
                    PropertyChanges { target: checkIsEnabled; enabled: true; }
                    PropertyChanges { target: number1; enabled: true; }
                    PropertyChanges { target: number2; enabled: true; }
                    PropertyChanges { target: number3; enabled: true; }
                    PropertyChanges { target: number4; enabled: true; }
                    PropertyChanges { target: number5; enabled: true; }
                },
                State {
                    name: "currentItem"
                    when: wrapper.GridView.isCurrentItem
                    PropertyChanges { target: scaleTransform; scale: 1.3; }
                    PropertyChanges { target: checkIsEnabled; enabled: true; }
                },
                State {
                    name: "checked"
                    when: checkIsEnabled.checked == true
                    PropertyChanges { target: wrapperRect; color: "green"; }
                }
            ]
            transform: Scale {
                id: scaleTransform
                property real scale: 1
                xScale: scale
                yScale: scale
            }
            transitions: Transition {
                NumberAnimation { properties: "scale"; duration: 300 }
            }
        }
    }
    property var progressbarState: false

    signal onRemSubClicked()
    signal onAddSubClicked()
    signal onClearTableClicked()
    signal onAddSubsClicked()
    signal onCreateButtonClicked()
    MainForm {
        rem1subButton.onClicked: {
            onRemSubClicked()
        }

        add1subButton.onClicked: {
            onAddSubClicked()
        }

        clearButton.onClicked: {
            onClearTableClicked()
        }

        progressBar.indeterminate: progressbarState

        addsubsButton.onClicked: {
            onAddSubsClicked()
        }
        createButton.onClicked: {
            onCreateButtonClicked()
        }
        anchors.fill: parent
    }

    function change_progressbar_state(state)
    {
        if (state === true)
        {
            progressbarState = true
        } else
        {
            progressbarState = false
        }
    }
}