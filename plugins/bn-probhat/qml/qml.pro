TOP_BUILDDIR = $$OUT_PWD/../../..
TOP_SRCDIR = $$PWD/../../..

include($${TOP_SRCDIR}/config.pri)

TARGET = dummy
TEMPLATE = lib

lang_bn-probhat.path = "$$LOMIRI_KEYBOARD_PLUGIN_DIR/bn-probhat/"
lang_bn-probhat.files = *.qml *.js
lang_bn-probhat.extra = ln -s ../bn/keys $(INSTALL_ROOT)/$$LOMIRI_KEYBOARD_PLUGIN_DIR/bn-probhat/

INSTALLS += lang_bn-probhat

# for QtCreator
OTHER_FILES += \
	Keyboard_bn-probhat.qml \
    	Keyboard_bn-probhat_email.qml \
    	Keyboard_bn-probhat_url.qml \
    	Keyboard_bn-probhat_url_search.qml \
    	Keyboard_symbols.qml

