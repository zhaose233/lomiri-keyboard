TOP_BUILDDIR = $$OUT_PWD/../../..
TOP_SRCDIR = $$PWD/../../..

include($${TOP_SRCDIR}/config.pri)

TARGET = dummy
TEMPLATE = lib

lang_bn-probhat.path = "$$LOMIRI_KEYBOARD_PLUGIN_DIR/bn-probhat/"
lang_bn-probhat.files = *.qml *.js

lang_bn-probhat_keys.path = "$$LOMIRI_KEYBOARD_PLUGIN_DIR/bn-probhat/keys"
lang_bn-probhat_keys.files = keys/*.qml keys/*.js

INSTALLS += \
	lang_bn-probhat \
	lang_bn-probhat_keys

# for QtCreator
OTHER_FILES += \
	Keyboard_bn-probhat.qml \
    	Keyboard_bn-probhat_email.qml \
    	Keyboard_bn-probhat_url.qml \
    	Keyboard_bn-probhat_url_search.qml \
    	Keyboard_symbols.qml

