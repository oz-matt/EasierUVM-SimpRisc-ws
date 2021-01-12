sidCmdLineBehaviorAnalysis
sidCmdLineBehaviorAnalysisOpt -incr -clockSkew 0 -loopUnroll 0 -bboxEmptyModule 0  -cellModel 0 -bboxIgnoreProtected 0 
verdiWindowResize -win Verdi_1 "0" "28" "1764" "725"
debImport "-f" "verdi_files.f" "-sv"
debLoadSimResult /home/iclab608/EasierUVM-simprisc-ws/generated_tb/sim/novas.fsdb
wvCreateWindow
verdiDockWidgetDisplay -dock widgetDock_WelcomePage
verdiWindowResize -win Verdi_1 "0" "28" "1764" "725"
verdiDockWidgetHide -dock widgetDock_WelcomePage
verdiWindowResize -win Verdi_1 "0" "28" "1764" "725"
srcDeselectAll -win $_nTrace1
srcSelect -signal "in_data_bus" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "in_data_bus" -win $_nTrace1
srcAction -pos 5 10 5 -win $_nTrace1 -name "in_data_bus" -ctrlKey off
verdiDockWidgetSetCurTab -dock widgetDock_<Message>
srcDeselectAll -win $_nTrace1
verdiWindowResize -win Verdi_1 "0" "28" "1764" "753"
verdiWindowResize -win Verdi_1 "0" "28" "1764" "725"
debExit
