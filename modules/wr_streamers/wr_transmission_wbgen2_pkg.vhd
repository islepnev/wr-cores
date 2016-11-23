---------------------------------------------------------------------------------------
-- Title          : Wishbone slave core for WR Transmission control, status and debug
---------------------------------------------------------------------------------------
-- File           : wr_transmission_wbgen2_pkg.vhd
-- Author         : auto-generated by wbgen2 from wr_transmission_wb.wb
-- Created        : Wed Nov 23 15:09:24 2016
-- Standard       : VHDL'87
---------------------------------------------------------------------------------------
-- THIS FILE WAS GENERATED BY wbgen2 FROM SOURCE FILE wr_transmission_wb.wb
-- DO NOT HAND-EDIT UNLESS IT'S ABSOLUTELY NECESSARY!
---------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package wr_transmission_wbgen2_pkg is
  
  
  -- Input registers (user design -> WB slave)
  
  type t_wr_transmission_in_registers is record
    sscr1_rx_latency_acc_overflow_i          : std_logic;
    sscr1_rst_ts_cyc_i                       : std_logic_vector(27 downto 0);
    sscr2_rst_ts_tai_lsb_i                   : std_logic_vector(31 downto 0);
    tx_stat_tx_sent_cnt_i                    : std_logic_vector(31 downto 0);
    rx_stat1_rx_rcvd_cnt_i                   : std_logic_vector(31 downto 0);
    rx_stat2_rx_loss_cnt_i                   : std_logic_vector(31 downto 0);
    rx_stat3_rx_latency_max_i                : std_logic_vector(27 downto 0);
    rx_stat4_rx_latency_min_i                : std_logic_vector(27 downto 0);
    rx_stat5_rx_latency_acc_lsb_i            : std_logic_vector(31 downto 0);
    rx_stat6_rx_latency_acc_msb_i            : std_logic_vector(31 downto 0);
    rx_stat7_rx_latency_acc_cnt_i            : std_logic_vector(31 downto 0);
    rx_stat8_rx_lost_block_cnt_i             : std_logic_vector(31 downto 0);
    dbg_data_i                               : std_logic_vector(31 downto 0);
    dbg_rx_bvalue_i                          : std_logic_vector(31 downto 0);
    dbg_tx_bvalue_i                          : std_logic_vector(31 downto 0);
    dummy_dummy_i                            : std_logic_vector(31 downto 0);
    end record;
  
  constant c_wr_transmission_in_registers_init_value: t_wr_transmission_in_registers := (
    sscr1_rx_latency_acc_overflow_i => '0',
    sscr1_rst_ts_cyc_i => (others => '0'),
    sscr2_rst_ts_tai_lsb_i => (others => '0'),
    tx_stat_tx_sent_cnt_i => (others => '0'),
    rx_stat1_rx_rcvd_cnt_i => (others => '0'),
    rx_stat2_rx_loss_cnt_i => (others => '0'),
    rx_stat3_rx_latency_max_i => (others => '0'),
    rx_stat4_rx_latency_min_i => (others => '0'),
    rx_stat5_rx_latency_acc_lsb_i => (others => '0'),
    rx_stat6_rx_latency_acc_msb_i => (others => '0'),
    rx_stat7_rx_latency_acc_cnt_i => (others => '0'),
    rx_stat8_rx_lost_block_cnt_i => (others => '0'),
    dbg_data_i => (others => '0'),
    dbg_rx_bvalue_i => (others => '0'),
    dbg_tx_bvalue_i => (others => '0'),
    dummy_dummy_i => (others => '0')
    );
    
    -- Output registers (WB slave -> user design)
    
    type t_wr_transmission_out_registers is record
      sscr1_rst_stats_o                        : std_logic;
      sscr1_rst_seq_id_o                       : std_logic;
      sscr1_snapshot_stats_o                   : std_logic;
      tx_cfg0_ethertype_o                      : std_logic_vector(15 downto 0);
      tx_cfg1_mac_local_lsb_o                  : std_logic_vector(31 downto 0);
      tx_cfg2_mac_local_msb_o                  : std_logic_vector(15 downto 0);
      tx_cfg3_mac_target_lsb_o                 : std_logic_vector(31 downto 0);
      tx_cfg4_mac_target_msb_o                 : std_logic_vector(15 downto 0);
      rx_cfg0_ethertype_o                      : std_logic_vector(15 downto 0);
      rx_cfg0_accept_broadcast_o               : std_logic;
      rx_cfg1_mac_local_lsb_o                  : std_logic_vector(31 downto 0);
      rx_cfg2_mac_local_msb_o                  : std_logic_vector(15 downto 0);
      rx_cfg3_mac_remote_lsb_o                 : std_logic_vector(31 downto 0);
      rx_cfg4_mac_remote_msb_o                 : std_logic_vector(15 downto 0);
      rx_cfg5_fixed_latency_o                  : std_logic_vector(26 downto 0);
      cfg_tx_ena_o                             : std_logic;
      cfg_rx_ena_o                             : std_logic;
      dbg_ctrl_mux_o                           : std_logic;
      dbg_ctrl_start_byte_o                    : std_logic_vector(7 downto 0);
      end record;
    
    constant c_wr_transmission_out_registers_init_value: t_wr_transmission_out_registers := (
      sscr1_rst_stats_o => '0',
      sscr1_rst_seq_id_o => '0',
      sscr1_snapshot_stats_o => '0',
      tx_cfg0_ethertype_o => (others => '0'),
      tx_cfg1_mac_local_lsb_o => (others => '0'),
      tx_cfg2_mac_local_msb_o => (others => '0'),
      tx_cfg3_mac_target_lsb_o => (others => '0'),
      tx_cfg4_mac_target_msb_o => (others => '0'),
      rx_cfg0_ethertype_o => (others => '0'),
      rx_cfg0_accept_broadcast_o => '0',
      rx_cfg1_mac_local_lsb_o => (others => '0'),
      rx_cfg2_mac_local_msb_o => (others => '0'),
      rx_cfg3_mac_remote_lsb_o => (others => '0'),
      rx_cfg4_mac_remote_msb_o => (others => '0'),
      rx_cfg5_fixed_latency_o => (others => '0'),
      cfg_tx_ena_o => '0',
      cfg_rx_ena_o => '0',
      dbg_ctrl_mux_o => '0',
      dbg_ctrl_start_byte_o => (others => '0')
      );
    function "or" (left, right: t_wr_transmission_in_registers) return t_wr_transmission_in_registers;
    function f_x_to_zero (x:std_logic) return std_logic;
    function f_x_to_zero (x:std_logic_vector) return std_logic_vector;
