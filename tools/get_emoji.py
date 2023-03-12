#!/usr/bin/env python3
from urllib.request import urlopen
from os import path
import sys
import json
import re

# use this to add more specific groupings in case a variant list
# exceeds 5 options (you will get an error in the script output)
# look at https://unicode.org/Public/emoji/latest/emoji-test.txt and figure out
# how to split it
OVERRIDE_GROUPS = {
    "handshake": [
        "^handshake: light skin tone",
        "^handshake: medium-light skin tone",
        "^handshake: medium skin tone",
        "^handshake: medium-dark skin tone",
        "^handshake: dark skin tone",
    ],
    "person": [
        "^person:.*?blond hair$",
        "^person:.*?beard$",
        "^person:.*?red hair$",
        "^person:.*?curly hair$",
        "^person:.*?white hair$",
        "^person:.*?bald$",
    ],
    "man": [
        "^man:.*?blond hair$",
        "^man:.*?beard$",
        "^man:.*?red hair$",
        "^man:.*?curly hair$",
        "^man:.*?white hair$",
        "^man:.*?bald$",
    ],
    "woman": [
        "^woman:.*?blond hair$",
        "^woman:.*?beard$",
        "^woman:.*?red hair$",
        "^woman:.*?curly hair$",
        "^woman:.*?white hair$",
        "^woman:.*?bald$",
    ],
    "people holding hands": [
        "^people holding hands: light skin tone",
        "^people holding hands: medium-light skin tone",
        "^people holding hands: medium skin tone",
        "^people holding hands: medium-dark skin tone",
        "^people holding hands: dark skin tone",
    ],
    "women holding hands": [
        "^women holding hands: light skin tone",
        "^women holding hands: medium-light skin tone",
        "^women holding hands: medium skin tone",
        "^women holding hands: medium-dark skin tone",
        "^women holding hands: dark skin tone",
    ],
    "men holding hands": [
        "^men holding hands: light skin tone",
        "^men holding hands: medium-light skin tone",
        "^men holding hands: medium skin tone",
        "^men holding hands: medium-dark skin tone",
        "^men holding hands: dark skin tone",
    ],
    "woman and man holding hands": [
        "^woman and man holding hands: light skin tone",
        "^woman and man holding hands: medium-light skin tone",
        "^woman and man holding hands: medium skin tone",
        "^woman and man holding hands: medium-dark skin tone",
        "^woman and man holding hands: dark skin tone",
    ],
    "kiss": [
        "^kiss: person, person, light skin tone",
        "^kiss: person, person, medium-light skin tone",
        "^kiss: person, person, medium skin tone",
        "^kiss: person, person, medium-dark skin tone",
        "^kiss: person, person, dark skin tone",
        "^kiss: woman, man, light skin tone",
        "^kiss: woman, man, medium-light skin tone",
        "^kiss: woman, man, medium skin tone",
        "^kiss: woman, man, medium-dark skin tone",
        "^kiss: woman, man, dark skin tone",
        "^kiss: man, man, light skin tone",
        "^kiss: man, man, medium-light skin tone",
        "^kiss: man, man, medium skin tone",
        "^kiss: man, man, medium-dark skin tone",
        "^kiss: man, man, dark skin tone",
        "^kiss: woman, woman, light skin tone",
        "^kiss: woman, woman, medium-light skin tone",
        "^kiss: woman, woman, medium skin tone",
        "^kiss: woman, woman, medium-dark skin tone",
        "^kiss: woman, woman, dark skin tone",
        "^kiss:.*? skin tone$",
    ],
    "couple with heart": [
        "^couple with heart: person, person, light skin tone",
        "^couple with heart: person, person, medium-light skin tone",
        "^couple with heart: person, person, medium skin tone",
        "^couple with heart: person, person, medium-dark skin tone",
        "^couple with heart: person, person, dark skin tone",
        "^couple with heart: woman, man, light skin tone",
        "^couple with heart: woman, man, medium-light skin tone",
        "^couple with heart: woman, man, medium skin tone",
        "^couple with heart: woman, man, medium-dark skin tone",
        "^couple with heart: woman, man, dark skin tone",
        "^couple with heart: man, man, light skin tone",
        "^couple with heart: man, man, medium-light skin tone",
        "^couple with heart: man, man, medium skin tone",
        "^couple with heart: man, man, medium-dark skin tone",
        "^couple with heart: man, man, dark skin tone",
        "^couple with heart: woman, woman, light skin tone",
        "^couple with heart: woman, woman, medium-light skin tone",
        "^couple with heart: woman, woman, medium skin tone",
        "^couple with heart: woman, woman, medium-dark skin tone",
        "^couple with heart: woman, woman, dark skin tone",
        "^couple with heart:.*? skin tone$",
    ],
    "family": [
        "^family: man, woman,( girl,?| boy,?)+$",
        "^family: man, man,( girl,?| boy,?)+$",
        "^family: woman, woman,( girl,?| boy,?)+$",
        "^family: man,( girl,?| boy,?)+$",
        "^family: woman,( girl,?| boy,?)+$",
    ],
}
DATA_PATH = path.realpath(
    path.join(
        path.dirname(__file__), "../plugins/emoji/qml/emoji.js"
    )
)
NO_VARIANTS = ["flag", "keycap"]
SKIP_GROUPS = ["Component"]
# TODO: the keyboard can't handle all the groups
# these groups will be joined with the previous one
JOIN_GROUPS = [
    "People & Body"
]
FILE_HEADER = """/**
 * SPDX-License-Identifier: Unicode-DFS-2016
 *
 * DO NOT EDIT
 * This file was generated by `tools/get_emoji.py`.
 * Please run that script instead of editing this file!
**/

"""

