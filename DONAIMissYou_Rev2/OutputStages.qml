import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Shapes 1.12
import QtCharts 2.3

OutputStagesForm {

    oneStageBtn.onClicked:
    {
        handler.storeStages(oneStage.text)
        oneStageCheck.visible = true;
        twoStageCheck.visible = false;
        threeStageCheck.visible = false;
        fourStageCheck.visible = false;
        fiveStageCheck.visible = false;
        sixStageCheck.visible = false;
    }
    twoStageBtn.onClicked:
    {
        handler.storeStages(twoStage.text)
        oneStageCheck.visible = false;
        twoStageCheck.visible = true;
        threeStageCheck.visible = false;
        fourStageCheck.visible = false;
        fiveStageCheck.visible = false;
        sixStageCheck.visible = false;
    }
    threeStageBtn.onClicked:
    {
        handler.storeStages(threeStage.text)
        oneStageCheck.visible = false;
        twoStageCheck.visible = false;
        threeStageCheck.visible = true;
        fourStageCheck.visible = false;
        fiveStageCheck.visible = false;
        sixStageCheck.visible = false;
    }
    fourStageBtn.onClicked:
    {
        handler.storeStages(fourStage.text)
        oneStageCheck.visible = false;
        twoStageCheck.visible = false;
        threeStageCheck.visible = false;
        fourStageCheck.visible = true;
        fiveStageCheck.visible = false;
        sixStageCheck.visible = false;
    }
    fiveStageBtn.onClicked:
    {
        handler.storeStages(fiveStage.text)
        oneStageCheck.visible = false;
        twoStageCheck.visible = false;
        threeStageCheck.visible = false;
        fourStageCheck.visible = false;
        fiveStageCheck.visible = true;
        sixStageCheck.visible = false;
    }
    sixStageBtn.onClicked:
    {
        handler.storeStages(sixStage.text)
        oneStageCheck.visible = false;
        twoStageCheck.visible = false;
        threeStageCheck.visible = false;
        fourStageCheck.visible = false;
        fiveStageCheck.visible = false;
        sixStageCheck.visible = true;
    }

    Connections{
        target: handler
        onStagesSig:{
            if(stages === 1){
                oneStageCheck.visible = true;
                twoStageCheck.visible = false;
                threeStageCheck.visible = false;
                fourStageCheck.visible = false;
                fiveStageCheck.visible = false;
                sixStageCheck.visible = false;
            }
            if(stages === 2){
                oneStageCheck.visible = false;
                twoStageCheck.visible = true;
                threeStageCheck.visible = false;
                fourStageCheck.visible = false;
                fiveStageCheck.visible = false;
                sixStageCheck.visible = false;
            }
            if(stages === 3){
                oneStageCheck.visible = false;
                twoStageCheck.visible = false;
                threeStageCheck.visible = true;
                fourStageCheck.visible = false;
                fiveStageCheck.visible = false;
                sixStageCheck.visible = false;
            }
            if(stages === 4){
                oneStageCheck.visible = false;
                twoStageCheck.visible = false;
                threeStageCheck.visible = false;
                fourStageCheck.visible = true;
                fiveStageCheck.visible = false;
                sixStageCheck.visible = false;
            }
            if(stages === 5){
                oneStageCheck.visible = false;
                twoStageCheck.visible = false;
                threeStageCheck.visible = false;
                fourStageCheck.visible = false;
                fiveStageCheck.visible = true;
                sixStageCheck.visible = false;
            }
            if(stages === 6){
                oneStageCheck.visible = false;
                twoStageCheck.visible = false;
                threeStageCheck.visible = false;
                fourStageCheck.visible = false;
                fiveStageCheck.visible = false;
                sixStageCheck.visible = true;
            }
        }
    }
}
