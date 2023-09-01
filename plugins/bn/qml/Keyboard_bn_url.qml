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

import QtQml 2.4
import QtQuick 2.4
import keys 1.0
import "keys"

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

            CharKey { label: "ঙ"; extended: ["ং"]; shifted: "ং"; }
            CharKey { label: "য"; extended: ["য়"]; shifted: "য"; }
            CharKey { label: "ড"; extended: ["ঢ"]; shifted: "ঢ"; }
            CharKey { label: "প"; extended: ["ফ"]; shifted: "ফ"; }
            CharKey { label: "ট"; extended: ["ঠ"]; shifted: "ঠ"; }
            CharKey { label: "চ"; extended: ["ছ"]; shifted: "ছ"; }
            CharKey { label: "জ"; extended: ["ঝ"]; shifted: "ঝ"; }
            CharKey { label: "হ"; extended: ["ঞ"]; shifted: "ঞ"; }
            CharKey { label: "গ"; extended: ["ঘ"]; shifted: "ঘ"; }
            CharKey { label: "ড়"; extended: ["ঢ়"]; shifted: "ঢ়"; }
        }

        Row {
            anchors.horizontalCenter: parent.horizontalCenter;
            spacing: 0

            CharKey { label: "ৃ"; extended: ["ঐ"]; shifted: "ঋ"; }
            CharKey { label: "ু"; extended: ["ঊ"]; shifted: "ূ"; extendedShifted: ["ঊ"] }
            CharKey { label: "ি"; extended: ["ই"]; shifted: "ী"; extendedShifted: ["ঈ"] }
            CharKey { label: "ব"; extended: ["ভ"]; shifted: "ভ"; }
            CharKey { label: "‍্"; shifted: "র্"; }
            CharKey { label: "া"; extended: ["আ"]; shifted: "অ"; }
            CharKey { label: "ক"; extended: ["খ"]; shifted: "খ"; }
            CharKey { label: "ত"; extended: ["ৎ"]; shifted: "থ"; }
            CharKey { label: "দ"; extended: ["ধ"]; shifted: "ধ"; }
        }

        Row {
            anchors.horizontalCenter: parent.horizontalCenter;
            spacing: 0

            ShiftKey {}
            CharKey { label: "ঁ"; extended: ["ঃ"]; shifted: "ঃ"; }
            CharKey { label: "ো"; extended: ["ও"]; shifted: "ৌ"; extendedShifted: ["ঔ"] ; }
            CharKey { label: "ে"; extended: ["এ"]; shifted: "ৈ"; extendedShifted: ["ঐ"];  }
            CharKey { label: "র"; extended: ["ল"]; shifted: " ্র"; }
            CharKey { label: "ন"; extended: ["ণ"]; shifted: "ণ"; }
            CharKey { label: "স"; extended: ["ষ"]; shifted: "ষ"; }
            CharKey { label: "ম"; extended: ["শ"]; shifted: "শ"; }
            BackspaceKey {}
        }
        Item {
            anchors.left: parent.left
            anchors.right: parent.right

            height: panel.keyHeight + units.gu(UI.row_margin);

            SymbolShiftKey { id: symShiftKey;                            anchors.left: parent.left; height: parent.height; }
            LanguageKey    { id: languageMenuButton;                     anchors.left: symShiftKey.right; height: parent.height; }
            CharKey        { id: slashKey; label: "/"; shifted: "/";     anchors.left: languageMenuButton.right; height: parent.height; }
            UrlKey         { id: urlKey; label: ".com"; extended: [".com.bd", ".net", ".org", ".edu", ".gov", ".ac.bd", ".bd"]; anchors.right: dotKey.left; height: parent.height; }
            CharKey        { id: dotKey;      label: "."; shifted: "।"; extended: ["?", "-", "_", "!", "+", "%","#","/"]; extendedShifted: ["?", "-", "_", "!", "+", "%","#","/"]; anchors.right: enterKey.left; height: parent.height; }
            ReturnKey      { id: enterKey;                               anchors.right: parent.right; height: parent.height; }
        }
    } // column
}
