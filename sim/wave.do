onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /top/wb_clk
add wave -noupdate /top/m_clk
add wave -noupdate /top/wb_rst
add wave -noupdate -group wishbone /top/wpif/clk_i
add wave -noupdate -group wishbone /top/wpif/rst_i
add wave -noupdate -group wishbone /top/wpif/wb_addr_i
add wave -noupdate -group wishbone /top/wpif/wb_data_i
add wave -noupdate -group wishbone /top/wpif/wb_data_o
add wave -noupdate -group wishbone /top/wpif/wb_sel_i
add wave -noupdate -group wishbone /top/wpif/wb_we_i
add wave -noupdate -group wishbone /top/wpif/wb_cyc_i
add wave -noupdate -group wishbone /top/wpif/wb_stb_i
add wave -noupdate -group wishbone /top/wpif/wb_ack_o
add wave -noupdate -group wishbone /top/wpif/wb_err_o
add wave -noupdate -group memory_intf /top/mpif/mc_clk_i
add wave -noupdate -group memory_intf /top/mpif/mc_br_pad_i
add wave -noupdate -group memory_intf /top/mpif/mc_bg_pad_o
add wave -noupdate -group memory_intf /top/mpif/mc_ack_pad_i
add wave -noupdate -group memory_intf /top/mpif/mc_addr_pad_o
add wave -noupdate -group memory_intf /top/mpif/mc_data_pad_i
add wave -noupdate -group memory_intf /top/mpif/mc_data_pad_o
add wave -noupdate -group memory_intf /top/mpif/mc_dp_pad_i
add wave -noupdate -group memory_intf /top/mpif/mc_dp_pad_o
add wave -noupdate -group memory_intf /top/mpif/mc_doe_pad_doe_o
add wave -noupdate -group memory_intf /top/mpif/mc_dqm_pad_o
add wave -noupdate -group memory_intf /top/mpif/mc_oe_pad_o_
add wave -noupdate -group memory_intf /top/mpif/mc_we_pad_o_
add wave -noupdate -group memory_intf /top/mpif/mc_cas_pad_o_
add wave -noupdate -group memory_intf /top/mpif/mc_ras_pad_o_
add wave -noupdate -group memory_intf /top/mpif/mc_cke_pad_o_
add wave -noupdate -group memory_intf /top/mpif/mc_cs_pad_o_
add wave -noupdate -group memory_intf /top/mpif/mc_sts_pad_i
add wave -noupdate -group memory_intf /top/mpif/mc_rp_pad_o_
add wave -noupdate -group memory_intf /top/mpif/mc_vpen_pad_o
add wave -noupdate -group memory_intf /top/mpif/mc_adsc_pad_o_
add wave -noupdate -group memory_intf /top/mpif/mc_adv_pad_o_
add wave -noupdate -group memory_intf /top/mpif/mc_zz_pad_o
add wave -noupdate -group memory_intf /top/mpif/mc_coe_pad_coe_o
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1023650 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {1653750 ps}
