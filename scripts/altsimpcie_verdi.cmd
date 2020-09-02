debImport "-i" "-simflow" "-simBin" "./simv" "-simOpt" " "
verdiWindowResize -win $_Verdi_1 -2 "25" "1916" "851"
verdiDockWidgetSetCurTab -dock widgetDock_<Message>
verdiDockWidgetSetCurTab -dock windowDock_VIA_InteractiveDebug_2
srcHBSelect "pcie_example_design_tb.pcie_example_design_inst" -win $_nTrace1
srcHBSelect "pcie_example_design_tb.pcie_example_design_inst" -win $_nTrace1
srcSetScope -win $_nTrace1 "pcie_example_design_tb.pcie_example_design_inst" \
           -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
verdiDockWidgetSetCurTab -dock widgetDock_<Inst._Tree>
verdiDockWidgetSetCurTab -dock widgetDock_<Local>
verdiDockWidgetSetCurTab -dock widgetDock_<Inst._Tree>
verdiSetSyncSelection -widget MTB_SOURCE_TAB_1
srcDeselectAll -win $_nTrace1
srcSearchString "rstn" -win $_nTrace1 -next -case
srcSearchString "rstn" -win $_nTrace1 -next -case
srcSearchString "rstn" -win $_nTrace1 -next -case
srcDeselectAll -win $_nTrace1
srcSelect -signal "pcie_rstn_pin_perst" -win $_nTrace1
wvCreateWindow
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pcie_rstn_npor" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcSearchString "pipe_pclk" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {20 20 10 10 22 31}
srcDeselectAll -win $_nTrace1
srcSelect -signal "pipe_sim_only_sim_pipe_pclk_in" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcSearchString "simu_mode" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {17 17 10 10 18 27}
srcDeselectAll -win $_nTrace1
srcSelect -signal "hip_ctrl_simu_mode_pipe" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSelectGroup -win $_nWave3 {G2}
wvSelectGroup -win $_nWave3 {G2}
wvSelectGroup -win $_nWave3 {G2}
wvSelectGroup -win $_nWave3 {G2}
wvSelectGroup -win $_nWave3 {G2}
wvSelectGroup -win $_nWave3 {G2}
wvSelectSignal -win $_nWave3 {( "G1" 3 )} 
wvSelectGroup -win $_nWave3 {G1}
wvSelectGroup -win $_nWave3 {G2}
wvSelectGroup -win $_nWave3 {G2}
wvSelectGroup -win $_nWave3 {G2}
wvSetPosition -win $_nWave3 {("G2" 0)}
srcSearchString "ltssm" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {1336 1336 11 11 23 28}
srcDeselectAll -win $_nTrace1
srcSelect -signal "pipe_sim_only_sim_ltssmstate" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcSearchString "currentspee" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {1313 1313 11 11 19 30}
srcSearchString "currentspee" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {1313 1313 11 11 6 17}
srcSearchString "currentspee" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {1313 1313 7 7 18 29}
srcDeselectAll -win $_nTrace1
srcSelect -signal "dut_currentspeed_currentspeed" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcSearchString "status_lane" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {1306 1306 7 7 9 20}
srcDeselectAll -win $_nTrace1
srcSelect -signal "dut_hip_status_lane_act" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcSearchString "txdatak0" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {43 43 16 17 18 1}
wvSelectSignal -win $_nWave3 {( "G2" 3 )} 
wvScrollDown -win $_nWave3 1
wvSelectGroup -win $_nWave3 {G3}
wvSetPosition -win $_nWave3 {("G3" 0)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "pipe_sim_only_txdatak0" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pipe_sim_only_txdatak1" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pipe_sim_only_txdatak2" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pipe_sim_only_txdatak3" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pipe_sim_only_txdata0" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pipe_sim_only_txdata1" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pipe_sim_only_txdata2" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pipe_sim_only_txdata3" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollDown -win $_nWave3 1
wvSelectGroup -win $_nWave3 {G4}
wvSetPosition -win $_nWave3 {("G4" 0)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "pipe_sim_only_rxdatak0" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pipe_sim_only_rxdatak1" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pipe_sim_only_rxdatak2" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pipe_sim_only_rxdatak3" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pipe_sim_only_rxdata0" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pipe_sim_only_rxdata1" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pipe_sim_only_rxdata2" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pipe_sim_only_rxdata2" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pipe_sim_only_rxdata3" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollDown -win $_nWave3 1
verdiDockWidgetSetCurTab -dock widgetDock_<Message>
verdiDockWidgetSetCurTab -dock windowDock_nWave_3
verdiDockWidgetMaximize -dock windowDock_nWave_3
wvSelectGroup -win $_nWave3 {G1}
wvRenameGroup -win $_nWave3 {G1} {CLK AND RESET}
wvSelectGroup -win $_nWave3 {G2}
wvRenameGroup -win $_nWave3 {G2} {STATUS}
wvSelectGroup -win $_nWave3 {G3}
wvRenameGroup -win $_nWave3 {G3} {PIPE TX}
wvSelectSignal -win $_nWave3 {( "G4" 1 )} 
wvSelectGroup -win $_nWave3 {G4}
wvRenameGroup -win $_nWave3 {G4} {PIPE RX}
wvSetOptions -win $_nWave3 -autoUpdate on
srcTBSimReset
verdiDockWidgetSetCurTab -dock windowDock_VIA_InteractiveDebug_2
verdiDockWidgetSetCurTab -dock widgetDock_<Message>
srcTBRunSim
verdiDockWidgetSetCurTab -dock windowDock_VIA_InteractiveDebug_2
verdiDockWidgetSetCurTab -dock windowDock_nWave_3
verdiDockWidgetMaximize -dock windowDock_nWave_3
verdiDockWidgetRestore -dock windowDock_nWave_3
verdiDockWidgetSetCurTab -dock windowDock_VIA_InteractiveDebug_2
verdiDockWidgetSetCurTab -dock windowDock_nWave_3
verdiDockWidgetMaximize -dock windowDock_nWave_3
verdiDockWidgetRestore -dock windowDock_nWave_3
