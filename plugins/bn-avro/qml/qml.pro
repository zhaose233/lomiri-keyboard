TOP_BUILDDIR = $$OUT_PWD/../../..
TOP_SRCDIR = $$PWD/../../..

include($${TOP_SRCDIR}/config.pri)

TARGET = dummy
TEMPLATE = lib

lang_bn_avro.path = "$$LOMIRI_KEYBOARD_PLUGIN_DIR/bn-avro/"
lang_bn_avro.files = *.qml

lang_bn_avro_keys.path = "$$LOMIRI_KEYBOARD_PLUGIN_DIR/bn-avro/keys"
lang_bn_avro_keys.files = keys/*.js

INSTALLS += lang_bn_avro\
	    lang_bn_avro_keys

# for QtCreator
OTHER_FILES += \
    Keyboard_bn-avro.qml \
    Keyboard_bn-avro_email.qml \
    Keyboard_bn-avro_url.qml \
    Keyboard_bn-avro_url_search.qml \
    Keyboard_symbols.qml
