class wb_monitor extends uvm_monitor;
	`uvm_component_utils(wb_monitor)
	`NEW_COMP
	wb_tx tx;
	uvm_analysis_port#(wb_tx) ap_port;
	virtual wb_intf vif;
	
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		tx = wb_tx::type_id::create("tx");
		ap_port = new("ap_port", this);
		if(!uvm_config_db#(virtual wb_intf)::get(this, "", "vif", vif)) begin
			`uvm_error("CONFIG_DB","NOT GETTING THE VIF HANDLE")
		end
	endfunction

	task run_phase(uvm_phase phase);
				$display("ENTRY 1");
		forever begin
			@(posedge vif.clk_i);
			if(vif.wb_cyc_i==1 && vif.wb_stb_i==1 && vif.wb_ack_o==1) begin
				tx.addr = vif.wb_addr_i;
				tx.wr_rd = vif.wb_we_i;
				tx.data = vif.wb_we_i ? vif.wb_data_i : vif.wb_data_o ;
				$display("addr=%h, data=%h",tx.addr,tx.data);
				ap_port.write(tx);
			end
		end
	endtask
endclass
