/*
 * Copyright 2013 Canonical Ltd.
 * Copyright 2021 Abdullah AL Shohag
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
    symbols: Qt.resolvedUrl("Keyboard_symbols_bn.qml")

    Column {
        id: c1
        anchors.fill: parent
        spacing: 0

        Row {
            anchors.horizontalCenter: parent.horizontalCenter;
            spacing: 0

            CharKey { label: "q"; shifted: "Q"; extended: ["১","1"]; extendedShifted: ["১","1"]; leftSide: true; }
            CharKey { label: "w"; shifted: "W"; extended: ["২", "2"]; extendedShifted: ["২", "2"] }
            CharKey { label: "e"; shifted: "E"; extended: ["৩", "3"]; extendedShifted: ["৩", "3"] }
            CharKey { label: "r"; shifted: "R"; extended: ["৪", "4"]; extendedShifted: ["৪", "4"] }
            CharKey { label: "t"; shifted: "T"; extended: ["৫", "5"]; extendedShifted: ["৫", "5"] }
            CharKey { label: "y"; shifted: "Y"; extended: ["৬", "6"]; extendedShifted: ["৬", "6"] }
            CharKey { label: "u"; shifted: "U"; extended: ["৭", "7"]; extendedShifted: ["৭", "7"] }
            CharKey { label: "i"; shifted: "I"; extended: ["৮", "8"]; extendedShifted: ["৮", "8"] }
            CharKey { label: "o"; shifted: "O"; extended: ["৯", "9"]; extendedShifted: ["৯", "9"] }
            CharKey { label: "p"; shifted: "P"; extended: ["০", "0"]; extendedShifted: ["০", "0"]; rightSide: true; }
        }

        Row {
            anchors.horizontalCenter: parent.horizontalCenter;
            spacing: 0

            CharKey { label: "a"; shifted: "A"; leftSide: true; }
            CharKey { label: "s"; shifted: "S"; }
            CharKey { label: "d"; shifted: "D"; }
            CharKey { label: "f"; shifted: "F"; }
            CharKey { label: "g"; shifted: "G"; }
            CharKey { label: "h"; shifted: "H"; }
            CharKey { label: "j"; shifted: "J"; }
            CharKey { label: "k"; shifted: "K"; }
            CharKey { label: "l"; shifted: "L"; rightSide: true; }
        }

        Row {
            anchors.horizontalCenter: parent.horizontalCenter;
            spacing: 0

            ShiftKey {}
            CharKey { label: "z"; shifted: "Z"; }
            CharKey { label: "x"; shifted: "X"; }
            CharKey { label: "c"; shifted: "C"; }
            CharKey { label: "v"; shifted: "V"; }
            CharKey { label: "b"; shifted: "B"; }
            CharKey { label: "n"; shifted: "N"; }
            CharKey { label: "m"; shifted: "M"; }
            BackspaceKey {}
        }

        Item {
            anchors.left: parent.left
            anchors.right: parent.right

            height: panel.keyHeight + units.gu(UI.row_margin);

            SymbolShiftKey { id: symShiftKey;                            anchors.left: parent.left; height: parent.height; }
            LanguageKey    { id: languageMenuButton;                     anchors.left: symShiftKey.right; height: parent.height; }
            CharKey        { id: slashKey; label: "/"; shifted: "/";     anchors.left: languageMenuButton.right; height: parent.height; }
            UrlKey         { id: urlKey; label: ".com"; extended: [".com.bd", ".net", ".org", ".edu", ".gov.bd", ".ac.bd", ".bd"]; anchors.right: dotKey.left; height: parent.height; }
            CharKey        { id: dotKey;      label: "."; shifted: "."; extended: ["?", "-", "_", "!", "+", "%","#","/"]; extendedShifted: ["?", "-", "_", "!", "+", "%","#","/"]; anchors.right: enterKey.left; height: parent.height; }
            ReturnKey      { id: enterKey;                               anchors.right: parent.right; height: parent.height; }
        }
    } // column
}
