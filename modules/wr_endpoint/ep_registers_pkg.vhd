---------------------------------------------------------------------------------------
-- Title          : Wishbone slave core for WR switch endpoint controller
---------------------------------------------------------------------------------------
-- File           : ep_registers_pkg.vhd
-- Author         : auto-generated by wbgen2 from ep_wishbone_controller.wb
-- Created        : Fri Jan 31 09:58:14 2014
-- Standard       : VHDL'87
---------------------------------------------------------------------------------------
-- THIS FILE WAS GENERATED BY wbgen2 FROM SOURCE FILE ep_wishbone_controller.wb
-- DO NOT HAND-EDIT UNLESS IT'S ABSOLUTELY NECESSARY!
---------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package ep_wbgen2_pkg is
  
  
  -- Input registers (user design -> WB slave)
  
  type t_ep_in_registers is record
    ecr_feat_vlan_i                          : std_logic;
    ecr_feat_dmtd_i                          : std_logic;
    ecr_feat_ptp_i                           : std_logic;
    ecr_feat_dpi_i                           : std_logic;
    tscr_cs_done_i                           : std_logic;
    tscr_rx_cal_result_i                     : std_logic;
    tcar_pcp_map_i                           : std_logic_vector(23 downto 0);
    mdio_asr_rdata_i                         : std_logic_vector(15 downto 0);
    mdio_asr_ready_i                         : std_logic;
    dsr_lstatus_i                            : std_logic;
    dsr_lact_i                               : std_logic;
    dmcr_en_i                                : std_logic;
    dmcr_n_avg_i                             : std_logic_vector(11 downto 0);
    dmsr_ps_val_i                            : std_logic_vector(23 downto 0);
    dmsr_ps_rdy_i                            : std_logic;
    inj_ctrl_pic_conf_ifg_i                  : std_logic_vector(15 downto 0);
    inj_ctrl_pic_conf_sel_i                  : std_logic_vector(2 downto 0);
    inj_ctrl_pic_conf_valid_i                : std_logic;
    inj_ctrl_pic_mode_id_i                   : std_logic_vector(2 downto 0);
    inj_ctrl_pic_mode_valid_i                : std_logic;
    inj_ctrl_pic_ena_i                       : std_logic;
    end record;
  
  constant c_ep_in_registers_init_value: t_ep_in_registers := (
    ecr_feat_vlan_i => '0',
    ecr_feat_dmtd_i => '0',
    ecr_feat_ptp_i => '0',
    ecr_feat_dpi_i => '0',
    tscr_cs_done_i => '0',
    tscr_rx_cal_result_i => '0',
    tcar_pcp_map_i => (others => '0'),
    mdio_asr_rdata_i => (others => '0'),
    mdio_asr_ready_i => '0',
    dsr_lstatus_i => '0',
    dsr_lact_i => '0',
    dmcr_en_i => '0',
    dmcr_n_avg_i => (others => '0'),
    dmsr_ps_val_i => (others => '0'),
    dmsr_ps_rdy_i => '0',
    inj_ctrl_pic_conf_ifg_i => (others => '0'),
    inj_ctrl_pic_conf_sel_i => (others => '0'),
    inj_ctrl_pic_conf_valid_i => '0',
    inj_ctrl_pic_mode_id_i => (others => '0'),
    inj_ctrl_pic_mode_valid_i => '0',
    inj_ctrl_pic_ena_i => '0'
    );
    
    -- Output registers (WB slave -> user design)
    
    type t_ep_out_registers is record
      ecr_portid_o                             : std_logic_vector(4 downto 0);
      ecr_rst_cnt_o                            : std_logic;
      ecr_tx_en_o                              : std_logic;
      ecr_rx_en_o                              : std_logic;
      tscr_en_txts_o                           : std_logic;
      tscr_en_rxts_o                           : std_logic;
      tscr_cs_start_o                          : std_logic;
      tscr_rx_cal_start_o                      : std_logic;
      rfcr_a_runt_o                            : std_logic;
      rfcr_a_giant_o                           : std_logic;
      rfcr_a_hp_o                              : std_logic;
      rfcr_keep_crc_o                          : std_logic;
      rfcr_hpap_o                              : std_logic_vector(7 downto 0);
      rfcr_mru_o                               : std_logic_vector(13 downto 0);
      vcr0_qmode_o                             : std_logic_vector(1 downto 0);
      vcr0_fix_prio_o                          : std_logic;
      vcr0_prio_val_o                          : std_logic_vector(2 downto 0);
      vcr0_pvid_o                              : std_logic_vector(11 downto 0);
      vcr1_offset_o                            : std_logic_vector(9 downto 0);
      vcr1_offset_wr_o                         : std_logic;
      vcr1_data_o                              : std_logic_vector(17 downto 0);
      vcr1_data_wr_o                           : std_logic;
      pfcr0_mm_addr_o                          : std_logic_vector(5 downto 0);
      pfcr0_mm_addr_wr_o                       : std_logic;
      pfcr0_mm_write_o                         : std_logic;
      pfcr0_mm_write_wr_o                      : std_logic;
      pfcr0_enable_o                           : std_logic;
      pfcr0_mm_data_msb_o                      : std_logic_vector(23 downto 0);
      pfcr0_mm_data_msb_wr_o                   : std_logic;
      pfcr1_mm_data_lsb_o                      : std_logic_vector(11 downto 0);
      pfcr1_mm_data_lsb_wr_o                   : std_logic;
      tcar_pcp_map_o                           : std_logic_vector(23 downto 0);
      tcar_pcp_map_load_o                      : std_logic;
      fcr_rxpause_o                            : std_logic;
      fcr_txpause_o                            : std_logic;
      fcr_rxpause_802_1q_o                     : std_logic;
      fcr_txpause_802_1q_o                     : std_logic;
      fcr_tx_thr_o                             : std_logic_vector(7 downto 0);
      fcr_tx_quanta_o                          : std_logic_vector(15 downto 0);
      mach_o                                   : std_logic_vector(15 downto 0);
      macl_o                                   : std_logic_vector(31 downto 0);
      mdio_cr_data_o                           : std_logic_vector(15 downto 0);
      mdio_cr_data_wr_o                        : std_logic;
      mdio_cr_addr_o                           : std_logic_vector(7 downto 0);
      mdio_cr_rw_o                             : std_logic;
      mdio_asr_phyad_o                         : std_logic_vector(7 downto 0);
      dsr_lact_o                               : std_logic;
      dsr_lact_load_o                          : std_logic;
      dmcr_en_o                                : std_logic;
      dmcr_en_load_o                           : std_logic;
      dmcr_n_avg_o                             : std_logic_vector(11 downto 0);
      dmcr_n_avg_load_o                        : std_logic;
      dmsr_ps_rdy_o                            : std_logic;
      dmsr_ps_rdy_load_o                       : std_logic;
      inj_ctrl_pic_conf_ifg_o                  : std_logic_vector(15 downto 0);
      inj_ctrl_pic_conf_ifg_load_o             : std_logic;
      inj_ctrl_pic_conf_sel_o                  : std_logic_vector(2 downto 0);
      inj_ctrl_pic_conf_sel_load_o             : std_logic;
      inj_ctrl_pic_conf_valid_o                : std_logic;
      inj_ctrl_pic_conf_valid_load_o           : std_logic;
      inj_ctrl_pic_mode_id_o                   : std_logic_vector(2 downto 0);
      inj_ctrl_pic_mode_id_load_o              : std_logic;
      inj_ctrl_pic_mode_valid_o                : std_logic;
      inj_ctrl_pic_mode_valid_load_o           : std_logic;
      inj_ctrl_pic_ena_o                       : std_logic;
      inj_ctrl_pic_ena_load_o                  : std_logic;
      end record;
    
    constant c_ep_out_registers_init_value: t_ep_out_registers := (
      ecr_portid_o => (others => '0'),
      ecr_rst_cnt_o => '0',
      ecr_tx_en_o => '0',
      ecr_rx_en_o => '0',
      tscr_en_txts_o => '0',
      tscr_en_rxts_o => '0',
      tscr_cs_start_o => '0',
      tscr_rx_cal_start_o => '0',
      rfcr_a_runt_o => '0',
      rfcr_a_giant_o => '0',
      rfcr_a_hp_o => '0',
      rfcr_keep_crc_o => '0',
      rfcr_hpap_o => (others => '0'),
      rfcr_mru_o => (others => '0'),
      vcr0_qmode_o => (others => '0'),
      vcr0_fix_prio_o => '0',
      vcr0_prio_val_o => (others => '0'),
      vcr0_pvid_o => (others => '0'),
      vcr1_offset_o => (others => '0'),
      vcr1_offset_wr_o => '0',
      vcr1_data_o => (others => '0'),
      vcr1_data_wr_o => '0',
      pfcr0_mm_addr_o => (others => '0'),
      pfcr0_mm_addr_wr_o => '0',
      pfcr0_mm_write_o => '0',
      pfcr0_mm_write_wr_o => '0',
      pfcr0_enable_o => '0',
      pfcr0_mm_data_msb_o => (others => '0'),
      pfcr0_mm_data_msb_wr_o => '0',
      pfcr1_mm_data_lsb_o => (others => '0'),
      pfcr1_mm_data_lsb_wr_o => '0',
      tcar_pcp_map_o => (others => '0'),
      tcar_pcp_map_load_o => '0',
      fcr_rxpause_o => '0',
      fcr_txpause_o => '0',
      fcr_rxpause_802_1q_o => '0',
      fcr_txpause_802_1q_o => '0',
      fcr_tx_thr_o => (others => '0'),
      fcr_tx_quanta_o => (others => '0'),
      mach_o => (others => '0'),
      macl_o => (others => '0'),
      mdio_cr_data_o => (others => '0'),
      mdio_cr_data_wr_o => '0',
      mdio_cr_addr_o => (others => '0'),
      mdio_cr_rw_o => '0',
      mdio_asr_phyad_o => (others => '0'),
      dsr_lact_o => '0',
      dsr_lact_load_o => '0',
      dmcr_en_o => '0',
      dmcr_en_load_o => '0',
      dmcr_n_avg_o => (others => '0'),
      dmcr_n_avg_load_o => '0',
      dmsr_ps_rdy_o => '0',
      dmsr_ps_rdy_load_o => '0',
      inj_ctrl_pic_conf_ifg_o => (others => '0'),
      inj_ctrl_pic_conf_ifg_load_o => '0',
      inj_ctrl_pic_conf_sel_o => (others => '0'),
      inj_ctrl_pic_conf_sel_load_o => '0',
      inj_ctrl_pic_conf_valid_o => '0',
      inj_ctrl_pic_conf_valid_load_o => '0',
      inj_ctrl_pic_mode_id_o => (others => '0'),
      inj_ctrl_pic_mode_id_load_o => '0',
      inj_ctrl_pic_mode_valid_o => '0',
      inj_ctrl_pic_mode_valid_load_o => '0',
      inj_ctrl_pic_ena_o => '0',
      inj_ctrl_pic_ena_load_o => '0'
      );
    function "or" (left, right: t_ep_in_registers) return t_ep_in_registers;
    function f_x_to_zero (x:std_logic) return std_logic;
    function f_x_to_zero (x:std_logic_vector) return std_logic_vector;
