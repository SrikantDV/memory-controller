class mc_base_test extends uvm_test;
	`uvm_component_utils(mc_base_test)
	`NEW_COMP
	mc_env m_env;
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		m_env = mc_env::type_id::create("m_env", this);
	endfunction

	function void end_of_elaboration_phase(uvm_phase phase);
		uvm_top.print_topology();
	endfunction
endclass

class wb_wr_rd_test extends mc_base_test;
	`uvm_component_utils(wb_wr_rd_test)
	`NEW_COMP
	
	task run_phase(uvm_phase phase);
		wb_wr_rd_seq seq;
		seq=wb_wr_rd_seq::type_id::create("seq");
		phase.raise_objection(this);
		phase.phase_done.set_drain_time(this, 50);
		seq.start(m_env.wagent.w_sqr);
		phase.drop_objection(this);
	endtask
endclass

class wb_reset_test extends mc_base_test;
	`uvm_component_utils(wb_reset_test)
	`NEW_COMP

	task run_phase(uvm_phase phase);
		wb_reg_reset_seq seq;
		seq = wb_reg_reset_seq::type_id::create("seq");
		phase.raise_objection(this);
		phase.phase_done.set_drain_time(this, 50);
		seq.start(m_env.wagent.w_sqr);
		phase.drop_objection(this);
	endtask
endclass
