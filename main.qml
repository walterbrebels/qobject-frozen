import QtQuick 2.15
import QtQuick.Window 2.15
import Frozen 1.0

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
            app.fooMemberConst;
            console.log("  Assign name of fooMember, fails with Qt6");
            // would succeed if fooMemberConst isn't called
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
            console.log("  Assign name of fooMember2, fails with Qt6");
            // would succeed if signal handler onFooMember2Emitted isn't defined
            app.fooMember2.name = "Jane";
            console.log("  Name: ", app.fooMember2.name);
        }
    }
}
