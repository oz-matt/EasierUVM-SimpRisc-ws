debImport "-i" "-simflow" "-simBin" "./simv" "-simDelim" \
					"+ntb_random_seed=1 -a simv.log +UVM_TESTNAME=top_test +UVM_VERBOSITY=UVM_MEDIUM + + +UVM_TR_RECORD +UVM_LOG_RECORD +UVM_VERDI_TRACE"
srcTBInvokeSim
verdiDockWidgetSetCurTab -dock widgetDock_<Decl._Tree>
verdiDockWidgetSetCurTab -dock widgetDock_<Inst._Tree>srcHBSelect "top_tb.th.uut.dut_top_inst" -win $_nTrace1
srcHBSelect "top_tb.th.uut" -win $_nTrace1
srcSetScope -win $_nTrace1 "top_tb.th.uut" -delim "."
srcHBSelect "top_tb.th.uut" -win $_nTrace1
srcHBSelect "top_tb.th.uut" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "clk" -win $_nTrace1
wvCreateWindow
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "nreset" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "instr_bus" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "in_data_bus" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "adc_in" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "mem_rw" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "mem_wstrobe" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "memclk" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pc_out" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pc_out" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "out_data_bus" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "out_addr_bus" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "out_addr_bus" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "out_data_bus_port2" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "out_addr_bus_port2" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcTBRunSim -opt {100ns}
verdiWindowWorkMode -win $_Verdi_1 -transactionDebug
evbHierTree -win $_evbWnd4 -select \
           "\$trans_root/uvm_test_top/m_env/m_insgen_agent/m_sequencer"
evbHierTree -win $_evbWnd4 -click2
evbOpenFSDB -win $_evbWnd4 -f \
           "/home/disk/EasierUVM-SimpRisc-ws/generated_tb/sim/novas.fsdb"
evbHierTree -win $_evbWnd4 -select \
           "\$trans_root/uvm_test_top/m_env/m_insgen_agent/m_sequencer"
evbHierTree -win $_evbWnd4 -click2
evbZoomOutH -win $_evbWnd4
evbZoomOutH -win $_evbWnd4
evbZoomOutH -win $_evbWnd4
evbZoomOutH -win $_evbWnd4
evbZoomOutH -win $_evbWnd4
evbHierTree -win $_evbWnd4 -select \
           "\$trans_root/uvm_test_top/m_env/m_insgen_coverage"
evbHierTree -win $_evbWnd4 -click2
evbHierTree -win $_evbWnd4 -select \
           "\$trans_root/uvm_test_top/m_env/m_memw_coverage"
evbHierTree -win $_evbWnd4 -click2
evbHierTree -win $_evbWnd4 -select \
           "\$trans_root/uvm_test_top/m_env/m_insgen_agent/m_driver"
evbHierTree -win $_evbWnd4 -click2
evbHierTree -win $_evbWnd4 -select \
           "\$trans_root/uvm_test_top/m_env/m_insgen_agent/m_monitor"
evbHierTree -win $_evbWnd4 -click2
evbSyncCursorTime -win $_evbWnd4 -on
verdiDockWidgetSetCurTab -dock windowDock_tAnalyzer_5
verdiDockWidgetSetCurTab -dock windowDock_tRelation_6
verdiDockWidgetSetCurTab -dock windowDock_tAnalyzer_5
verdiWindowBeWindow -win $_tBrowser_4
verdiWindowWorkMode -win $_Verdi_1 -hardwareDebug
wvSetCursor -win $_nWave3 6487.420290 -snap {("G1" 4)}
wvSetCursor -win $_nWave3 13326.144928 -snap {("G1" 3)}
wvSetCursor -win $_nWave3 23209.507246 -snap {("G1" 1)}
srcActiveTrace "top_tb.th.uut.clk" -win $_nTrace1 -TraceByDConWave -TraceTime \
           20000 -TraceValue 0
nsMsgSwitchTab -tab trace
srcHBSelect "top_tb.th" -win $_nTrace1
verdiWindowBeWindow -win $_nWave3
wvResizeWindow -win $_nWave3 0 28 1912 302
wvResizeWindow -win $_nWave3 0 28 1912 536
wvSetCursor -win $_nWave3 16441.394658 -snap {("G1" 1)}
wvSetCursor -win $_nWave3 20000.000000
wvSetCursor -win $_nWave3 16254.028337
wvSetCursor -win $_nWave3 16254.028337
wvSetCursor -win $_nWave3 14122.736437 -snap {("G1" 1)}
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvSetCursor -win $_nWave3 29752.766452 -snap {("G1" 23)}
wvSelectSignal -win $_nWave3 {( "G1" 24 )} 
