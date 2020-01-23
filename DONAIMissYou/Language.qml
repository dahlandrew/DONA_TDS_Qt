import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Shapes 1.12
import QtCharts 2.3

LanguageForm {

    Connections {
        target: handler
        onSetLanguage:{

        }
    }

    englishBtn.onClicked: {
        englishCheck.visible = true;
        frenchCheck.visible = false;
        spanCheck.visible = false;
        germCheck.visible = false;
        portCheck.visible = false;
        handler.languageCheck(english.text);
    }

    frenchBtn.onClicked: {
        englishCheck.visible = false;
        frenchCheck.visible = true;
        spanCheck.visible = false;
        germCheck.visible = false;
        portCheck.visible = false;
        handler.languageCheck(french.text);
    }

    spanBtn.onClicked: {
        englishCheck.visible = false;
        frenchCheck.visible = false;
        spanCheck.visible = true;
        germCheck.visible = false;
        portCheck.visible = false;
        handler.languageCheck(span.text);
    }

    germBtn.onClicked: {
        englishCheck.visible = false;
        frenchCheck.visible = false;
        spanCheck.visible = false;
        germCheck.visible = true;
        portCheck.visible = false;
        handler.languageCheck(germ.text);
    }

    portBtn.onClicked: {
        englishCheck.visible = false;
        frenchCheck.visible = false;
        spanCheck.visible = false;
        germCheck.visible = false;
        portCheck.visible = true;
        handler.languageCheck(port.text);
    }

}
