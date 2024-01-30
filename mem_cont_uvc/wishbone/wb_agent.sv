class wb_agent extends uvm_agent;
	`uvm_component_utils(wb_agent)
	`NEW_COMP
	wb_sqr w_sqr;
	wb_driver w_drv;
	wb_monitor w_mon;
	wb_coverage w_cov;
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		w_sqr = wb_sqr::type_id::create("w_sqr", this);
		w_drv = wb_driver::type_id::create("w_drv", this);
		w_mon = wb_monitor::type_id::create("w_mon", this);
		w_cov = wb_coverage::type_id::create("w_cov", this);
	endfunction
	function void connect_phase(uvm_phase phase);
		w_drv.seq_item_port.connect(w_sqr.seq_item_export);
		w_mon.ap_port.connect(w_cov.analysis_export);
	endfunction
endclass
