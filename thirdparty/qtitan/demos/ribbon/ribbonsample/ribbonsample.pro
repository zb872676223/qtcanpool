TEMPLATE = app

QTITANDIR = $$quote($$(QTITANDIR))

isEmpty(QTITANDIR):QTITANDIR = $$quote($$PWD/../../..)

include($$QTITANDIR/src/shared/qtitanribbon.pri)

#DESTDIR = $$QTITANDIR/bin
DESTDIR = $$IDE_APP_PATH
DESTDIR = $$member(DESTDIR, 0)$$QTITAN_LIB_PREFIX

# auto copy dll to STATIC_OUTPUT_BASE
STATIC_BASE = $$QTITAN_LIB_PATH
STATIC_OUTPUT_BASE = $$DESTDIR
STATIC_INSTALL_BASE = $$INSTALL_DATA_PATH
!isEmpty(QTITAN_DLL_FILE):STATIC_FILES = $$STATIC_BASE/$$member(QTITAN_DLL_FILE)
include($$QTITANDIR/../../data.pri)

!debug_and_release|build_pass {
    CONFIG(debug, debug|release) {
        TARGET = $$member(TARGET, 0)d
    }
}

HEADERS       = mainwindow.h
SOURCES       = main.cpp \
                mainwindow.cpp
RESOURCES     = ribbonsample.qrc
FORMS         = ribbonsample.ui

include($$QTITANDIR/demos/shared/aboutdialog.pri)

macx {
    CONFIG-=app_bundle
}

!lessThan(QT_VER_MAJ, 5) {
  QT += printsupport
}
