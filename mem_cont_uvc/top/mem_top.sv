module top;
	reg wb_clk, m_clk;
	reg wb_rst;
	wb_intf wpif(wb_clk,wb_rst);
	mem_intf mpif(m_clk);
	power_intf p_pif();
	mc_common m_com = new();

	initial begin
		wb_clk = 0;
		forever #5 wb_clk = ~wb_clk;
	end
	initial begin
		m_clk = 0;
		forever  #10 m_clk = ~m_clk;
	end
	mc_top dut(
				.clk_i(wb_clk),
				.rst_i(wb_rst),
				.wb_data_i(wpif.wb_data_i),
				.wb_data_o(wpif.wb_data_o),
				.wb_addr_i(wpif.wb_addr_i),
				.wb_sel_i(wpif.wb_sel_i),
				.wb_we_i(wpif.wb_we_i),
				.wb_cyc_i(wpif.wb_cyc_i),

				.wb_stb_i(wpif.wb_stb_i),
				.wb_ack_o(wpif.wb_ack_o),
				.wb_err_o(wpif.wb_err_o),

				.susp_req_i(p_pif.susp_req_i),
				.resume_req_i(p_pif.resume_req_i),
				.suspended_o(p_pif.suspended_o),
				.poc_o(p_pif.poc_o),

				.mc_clk_i(m_clk),
				.mc_br_pad_i(mpif.mc_br_pad_i),
				.mc_bg_pad_o(mpif.mc_bg_pad_o),
				.mc_ack_pad_i(mpif.mc_ack_pad_i),

				.mc_addr_pad_o(mpif.mc_addr_pad_o),
				.mc_data_pad_i(mpif.mc_data_pad_i),
				.mc_data_pad_o(mpif.mc_data_pad_o),
				.mc_dp_pad_i(mpif.mc_dp_pad_i),

				.mc_dp_pad_o(mpif.mc_dp_pad_o),
				.mc_doe_pad_doe_o(mpif.mc_doe_pad_doe_o),
				.mc_dqm_pad_o(mpif.mc_dqm_pad_o),
				.mc_oe_pad_o_(mpif.mc_oe_pad_o_),

				.mc_we_pad_o_(mpif.mc_we_pad_o_),
				.mc_cas_pad_o_(mpif.mc_cas_pad_o_),
				.mc_ras_pad_o_(mpif.mc_ras_pad_o_),
				.mc_cke_pad_o_(mpif.mc_cke_pad_o_),

				.mc_cs_pad_o_(mpif.mc_cs_pad_o_),
				.mc_sts_pad_i(mpif.mc_sts_pad_i),
				.mc_rp_pad_o_(mpif.mc_rp_pad_o_),
				.mc_vpen_pad_o(mpif.mc_vpen_pad_o),

				.mc_adv_pad_o_(mpif.mc_adv_pad_o_),
				.mc_zz_pad_o(mpif.mc_zz_pad_o),
				.mc_coe_pad_coe_o(mpif.mc_coe_pad_coe_o)
				);

	initial begin
		wb_rst = 1;
		repeat(2)@(posedge wb_clk);
		wb_rst = 0;
	end
	initial begin
		run_test("mc_base_test");
		end
	initial begin
		uvm_config_db#(virtual wb_intf)::set(uvm_root::get(), "*", "vif", wpif);
	end

endmodule
