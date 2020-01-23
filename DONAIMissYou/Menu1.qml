import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Shapes 1.12
import QtCharts 2.3

Menu1Form {
    startNew.onClicked: handler.startNew();
    //graph.onClicked: stackView.push("Graph.qml")
    hourCounter.onClicked: stackView.push("HourCounter.qml")
    recallJob.onClicked:
    {
        stackView.push("SavedJobs.qml")
        handler.savedJobsCall();
    }
}
