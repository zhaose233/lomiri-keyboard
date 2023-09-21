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
    georgianplugin.h

TARGET          = $$qtLibraryTarget(kaplugin)

EXAMPLE_FILES = georgianplugin.json

# generate database for presage:
PLUGIN_INSTALL_PATH = $${LOMIRI_KEYBOARD_PLUGIN_DIR}/ka/

database_ka_install.commands += \
  rm -f $$PWD/database_ka.db && \
  text2ngram -n 1 -l -f sqlite -o $$PWD/database_ka.db $$PWD/*.txt && \
  text2ngram -n 2 -l -f sqlite -o $$PWD/database_ka.db $$PWD/*.txt && \
  text2ngram -n 3 -l -f sqlite -o $$PWD/database_ka.db $$PWD/*.txt

database_ka_install.files = $${PWD}/database_ka.db
database_ka_install.path = $${PLUGIN_INSTALL_PATH}

target.path = $${PLUGIN_INSTALL_PATH}

INSTALLS += \
          target \
          database_ka_install

OTHER_FILES += \
    georgianplugin.json \

LIBS += $${TOP_BUILDDIR}/plugins/plugins/libwesternsupport.a -lpresage -lhunspell

INCLUDEPATH += $$PWD/../../westernsupport
DEPENDPATH += $$PWD/../../westernsupport
