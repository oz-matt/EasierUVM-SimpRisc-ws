debImport "-i" "-simflow" "-simBin" "./simv" "-simDelim" \
					"+ntb_random_seed=1 -a simv.log +UVM_TESTNAME=top_test +UVM_VERBOSITY=UVM_MEDIUM + + +UVM_TR_RECORD +UVM_LOG_RECORD +UVM_VERDI_TRACE"
srcTBInvokeSim
verdiDockWidgetSetCurTab -dock widgetDock_<Decl._Tree>
verdiDockWidgetSetCurTab -dock widgetDock_<Inst._Tree>