class wb_base_seq extends uvm_sequence#(wb_tx);
	`uvm_object_utils(wb_base_seq)
	`NEW_OBJ
	uvm_phase phase;
	task pre_body();
		phase = get_starting_phase();
		if(phase != null) begin
			phase.raise_objection(this);
			phase.phase_done.set_drain_time(this, 50);
		end
	endtask
	task post_body();
		if(phase!= null) begin
			phase.drop_objection(this);
		end
	endtask
endclass

class wb_wr_rd_seq extends wb_base_seq;
	`uvm_object_utils(wb_wr_rd_seq)
	`NEW_OBJ
	wb_tx tx,txQ[$];
	task body();
		bit[31:0] data_t;
	for(int i=0;i<3;i++)begin
		data_t = $random & mc_common::reg_maskQ[i];
		`uvm_do_with(req, {req.wr_rd==1; req.addr[28:0]==i*4; req.data ==data_t;})
		tx = new req;
		txQ.push_back(tx);
		end
	for(int i=0;i<16;i++)begin
		data_t = $random & mc_common::reg_maskQ[i+3];
		`uvm_do_with(req, {req.wr_rd==1; req.addr[28:0]==32'h10+i*4; req.data==data_t;})
		tx = new req;
		txQ.push_back(tx);
		end
	for(int i=0;i<19;i++)begin
		tx=txQ.pop_front();
		`uvm_do_with(req, {req.wr_rd==0; req.addr==tx.addr;})
	end
	endtask
endclass
class wb_reg_reset_seq extends wb_base_seq;
	`uvm_object_utils(wb_reg_reset_seq)
	`NEW_OBJ

	task body();
		for(int i=0;i<3;i++)begin
			`uvm_do_with(req, {req.wr_rd==0; req.addr[28:0]==i*4;})
		end
		for(int i=0;i<16;i++)begin
			`uvm_do_with(req, {req.wr_rd==0; req.addr[28:0]==32'h10+i*4;})
		end
	endtask
endclass
