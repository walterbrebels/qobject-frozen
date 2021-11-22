import QtQuick
import QtQuick.Window
import Frozen

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    App {
        id: app;

        onFooMember2Emitted: {
            console.log("  onFooMember2Emitted");
        }
    }

    Timer
    {
        interval: 1;
        repeat: false;
        running: true;
        onTriggered: {
            console.log("Test 1:");
            console.log("  Assign name of fooMember");
            app.fooMember.name = "John";
            console.log("  Return fooMember as const pointer to QML");
            let f = app.fooMemberConst;
            console.log("  Assign name of fooMember, will fail");
            app.fooMember.name = "Jane";
            console.log("  Name: ", app.fooMember.name);
        }
    }

    Timer
    {
        interval: 10;
        repeat: false;
        running: true;
        onTriggered: {
            console.log("Test 2:");
            console.log("  Assign name of fooMember2");
            app.fooMember2.name = "John";
            console.log("  Trigger signal with fooMember2 as argument");
            app.triggerSignal();
            console.log("  Assign name of fooMember2, will fail");
            app.fooMember2.name = "Jane";
            console.log("  Name: ", app.fooMember2.name);
        }
    }
}
