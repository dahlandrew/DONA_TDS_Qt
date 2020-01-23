QT += quick network qml svg widgets concurrent sql quickcontrols2 xml charts

CONFIG += c++11

# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Refer to the documentation for the
# deprecated API to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        csvwriter.cpp \
        handler.cpp \
        main.cpp \
        tcp.cpp \
        timer.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    csvwriter.h \
    handler.h \
    tcp.h \
    timer.h

contains(ANDROID_TARGET_ARCH,armeabi-v7a) {
    ANDROID_PACKAGE_SOURCE_DIR = \
        $$PWD/android
}

android {

QT += androidextras  #allows communication with java files

DISTFILES += \
    android/AndroidManifest.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew \
    android/gradlew.bat \
    android/res/values/libs.xml \
    android/res/xml/filepaths.xml \
    android/src/org/qtproject/tds/QShareUtils.java
}

ios {
QML2_IMPORT_PATH += $$PWD/qml                           #iOS needs a 'QML2' and must have qml files in root directory
QML2_IMPORT_PATH += $$PWD/qml/QtQuick/Controls/Styles   #$$PWD is the root directory

ios_icon.files = $$files($$PWD/AppIcons/DONA_*.png)
QMAKE_BUNDLE_DATA += ios_icon

OBJECTIVE_SOURCES +=\
        ios/src/docviewcontroller.mm \                  #C-Obj files used to share files on iOS
        ios/src/iosshareutils.mm

QMAKE_INFO_PLIST += ios/Info.plist                      #iOS version of Android Manifest

HEADERS +=\
    cpp/shareutils.hpp \
    cpp/ios/docviewcontroller.hpp \
    cpp/ios/iosshareutils.hpp
}