end package;

package body wr_transmission_wbgen2_pkg is
function f_x_to_zero (x:std_logic) return std_logic is
begin
if x = '1' then
return '1';
else
return '0';
end if;
end function;
function f_x_to_zero (x:std_logic_vector) return std_logic_vector is
variable tmp: std_logic_vector(x'length-1 downto 0);
begin
for i in 0 to x'length-1 loop
if(x(i) = 'X' or x(i) = 'U') then
tmp(i):= '0';
else
tmp(i):=x(i);
end if; 
end loop; 
return tmp;
end function;
function "or" (left, right: t_wr_transmission_in_registers) return t_wr_transmission_in_registers is
variable tmp: t_wr_transmission_in_registers;
begin
tmp.sscr1_rx_latency_acc_overflow_i := f_x_to_zero(left.sscr1_rx_latency_acc_overflow_i) or f_x_to_zero(right.sscr1_rx_latency_acc_overflow_i);
tmp.sscr1_rst_ts_cyc_i := f_x_to_zero(left.sscr1_rst_ts_cyc_i) or f_x_to_zero(right.sscr1_rst_ts_cyc_i);
tmp.sscr2_rst_ts_tai_lsb_i := f_x_to_zero(left.sscr2_rst_ts_tai_lsb_i) or f_x_to_zero(right.sscr2_rst_ts_tai_lsb_i);
tmp.tx_stat_tx_sent_cnt_i := f_x_to_zero(left.tx_stat_tx_sent_cnt_i) or f_x_to_zero(right.tx_stat_tx_sent_cnt_i);
tmp.rx_stat1_rx_rcvd_cnt_i := f_x_to_zero(left.rx_stat1_rx_rcvd_cnt_i) or f_x_to_zero(right.rx_stat1_rx_rcvd_cnt_i);
tmp.rx_stat2_rx_loss_cnt_i := f_x_to_zero(left.rx_stat2_rx_loss_cnt_i) or f_x_to_zero(right.rx_stat2_rx_loss_cnt_i);
tmp.rx_stat3_rx_latency_max_i := f_x_to_zero(left.rx_stat3_rx_latency_max_i) or f_x_to_zero(right.rx_stat3_rx_latency_max_i);
tmp.rx_stat4_rx_latency_min_i := f_x_to_zero(left.rx_stat4_rx_latency_min_i) or f_x_to_zero(right.rx_stat4_rx_latency_min_i);
tmp.rx_stat5_rx_latency_acc_lsb_i := f_x_to_zero(left.rx_stat5_rx_latency_acc_lsb_i) or f_x_to_zero(right.rx_stat5_rx_latency_acc_lsb_i);
tmp.rx_stat6_rx_latency_acc_msb_i := f_x_to_zero(left.rx_stat6_rx_latency_acc_msb_i) or f_x_to_zero(right.rx_stat6_rx_latency_acc_msb_i);
tmp.rx_stat7_rx_latency_acc_cnt_i := f_x_to_zero(left.rx_stat7_rx_latency_acc_cnt_i) or f_x_to_zero(right.rx_stat7_rx_latency_acc_cnt_i);
tmp.rx_stat8_rx_lost_block_cnt_i := f_x_to_zero(left.rx_stat8_rx_lost_block_cnt_i) or f_x_to_zero(right.rx_stat8_rx_lost_block_cnt_i);
tmp.dbg_data_i := f_x_to_zero(left.dbg_data_i) or f_x_to_zero(right.dbg_data_i);
tmp.dbg_rx_bvalue_i := f_x_to_zero(left.dbg_rx_bvalue_i) or f_x_to_zero(right.dbg_rx_bvalue_i);
tmp.dbg_tx_bvalue_i := f_x_to_zero(left.dbg_tx_bvalue_i) or f_x_to_zero(right.dbg_tx_bvalue_i);
tmp.dummy_dummy_i := f_x_to_zero(left.dummy_dummy_i) or f_x_to_zero(right.dummy_dummy_i);
return tmp;
end function;
end package body;
