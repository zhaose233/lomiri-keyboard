/*
 * Copyright 2013 Canonical Ltd.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation; version 3.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.4
import keys 1.0

KeyPad {
    anchors.fill: parent

    content: c1
    symbols: "languages/Keyboard_symbols.qml"

    Column {
        id: c1
        anchors.fill: parent
        spacing: 0

        Row {
            anchors.horizontalCenter: parent.horizontalCenter;
            spacing: 0

            CharKey { label: "ქ"; shifted: "ქ"; extended: ["1"]; extendedShifted: ["1"]; leftSide: true; }
            CharKey { label: "წ"; shifted: "ჭ"; extended: ["2"]; extendedShifted: ["2"] }
            CharKey { label: "ე"; shifted: "ე"; extended: ["3"]; extendedShifted: ["3"] }
            CharKey { label: "რ"; shifted: "ღ"; extended: ["4"]; extendedShifted: ["4"] }
            CharKey { label: "ტ"; shifted: "თ"; extended: ["5"]; extendedShifted: ["5"] }
            CharKey { label: "ყ"; shifted: "ყ"; extended: ["6"]; extendedShifted: ["6"] }
            CharKey { label: "უ"; shifted: "უ"; extended: ["7"]; extendedShifted: ["7"] }
            CharKey { label: "ი"; shifted: "ი"; extended: ["8"]; extendedShifted: ["8"] }
            CharKey { label: "ო"; shifted: "ო"; extended: ["9"]; extendedShifted: ["9"] }
            CharKey { label: "პ"; shifted: "პ"; extended: ["0"]; extendedShifted: ["0"]; rightSide: true; }
        }

        Row {
            anchors.horizontalCenter: parent.horizontalCenter;
            spacing: 0

            CharKey { label: "ა"; shifted: "ა"; leftSide: true; }
            CharKey { label: "ს"; shifted: "შ"; extended: ["$"]; extendedShifted: ["$"] }
            CharKey { label: "დ"; shifted: "დ"; }
            CharKey { label: "ფ"; shifted: "ფ"; }
            CharKey { label: "გ"; shifted: "გ"; }
            CharKey { label: "ჰ"; shifted: "ჰ"; }
            CharKey { label: "ჯ"; shifted: "ჟ"; }
            CharKey { label: "კ"; shifted: "კ"; }
            CharKey { label: "ლ"; shifted: "ლ"; extended: ["₾"]; rightSide: true; }
        }

        Row {
            anchors.horizontalCenter: parent.horizontalCenter;
            spacing: 0

            ShiftKey {}
            CharKey { label: "ზ"; shifted: "ძ"; }
            CharKey { label: "ხ"; shifted: "ხ"; }
            CharKey { label: "ც"; shifted: "ჩ"; }
            CharKey { label: "ვ"; shifted: "ვ"; }
            CharKey { label: "ბ"; shifted: "ბ"; }
            CharKey { label: "ნ"; shifted: "ნ"; }
            CharKey { label: "მ"; shifted: "მ"; }
            BackspaceKey {}
        }

        Item {
            anchors.left: parent.left
            anchors.right: parent.right

            height: panel.keyHeight + units.gu(UI.row_margin);

            SymbolShiftKey { id: symShiftKey;                            anchors.left: parent.left; height: parent.height; }
            LanguageKey    { id: languageMenuButton;                     anchors.left: symShiftKey.right; height: parent.height; }
            CharKey        { id: atKey;    label: "@"; shifted: "@";     anchors.left: languageMenuButton.right; height: parent.height; }
            SpaceKey       { id: spaceKey;                               anchors.left: atKey.right; anchors.right: urlKey.left; noMagnifier: true; height: parent.height; }
            UrlKey         { id: urlKey; label: ".com"; extended: [".com.ge", ".net.ge", ".org.ge", ".edu.ge", ".gov.ge", ".ge"]; anchors.right: dotKey.left; height: parent.height; }
            CharKey        { id: dotKey;      label: "."; shifted: "."; extended: ["?", "-", "_", "!", "+", "%","#","/"]; extendedShifted: ["?", "-", "_", "!", "+", "%","#","/"]; anchors.right: enterKey.left; height: parent.height; }
            ReturnKey      { id: enterKey;                               anchors.right: parent.right; height: parent.height; }
        }
    } // column
}
