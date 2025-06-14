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
import "keys"
import "keys/key_constants.js" as UI

KeyPad {
    anchors.fill: parent

    content: c1

    Column {
        id: c1
        anchors.fill: parent
        anchors.margins: 0;

        spacing: 0

        Row {
            anchors.horizontalCenter: parent.horizontalCenter;
            anchors.margins: 50;
            spacing: 0

            CharKey { label: "১"; extended: ["1"]; shifted: "€";  }
            CharKey { label: "২"; extended: ["2"]; shifted: "£"; }
            CharKey { label: "৩"; extended: ["3"]; shifted: "$"; }
            CharKey { label: "৪"; extended: ["4"]; shifted: "¥"; }
            CharKey { label: "৫"; extended: ["5"]; shifted: "₹"; }
            CharKey { label: "৬"; extended: ["6"]; shifted: "%"; }
            CharKey { label: "৭"; extended: ["7"]; shifted: "<"; }
            CharKey { label: "৮"; extended: ["8"]; shifted: ">"; }
            CharKey { label: "৯"; extended: ["9"]; shifted: "["; }
            CharKey { label: "০"; extended: ["0"]; shifted: "]"; }
        }

        Row {
            anchors.horizontalCenter: parent.horizontalCenter;
            anchors.margins: 50;
            spacing: 0

            CharKey { label: "*"; shifted: "`"; leftSide: true; }
            CharKey { label: "#"; shifted: "^"; }
            CharKey { label: "+"; shifted: "|"; }
            CharKey { label: "-"; shifted: "_"; extended: ["—", "–", "•"]; }
            CharKey { label: "="; shifted: "§"; }
            CharKey { label: "("; shifted: "{"; }
            CharKey { label: ")"; shifted: "}"; }
            CharKey { label: "!"; shifted: "¡"; }
            CharKey { label: "?"; shifted: "¿"; rightSide: true; }
        }

        Row {
            anchors.horizontalCenter: parent.horizontalCenter;
            anchors.margins: 50;
            spacing: 0

            OneTwoKey { label: "1/2"; shifted: "2/2"; fontSize: units.gu(UI.fontSize); }
            CharKey { label: "@"; shifted: "«"; }
            CharKey { label: "~"; shifted: "»"; }
            CharKey { label: "/"; shifted: "\""; }
            CharKey { label: "\\"; shifted: "“"; }
            CharKey { label: "'"; shifted: "”"; extended: ["°"]; switchBackFromSymbols: true; }
            CharKey { label: ";"; shifted: "„"; }
            CharKey { label: ":"; shifted: "&"; }
            BackspaceKey {}
        }

        Item {
            anchors.left: parent.left
            anchors.right: parent.right

            height: panel.keyHeight + units.gu(UI.row_margin);

            SymbolShiftKey { id: symShiftKey; label: "ABC"; shifted: "ABC";  anchors.left: parent.left; height: parent.height; }
            CharKey        { id: commaKey;    label: ","; shifted: "/";     anchors.left: symShiftKey.right; height: parent.height; }
            SpaceKey       { id: spaceKey;                                  anchors.left: commaKey.right; anchors.right: dotKey.left; noMagnifier: true; height: parent.height }
            CharKey        { id: dotKey;      label: "."; shifted: ".";     anchors.right: enterKey.left; height: parent.height; }
            ReturnKey      { id: enterKey;                                  anchors.right: parent.right; height: parent.height; }
        }
    } // column
}
