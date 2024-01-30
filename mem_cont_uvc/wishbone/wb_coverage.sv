class wb_coverage extends uvm_subscriber#(wb_tx);
	`uvm_component_utils(wb_coverage)
	wb_tx tx;
	covergroup wb_cg;
		ADDR_CP: coverpoint tx.addr{
						option.auto_bin_max = 8;
				}
		WR_RD_CP: coverpoint tx.wr_rd {
						bins WR = {1'b1};
						bins RD = {1'b0};
				}
		ADDR_X_WR_RD : cross ADDR_CP, WR_RD_CP;
	endgroup

	function new(string name="", uvm_component parent);
		super.new(name, parent);
		wb_cg = new();
	endfunction
	function void write(T t);
		$cast(tx, t);
		wb_cg.sample();
	endfunction
endclass
