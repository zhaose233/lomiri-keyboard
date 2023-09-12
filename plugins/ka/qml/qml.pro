TOP_BUILDDIR = $$OUT_PWD/../../..
TOP_SRCDIR = $$PWD/../../..

include($${TOP_SRCDIR}/config.pri)

TARGET = dummy
TEMPLATE = lib

lang_ka.path = "$$LOMIRI_KEYBOARD_PLUGIN_DIR/ka/"
lang_ka.files = *.qml *.js

INSTALLS += lang_ka

# for QtCreator
OTHER_FILES += \
    Keyboard_ka.qml \
    Keyboard_ka_email.qml \
    Keyboard_ka_url.qml \
    Keyboard_ka_url_search.qml
