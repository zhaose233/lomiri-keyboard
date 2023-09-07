TOP_BUILDDIR = $$OUT_PWD/../../..
TOP_SRCDIR = $$PWD/../../..

include($${TOP_SRCDIR}/config.pri)

TEMPLATE        = lib
CONFIG         += plugin
QT             += widgets core
INCLUDEPATH    += \
    $${TOP_SRCDIR}/src/ \
    $${TOP_SRCDIR}/src/lib/logic \
    $${PWD}/libengine

HEADERS         = \
                  avrophonetic.h \
                  AvroPhonetic \
                  avroplugin.h \
                  avrolanguagefeatures.h \
                  $${TOP_SRCDIR}/src/lib/logic/abstractlanguageplugin.h \
                  libengine/AutoCorrect.h \
                  libengine/BengaliChars.h \
                  libengine/Database.h \
                  libengine/FileSystem.h \
                  libengine/Log.h \
                  libengine/PhoneticSuggestion.h \
                  libengine/phoneticparser.h \
                  libengine/qlevenshtein.hpp \
                  libengine/regexparser.h

SOURCES         = \
                  avrophonetic.cpp \
                  avroplugin.cpp \
                  avrolanguagefeatures.cpp \
                  $${TOP_SRCDIR}/src/lib/logic/abstractlanguageplugin.cpp \
                  libengine/AutoCorrect.cpp \
                  libengine/Database.cpp \
                  libengine/FileSystem.cpp \
                  libengine/PhoneticSuggestion.cpp \
                  libengine/phoneticparser.cpp \
                  libengine/regexparser.cpp

TARGET          = $$qtLibraryTarget(bn-avroplugin)

EXAMPLE_FILES = avroplugin.json

# target path
PLUGIN_INSTALL_PATH = $${LOMIRI_KEYBOARD_PLUGIN_DIR}/bn-avro/

target.path = $$PLUGIN_INSTALL_PATH

avro_data_files.path = $$PLUGIN_INSTALL_PATH/data/
avro_data_files.files = data/*.json

# targets install
INSTALLS += target \
	    avro_data_files

OTHER_FILES += \
    	avroplugin.json

CONFIG += link_pkgconfig
PKGCONFIG += glib-2.0

DISTFILES += \
    	data/autocorrect.json \
    	data/avrophonetic.json \
    	data/dictionary.json \
    	data/regex.json \
    	data/suffix.json
