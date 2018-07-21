
QTITAN_ROOT = $$PWD/../..

include($$QTITAN_ROOT/src/shared/platform.pri)

QTITAN_LIB_PATH = $$QTITANDIR/lib$$QTITAN_LIB_PREFIX
contains(QMAKE_HOST.arch, x86_64) {
    QTITAN_LIB_PATH = $$QTITAN_LIB_PATH/X64
}
INCLUDEPATH += $$QTITAN_ROOT/include

win32 {
        win32-g++ {
                LIBS += -L$$QTITAN_LIB_PATH
                CONFIG(debug, debug|release):LIBS += -lqtnribbond4
                        else:LIBS += -lqtnribbon4
        }
        else {
                CONFIG(debug, debug|release):LIBS += $$QTITAN_LIB_PATH/qtnribbond3.lib
                        else:LIBS += $$QTITAN_LIB_PATH/qtnribbon3.lib
        }
}

unix {

    LIBS += -L$$QTITAN_LIB_PATH

    CONFIG(debug, debug|release):LIBS += -lqtnribbond
        else:LIBS += -lqtnribbon
}

!lessThan(QT_VER_MAJ, 5) {
  QT += widgets
}
