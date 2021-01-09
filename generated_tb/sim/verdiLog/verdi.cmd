sidCmdLineBehaviorAnalysis
sidCmdLineBehaviorAnalysisOpt -incr -clockSkew 0 -loopUnroll 0 -bboxEmptyModule 0  -cellModel 0 -bboxIgnoreProtected 0 
debImport "-f" "verdi_files.f" "-sv"
debLoadSimResult /home/iclab608/EasierUVM-simprisc-ws/generated_tb/sim/novas.fsdb
wvCreateWindow
verdiDockWidgetDisplay -dock widgetDock_WelcomePage
verdiWindowResize -win Verdi_1 "0" "28" "1764" "725"
verdiDockWidgetHide -dock widgetDock_WelcomePage
verdiWindowResize -win Verdi_1 "0" "28" "1764" "725"
verdiDockWidgetSetCurTab -dock widgetDock_<Message>
verdiDockWidgetSetCurTab -dock windowDock_nWave_2
verdiWindowBeWindow -win nWave_2
wvResizeWindow -win $_nWave2 -9 604 1759 116
wvResizeWindow -win $_nWave2 -9 628 1764 725
wvOpenFile -win $_nWave2 -mul \
           {/home/iclab608/EasierUVM-simprisc-ws/generated_tb/sim/novas.fsdb} {/home/iclab608/EasierUVM-simprisc-ws/generated_tb/sim/nova.fsdb} {/home/iclab608/EasierUVM-simprisc-ws/generated_tb/sim/inter.fsdb} 
wvResizeWindow -win $_nWave2 -9 628 1759 116
wvResizeWindow -win $_nWave2 -9 628 1759 192
wvResizeWindow -win $_nWave2 -9 410 1759 457
debExit
