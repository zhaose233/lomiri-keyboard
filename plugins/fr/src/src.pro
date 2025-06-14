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
    frenchplugin.h

TARGET          = $$qtLibraryTarget(frplugin)

EXAMPLE_FILES = frenchplugin.json

# generate database for presage:
PLUGIN_INSTALL_PATH = $${LOMIRI_KEYBOARD_PLUGIN_DIR}/fr/

lang_db_fr.commands += \
  rm -f $$PWD/database_fr.db && \
  text2ngram -n 1 -l -f sqlite -o $$PWD/database_fr.db $$PWD/les_trois_mousquetaires.txt && \
  text2ngram -n 2 -l -f sqlite -o $$PWD/database_fr.db $$PWD/les_trois_mousquetaires.txt && \
  text2ngram -n 3 -l -f sqlite -o $$PWD/database_fr.db $$PWD/les_trois_mousquetaires.txt
lang_db_fr.files += $$PWD/database_fr.db

lang_db_fr_install.files += $$PWD/database_fr.db
lang_db_fr_install.path = $$PLUGIN_INSTALL_PATH

QMAKE_EXTRA_TARGETS += lang_db_fr lang_db_fr_install

overrides.files += $$PWD/overrides.csv
overrides.path += $$PLUGIN_INSTALL_PATH

target.path = $$PLUGIN_INSTALL_PATH
INSTALLS += target lang_db_fr_install overrides


OTHER_FILES += \
    frenchplugin.json \
    les_trois_mousquetaires.txt

CONFIG += link_pkgconfig
PKGCONFIG += hunspell
LIBS += $${TOP_BUILDDIR}/plugins/plugins/libwesternsupport.a -lpresage

INCLUDEPATH += $$PWD/../../westernsupport
DEPENDPATH += $$PWD/../../westernsupport