if len(sys.argv) < 2:
    print("Usage: get_emoji.py emoji_version")
    exit(1)

requested_version = float(sys.argv[1])

response = urlopen("https://unicode.org/Public/emoji/latest/emoji-test.txt")
lines = response.read().decode('utf-8').split('\n')

emoji = []
groups = []
variants = {}
group = None
for line in lines:
    if line.startswith("# group:"):
        group_name = line.split(": ")[1]
        if group_name in JOIN_GROUPS:
            continue
        if group is not None:
            group["count"] = len(emoji) - group["start"]
        group = {"name": group_name, "start": len(emoji)}
        if group_name not in SKIP_GROUPS:
            groups.append(group)

    if line.startswith("#") or line == "":
        continue
    if "minimally-qualified" in line or "unqualified" in line:
        continue
    if group["name"] in SKIP_GROUPS:
        continue

    [codes, rest] = line.split(";")
    characters = "".join([chr(int(c, 16)) for c in codes.strip().split()])
    [version, name] = rest.split("E")[1].split(" ", 1)
    if requested_version < float(version):
        continue

    obj = {"name": name, "characters": characters}

    if ":" in name:
        [root, variant] = name.split(":")
        if root in OVERRIDE_GROUPS:
            root = next((
                re.compile(n) for n in OVERRIDE_GROUPS[root]
                if re.match(n, name)
            ), root)

        if isinstance(root, re.Pattern):
            root_emoji = next(
                (e for e in emoji if root.match(e["name"])), None)
        else:
            root_emoji = next((e for e in emoji if e["name"] == root), None)

        if root_emoji is None:
            emoji.append(obj)
            continue

        if root not in NO_VARIANTS:
            key = root_emoji["characters"]
            if key not in variants:
                variants[key] = []

            variants[key].append(characters)
            continue

    emoji.append(obj)

group["count"] = len(emoji) - group["start"]

# check if any variant list contains more than 5 variants and error out
# the extended keys list can't handle that
fail = False
for item in emoji:
    if item["characters"] not in variants:
        continue
    length = len(variants[item["characters"]])
    if length > 5:
        print("variants list for \"%s\" contains too many options (%s)" % (
            item["name"],
            ",".join(variants[item["characters"]]),
        ))
        print("  add more specific groupings in OVERRIDE_GROUPS[\"%s\"]" % (
            item["name"],
        ))
        fail = True
    if length == 1:
        # single-option variants would be confusing
        del variants[item["characters"]]

if fail:
    exit(1)

with open(DATA_PATH, "w") as f:
    f.write(FILE_HEADER)
    f.write("const emoji = %s;\n" % json.dumps(
        [e["characters"] for e in emoji], ensure_ascii=False))
    f.write("const variants = %s;\n" %
            json.dumps(variants, ensure_ascii=False))
    f.write("const groups = %s;\n" % json.dumps(groups))
