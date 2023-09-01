TOP_BUILDDIR = $$OUT_PWD/../../..
TOP_SRCDIR = $$PWD/../../..

include($${TOP_SRCDIR}/config.pri)

TEMPLATE        = lib
CONFIG         += plugin
QT             += widgets
INCLUDEPATH    += \
    $${TOP_SRCDIR}/src/ \
    $${TOP_SRCDIR}/src/lib/ \
    $${TOP_SRCDIR}/src/lib/logic/
    $${TOP_SRCDIR}/plugins/westernsupport

HEADERS         = \
    bengaliplugin.h

TARGET          = $$qtLibraryTarget(bn-probhatplugin)

PLUGIN_INSTALL_PATH = $${LOMIRI_KEYBOARD_PLUGIN_DIR}/bn-probhat/

# install database for presage:
lang_bn_db_install.commands += \
  rm -f $$PWD/database_bn_probhat.db && \
  text2ngram -n 1 -l -f sqlite -o $$PWD/database_bn_probhat.db $$PWD/free_ebooks/*.txt && \
  text2ngram -n 2 -l -f sqlite -o $$PWD/database_bn_probhat.db $$PWD/free_ebooks/*.txt && \
  text2ngram -n 3 -l -f sqlite -o $$PWD/database_bn_probhat.db $$PWD/free_ebooks/*.txt

lang_bn_db_install.path = $$PLUGIN_INSTALL_PATH
lang_bn_db_install.files = $$PWD/database_bn_probhat.db

target.path = $$PLUGIN_INSTALL_PATH
INSTALLS += \
	target \
	lang_bn_db_install

EXAMPLE_FILES = bengaliplugin.json

OTHER_FILES += \
    	bengaliplugin.json

LIBS += $${TOP_BUILDDIR}/plugins/plugins/libwesternsupport.a -lpresage -lhunspell

INCLUDEPATH += $$PWD/../../westernsupport
DEPENDPATH += $$PWD/../../westernsupport
