class mc_env extends uvm_env;
	`uvm_component_utils(mc_env);
	`NEW_COMP
	wb_agent wagent;
	
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		wagent = wb_agent::type_id::create("wagent", this);
	endfunction
endclass
