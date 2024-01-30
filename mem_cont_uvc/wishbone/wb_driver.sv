class wb_driver extends uvm_driver#(wb_tx);
	`uvm_component_utils(wb_driver)
	`NEW_COMP
	virtual wb_intf wvif;
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		if(!uvm_config_db#(virtual wb_intf)::get(this, "", "vif", wvif))begin
			`uvm_error("CONFIG_DB","NOT GETTING WISHBONE PIF HANDLE")
		end
	endfunction
	task run_phase(uvm_phase phase);
		forever begin
			seq_item_port.get_next_item(req);
			drive_tx(req);
		//	req.print();
			seq_item_port.item_done();
		end
	endtask
	
	task drive_tx(wb_tx tx);
		$display("******DRIVING WISHBONE TRANSACTION********");
		@(posedge wvif.wb_drv_cb);
		wvif.wb_drv_cb.wb_addr_i <= tx.addr;
		wvif.wb_drv_cb.wb_we_i <= tx.wr_rd;
		wvif.wb_drv_cb.wb_cyc_i <= 1'h1;
		wvif.wb_drv_cb.wb_stb_i <= 1'h1;
		if(wvif.wb_drv_cb.wb_we_i==1) wvif.wb_drv_cb.wb_data_i <= tx.data;
		wait(wvif.wb_drv_cb.wb_ack_o==1);
	//	@(posedge wvif.wb_drv_cb);
		reset_inputs();
		@(posedge wvif.wb_drv_cb);
	endtask
	task reset_inputs();
		wvif.wb_drv_cb.wb_addr_i<=0;
		wvif.wb_drv_cb.wb_we_i <= 0;
		wvif.wb_drv_cb.wb_cyc_i <=0;
		wvif.wb_drv_cb.wb_stb_i <=0; 
		wvif.wb_drv_cb.wb_data_i <=0;
	endtask
endclass