end package;

package body ep_wbgen2_pkg is
function f_x_to_zero (x:std_logic) return std_logic is
begin
if(x = 'X' or x = 'U') then
return '0';
else
return x;
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
function "or" (left, right: t_ep_in_registers) return t_ep_in_registers is
variable tmp: t_ep_in_registers;
begin
tmp.ecr_feat_vlan_i := f_x_to_zero(left.ecr_feat_vlan_i) or f_x_to_zero(right.ecr_feat_vlan_i);
tmp.ecr_feat_dmtd_i := f_x_to_zero(left.ecr_feat_dmtd_i) or f_x_to_zero(right.ecr_feat_dmtd_i);
tmp.ecr_feat_ptp_i := f_x_to_zero(left.ecr_feat_ptp_i) or f_x_to_zero(right.ecr_feat_ptp_i);
tmp.ecr_feat_dpi_i := f_x_to_zero(left.ecr_feat_dpi_i) or f_x_to_zero(right.ecr_feat_dpi_i);
tmp.tscr_cs_done_i := f_x_to_zero(left.tscr_cs_done_i) or f_x_to_zero(right.tscr_cs_done_i);
tmp.tscr_rx_cal_result_i := f_x_to_zero(left.tscr_rx_cal_result_i) or f_x_to_zero(right.tscr_rx_cal_result_i);
tmp.tcar_pcp_map_i := f_x_to_zero(left.tcar_pcp_map_i) or f_x_to_zero(right.tcar_pcp_map_i);
tmp.mdio_asr_rdata_i := f_x_to_zero(left.mdio_asr_rdata_i) or f_x_to_zero(right.mdio_asr_rdata_i);
tmp.mdio_asr_ready_i := f_x_to_zero(left.mdio_asr_ready_i) or f_x_to_zero(right.mdio_asr_ready_i);
tmp.dsr_lstatus_i := f_x_to_zero(left.dsr_lstatus_i) or f_x_to_zero(right.dsr_lstatus_i);
tmp.dsr_lact_i := f_x_to_zero(left.dsr_lact_i) or f_x_to_zero(right.dsr_lact_i);
tmp.dmcr_en_i := f_x_to_zero(left.dmcr_en_i) or f_x_to_zero(right.dmcr_en_i);
tmp.dmcr_n_avg_i := f_x_to_zero(left.dmcr_n_avg_i) or f_x_to_zero(right.dmcr_n_avg_i);
tmp.dmsr_ps_val_i := f_x_to_zero(left.dmsr_ps_val_i) or f_x_to_zero(right.dmsr_ps_val_i);
tmp.dmsr_ps_rdy_i := f_x_to_zero(left.dmsr_ps_rdy_i) or f_x_to_zero(right.dmsr_ps_rdy_i);
tmp.inj_ctrl_pic_conf_ifg_i := f_x_to_zero(left.inj_ctrl_pic_conf_ifg_i) or f_x_to_zero(right.inj_ctrl_pic_conf_ifg_i);
tmp.inj_ctrl_pic_conf_sel_i := f_x_to_zero(left.inj_ctrl_pic_conf_sel_i) or f_x_to_zero(right.inj_ctrl_pic_conf_sel_i);
tmp.inj_ctrl_pic_conf_valid_i := f_x_to_zero(left.inj_ctrl_pic_conf_valid_i) or f_x_to_zero(right.inj_ctrl_pic_conf_valid_i);
tmp.inj_ctrl_pic_mode_id_i := f_x_to_zero(left.inj_ctrl_pic_mode_id_i) or f_x_to_zero(right.inj_ctrl_pic_mode_id_i);
tmp.inj_ctrl_pic_mode_valid_i := f_x_to_zero(left.inj_ctrl_pic_mode_valid_i) or f_x_to_zero(right.inj_ctrl_pic_mode_valid_i);
tmp.inj_ctrl_pic_ena_i := f_x_to_zero(left.inj_ctrl_pic_ena_i) or f_x_to_zero(right.inj_ctrl_pic_ena_i);
return tmp;
end function;
end package body;
