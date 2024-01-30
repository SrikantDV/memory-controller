interface wb_intf(input bit clk_i, rst_i);
	bit	[31:0]	wb_data_i;
	bit	[31:0]	wb_data_o;
	bit	[31:0]	wb_addr_i;
	bit	[3:0]	wb_sel_i;
	bit		wb_we_i;
	bit		wb_cyc_i;
	bit		wb_stb_i;
	bit		wb_ack_o;
	bit		wb_err_o;

	clocking wb_drv_cb @(posedge clk_i);
		default input #0 output #0;
		input rst_i;
		output wb_data_i;
		input wb_data_o;
		output wb_addr_i,wb_sel_i, wb_we_i, wb_cyc_i, wb_stb_i;
		input wb_ack_o, wb_err_o;
	endclocking
endinterface
