`define NEW_COMP\
function new(string name="", uvm_component parent=null);\
	super.new(name, parent);\
endfunction

`define NEW_OBJ\
function new(string name="");\
	super.new(name);\
endfunction
class mc_common;
	static bit[31:0]reg_maskQ[18:0];
	function new();
		reg_maskQ[0]= 32'hFF00_0706;
		reg_maskQ[1]= 32'h0000_0000;
		reg_maskQ[2]= 32'h0000_FFFF;
		reg_maskQ[3]= 32'h00FF_0FFF;
		reg_maskQ[4]= 32'hFFFF_FFFF;
		reg_maskQ[5]= 32'h00FF_0FFF;
		reg_maskQ[6]= 32'hFFFF_FFFF;
		reg_maskQ[7]= 32'h00FF_0FFF;
		reg_maskQ[8]= 32'hFFFF_FFFF;
		reg_maskQ[9]= 32'h00FF_0FFF;
		reg_maskQ[10]= 32'hFFFF_FFFF;
		reg_maskQ[11]= 32'h00FF_0FFF;
		reg_maskQ[12]= 32'hFFFF_FFFF;
		reg_maskQ[13]= 32'h00FF_0FFF;
		reg_maskQ[14]= 32'hFFFF_FFFF;
		reg_maskQ[15]= 32'h00FF_0FFF;
		reg_maskQ[16]= 32'hFFFF_FFFF;
		reg_maskQ[17]= 32'h00FF_0FFF;
		reg_maskQ[18]= 32'hFFFF_FFFF;
	endfunction
endclass

