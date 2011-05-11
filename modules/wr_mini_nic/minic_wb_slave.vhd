---------------------------------------------------------------------------------------
-- Title          : Wishbone slave core for Mini NIC for WhiteRabbit
---------------------------------------------------------------------------------------
-- File           : minic_wb_slave.vhd
-- Author         : auto-generated by wbgen2 from mini_nic.wb
-- Created        : Fri Aug 13 02:17:20 2010
-- Standard       : VHDL'87
---------------------------------------------------------------------------------------
-- THIS FILE WAS GENERATED BY wbgen2 FROM SOURCE FILE mini_nic.wb
-- DO NOT HAND-EDIT UNLESS IT'S ABSOLUTELY NECESSARY!
---------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.wbgen2_pkg.all;

entity minic_wb_slave is
  port (
    rst_n_i                                  : in     std_logic;
    wb_clk_i                                 : in     std_logic;
    wb_addr_i                                : in     std_logic_vector(3 downto 0);
    wb_data_i                                : in     std_logic_vector(31 downto 0);
    wb_data_o                                : out    std_logic_vector(31 downto 0);
    wb_cyc_i                                 : in     std_logic;
    wb_sel_i                                 : in     std_logic_vector(3 downto 0);
    wb_stb_i                                 : in     std_logic;
    wb_we_i                                  : in     std_logic;
    wb_ack_o                                 : out    std_logic;
    wb_irq_o                                 : out    std_logic;
-- Port for MONOSTABLE field: 'TX DMA start' in reg: 'miNIC Control Register'
    minic_mcr_tx_start_o                     : out    std_logic;
-- Port for BIT field: 'TX DMA idle' in reg: 'miNIC Control Register'
    minic_mcr_tx_idle_i                      : in     std_logic;
-- Port for BIT field: 'TX DMA error' in reg: 'miNIC Control Register'
    minic_mcr_tx_error_i                     : in     std_logic;
-- Port for BIT field: 'RX DMA ready' in reg: 'miNIC Control Register'
    minic_mcr_rx_ready_i                     : in     std_logic;
-- Port for BIT field: 'RX DMA buffer full' in reg: 'miNIC Control Register'
    minic_mcr_rx_full_i                      : in     std_logic;
-- Port for BIT field: 'RX DMA enable' in reg: 'miNIC Control Register'
    minic_mcr_rx_en_o                        : out    std_logic;
-- Port for std_logic_vector field: 'TX DMA buffer address' in reg: 'TX DMA Address'
    minic_tx_addr_o                          : out    std_logic_vector(23 downto 0);
    minic_tx_addr_i                          : in     std_logic_vector(23 downto 0);
    minic_tx_addr_load_o                     : out    std_logic;
-- Port for std_logic_vector field: 'RX DMA buffer address' in reg: 'RX DMA Address'
    minic_rx_addr_o                          : out    std_logic_vector(23 downto 0);
    minic_rx_addr_i                          : in     std_logic_vector(23 downto 0);
    minic_rx_addr_load_o                     : out    std_logic;
-- Port for std_logic_vector field: 'RX available words' in reg: 'RX buffer size register'
    minic_rx_avail_o                         : out    std_logic_vector(23 downto 0);
    minic_rx_avail_i                         : in     std_logic_vector(23 downto 0);
    minic_rx_avail_load_o                    : out    std_logic;
-- FIFO write request
    minic_tsfifo_wr_req_i                    : in     std_logic;
-- FIFO full flag
    minic_tsfifo_wr_full_o                   : out    std_logic;
-- FIFO empty flag
    minic_tsfifo_wr_empty_o                  : out    std_logic;
    minic_tsfifo_tsval_i                     : in     std_logic_vector(31 downto 0);
    minic_tsfifo_pid_i                       : in     std_logic_vector(4 downto 0);
    minic_tsfifo_fid_i                       : in     std_logic_vector(15 downto 0);
-- Port for std_logic_vector field: 'interrupt counter' in reg: 'Debug register'
    minic_dbgr_irq_cnt_i                     : in     std_logic_vector(23 downto 0);
-- Port for BIT field: 'status of wb_irq_o line' in reg: 'Debug register'
    minic_dbgr_wb_irq_val_i                  : in     std_logic;
    irq_tx_i                                 : in     std_logic;
    irq_tx_ack_o                             : out    std_logic;
    irq_tx_mask_o                            : out    std_logic;
    irq_rx_i                                 : in     std_logic;
    irq_rx_ack_o                             : out    std_logic;
    irq_txts_i                               : in     std_logic
  );
end minic_wb_slave;

architecture syn of minic_wb_slave is

signal minic_mcr_tx_start_dly0                  : std_logic      ;
signal minic_mcr_tx_start_int                   : std_logic      ;
signal minic_mcr_rx_en_int                      : std_logic      ;
signal minic_tsfifo_in_int                      : std_logic_vector(52 downto 0);
signal minic_tsfifo_out_int                     : std_logic_vector(52 downto 0);
signal minic_tsfifo_rdreq_int                   : std_logic      ;
signal minic_tsfifo_rdreq_int_d0                : std_logic      ;
signal eic_idr_int                              : std_logic_vector(2 downto 0);
signal eic_idr_write_int                        : std_logic      ;
signal eic_ier_int                              : std_logic_vector(2 downto 0);
signal eic_ier_write_int                        : std_logic      ;
signal eic_imr_int                              : std_logic_vector(2 downto 0);
signal eic_isr_clear_int                        : std_logic_vector(2 downto 0);
signal eic_isr_status_int                       : std_logic_vector(2 downto 0);
signal eic_irq_ack_int                          : std_logic_vector(2 downto 0);
signal eic_isr_write_int                        : std_logic      ;
signal minic_tsfifo_empty_int                   : std_logic      ;
signal irq_inputs_vector_int                    : std_logic_vector(2 downto 0);
signal ack_sreg                                 : std_logic_vector(9 downto 0);
signal rddata_reg                               : std_logic_vector(31 downto 0);
signal wrdata_reg                               : std_logic_vector(31 downto 0);
signal bwsel_reg                                : std_logic_vector(3 downto 0);
signal rwaddr_reg                               : std_logic_vector(3 downto 0);
signal ack_in_progress                          : std_logic      ;
signal wr_int                                   : std_logic      ;
signal rd_int                                   : std_logic      ;
signal bus_clock_int                            : std_logic      ;
signal allones                                  : std_logic_vector(31 downto 0);
signal allzeros                                 : std_logic_vector(31 downto 0);

begin
-- Some internal signals assignments. For (foreseen) compatibility with other bus standards.
  wrdata_reg <= wb_data_i;
  bwsel_reg <= wb_sel_i;
  bus_clock_int <= wb_clk_i;
  rd_int <= wb_cyc_i and (wb_stb_i and (not wb_we_i));
  wr_int <= wb_cyc_i and (wb_stb_i and wb_we_i);
  allones <= (others => '1');
  allzeros <= (others => '0');
-- 
-- Main register bank access process.
  process (bus_clock_int, rst_n_i)
  begin
    if (rst_n_i = '0') then 
      ack_sreg <= "0000000000";
      ack_in_progress <= '0';
      rddata_reg <= "00000000000000000000000000000000";
      minic_mcr_tx_start_int <= '0';
      minic_mcr_rx_en_int <= '0';
      minic_tx_addr_load_o <= '0';
      minic_rx_addr_load_o <= '0';
      minic_rx_avail_load_o <= '0';
      eic_idr_write_int <= '0';
      eic_ier_write_int <= '0';
      eic_isr_write_int <= '0';
      minic_tsfifo_rdreq_int <= '0';
    elsif rising_edge(bus_clock_int) then
-- advance the ACK generator shift register
      ack_sreg(8 downto 0) <= ack_sreg(9 downto 1);
      ack_sreg(9) <= '0';
      if (ack_in_progress = '1') then
        if (ack_sreg(0) = '1') then
          minic_mcr_tx_start_int <= '0';
          minic_tx_addr_load_o <= '0';
          minic_rx_addr_load_o <= '0';
          minic_rx_avail_load_o <= '0';
          eic_idr_write_int <= '0';
          eic_ier_write_int <= '0';
          eic_isr_write_int <= '0';
          ack_in_progress <= '0';
        else
          minic_tx_addr_load_o <= '0';
          minic_rx_addr_load_o <= '0';
          minic_rx_avail_load_o <= '0';
        end if;
      else
        if ((wb_cyc_i = '1') and (wb_stb_i = '1')) then
          case rwaddr_reg(3 downto 0) is
          when "0000" => 
            if (wb_we_i = '1') then
              minic_mcr_tx_start_int <= wrdata_reg(0);
              minic_mcr_rx_en_int <= wrdata_reg(10);
            else
              rddata_reg(1) <= minic_mcr_tx_idle_i;
              rddata_reg(2) <= minic_mcr_tx_error_i;
              rddata_reg(8) <= minic_mcr_rx_ready_i;
              rddata_reg(9) <= minic_mcr_rx_full_i;
              rddata_reg(10) <= minic_mcr_rx_en_int;
              rddata_reg(3) <= 'X';
              rddata_reg(4) <= 'X';
              rddata_reg(5) <= 'X';
              rddata_reg(6) <= 'X';
              rddata_reg(7) <= 'X';
              rddata_reg(11) <= 'X';
              rddata_reg(12) <= 'X';
              rddata_reg(13) <= 'X';
              rddata_reg(14) <= 'X';
              rddata_reg(15) <= 'X';
              rddata_reg(16) <= 'X';
              rddata_reg(17) <= 'X';
              rddata_reg(18) <= 'X';
              rddata_reg(19) <= 'X';
              rddata_reg(20) <= 'X';
              rddata_reg(21) <= 'X';
              rddata_reg(22) <= 'X';
              rddata_reg(23) <= 'X';
              rddata_reg(24) <= 'X';
              rddata_reg(25) <= 'X';
              rddata_reg(26) <= 'X';
              rddata_reg(27) <= 'X';
              rddata_reg(28) <= 'X';
              rddata_reg(29) <= 'X';
              rddata_reg(30) <= 'X';
              rddata_reg(31) <= 'X';
            end if;
            ack_sreg(2) <= '1';
            ack_in_progress <= '1';
          when "0001" => 
            if (wb_we_i = '1') then
              minic_tx_addr_load_o <= '1';
            else
              rddata_reg(23 downto 0) <= minic_tx_addr_i;
              rddata_reg(24) <= 'X';
              rddata_reg(25) <= 'X';
              rddata_reg(26) <= 'X';
              rddata_reg(27) <= 'X';
              rddata_reg(28) <= 'X';
              rddata_reg(29) <= 'X';
              rddata_reg(30) <= 'X';
              rddata_reg(31) <= 'X';
            end if;
            ack_sreg(0) <= '1';
            ack_in_progress <= '1';
          when "0010" => 
            if (wb_we_i = '1') then
              minic_rx_addr_load_o <= '1';
            else
              rddata_reg(23 downto 0) <= minic_rx_addr_i;
              rddata_reg(24) <= 'X';
              rddata_reg(25) <= 'X';
              rddata_reg(26) <= 'X';
              rddata_reg(27) <= 'X';
              rddata_reg(28) <= 'X';
              rddata_reg(29) <= 'X';
              rddata_reg(30) <= 'X';
              rddata_reg(31) <= 'X';
            end if;
            ack_sreg(0) <= '1';
            ack_in_progress <= '1';
          when "0011" => 
            if (wb_we_i = '1') then
              minic_rx_avail_load_o <= '1';
            else
              rddata_reg(23 downto 0) <= minic_rx_avail_i;
              rddata_reg(24) <= 'X';
              rddata_reg(25) <= 'X';
              rddata_reg(26) <= 'X';
              rddata_reg(27) <= 'X';
              rddata_reg(28) <= 'X';
              rddata_reg(29) <= 'X';
              rddata_reg(30) <= 'X';
              rddata_reg(31) <= 'X';
            end if;
            ack_sreg(0) <= '1';
            ack_in_progress <= '1';
          when "0100" => 
            if (wb_we_i = '1') then
            else
              rddata_reg(23 downto 0) <= minic_dbgr_irq_cnt_i;
              rddata_reg(24) <= minic_dbgr_wb_irq_val_i;
              rddata_reg(25) <= 'X';
              rddata_reg(26) <= 'X';
              rddata_reg(27) <= 'X';
              rddata_reg(28) <= 'X';
              rddata_reg(29) <= 'X';
              rddata_reg(30) <= 'X';
              rddata_reg(31) <= 'X';
            end if;
            ack_sreg(0) <= '1';
            ack_in_progress <= '1';
          when "1000" => 
            if (wb_we_i = '1') then
              eic_idr_write_int <= '1';
            else
              rddata_reg(0) <= 'X';
              rddata_reg(1) <= 'X';
              rddata_reg(2) <= 'X';
              rddata_reg(3) <= 'X';
              rddata_reg(4) <= 'X';
              rddata_reg(5) <= 'X';
              rddata_reg(6) <= 'X';
              rddata_reg(7) <= 'X';
              rddata_reg(8) <= 'X';
              rddata_reg(9) <= 'X';
              rddata_reg(10) <= 'X';
              rddata_reg(11) <= 'X';
              rddata_reg(12) <= 'X';
              rddata_reg(13) <= 'X';
              rddata_reg(14) <= 'X';
              rddata_reg(15) <= 'X';
              rddata_reg(16) <= 'X';
              rddata_reg(17) <= 'X';
              rddata_reg(18) <= 'X';
              rddata_reg(19) <= 'X';
              rddata_reg(20) <= 'X';
              rddata_reg(21) <= 'X';
              rddata_reg(22) <= 'X';
              rddata_reg(23) <= 'X';
              rddata_reg(24) <= 'X';
              rddata_reg(25) <= 'X';
              rddata_reg(26) <= 'X';
              rddata_reg(27) <= 'X';
              rddata_reg(28) <= 'X';
              rddata_reg(29) <= 'X';
              rddata_reg(30) <= 'X';
              rddata_reg(31) <= 'X';
            end if;
            ack_sreg(0) <= '1';
            ack_in_progress <= '1';
          when "1001" => 
            if (wb_we_i = '1') then
              eic_ier_write_int <= '1';
            else
              rddata_reg(0) <= 'X';
              rddata_reg(1) <= 'X';
              rddata_reg(2) <= 'X';
              rddata_reg(3) <= 'X';
              rddata_reg(4) <= 'X';
              rddata_reg(5) <= 'X';
              rddata_reg(6) <= 'X';
              rddata_reg(7) <= 'X';
              rddata_reg(8) <= 'X';
              rddata_reg(9) <= 'X';
              rddata_reg(10) <= 'X';
              rddata_reg(11) <= 'X';
              rddata_reg(12) <= 'X';
              rddata_reg(13) <= 'X';
              rddata_reg(14) <= 'X';
              rddata_reg(15) <= 'X';
              rddata_reg(16) <= 'X';
              rddata_reg(17) <= 'X';
              rddata_reg(18) <= 'X';
              rddata_reg(19) <= 'X';
              rddata_reg(20) <= 'X';
              rddata_reg(21) <= 'X';
              rddata_reg(22) <= 'X';
              rddata_reg(23) <= 'X';
              rddata_reg(24) <= 'X';
              rddata_reg(25) <= 'X';
              rddata_reg(26) <= 'X';
              rddata_reg(27) <= 'X';
              rddata_reg(28) <= 'X';
              rddata_reg(29) <= 'X';
              rddata_reg(30) <= 'X';
              rddata_reg(31) <= 'X';
            end if;
            ack_sreg(0) <= '1';
            ack_in_progress <= '1';
          when "1010" => 
            if (wb_we_i = '1') then
            else
              rddata_reg(2 downto 0) <= eic_imr_int(2 downto 0);
              rddata_reg(3) <= 'X';
              rddata_reg(4) <= 'X';
              rddata_reg(5) <= 'X';
              rddata_reg(6) <= 'X';
              rddata_reg(7) <= 'X';
              rddata_reg(8) <= 'X';
              rddata_reg(9) <= 'X';
              rddata_reg(10) <= 'X';
              rddata_reg(11) <= 'X';
              rddata_reg(12) <= 'X';
              rddata_reg(13) <= 'X';
              rddata_reg(14) <= 'X';
              rddata_reg(15) <= 'X';
              rddata_reg(16) <= 'X';
              rddata_reg(17) <= 'X';
              rddata_reg(18) <= 'X';
              rddata_reg(19) <= 'X';
              rddata_reg(20) <= 'X';
              rddata_reg(21) <= 'X';
              rddata_reg(22) <= 'X';
              rddata_reg(23) <= 'X';
              rddata_reg(24) <= 'X';
              rddata_reg(25) <= 'X';
              rddata_reg(26) <= 'X';
              rddata_reg(27) <= 'X';
              rddata_reg(28) <= 'X';
              rddata_reg(29) <= 'X';
              rddata_reg(30) <= 'X';
              rddata_reg(31) <= 'X';
            end if;
            ack_sreg(0) <= '1';
            ack_in_progress <= '1';
          when "1011" => 
            if (wb_we_i = '1') then
              eic_isr_write_int <= '1';
            else
              rddata_reg(2 downto 0) <= eic_isr_status_int(2 downto 0);
              rddata_reg(3) <= 'X';
              rddata_reg(4) <= 'X';
              rddata_reg(5) <= 'X';
              rddata_reg(6) <= 'X';
              rddata_reg(7) <= 'X';
              rddata_reg(8) <= 'X';
              rddata_reg(9) <= 'X';
              rddata_reg(10) <= 'X';
              rddata_reg(11) <= 'X';
              rddata_reg(12) <= 'X';
              rddata_reg(13) <= 'X';
              rddata_reg(14) <= 'X';
              rddata_reg(15) <= 'X';
              rddata_reg(16) <= 'X';
              rddata_reg(17) <= 'X';
              rddata_reg(18) <= 'X';
              rddata_reg(19) <= 'X';
              rddata_reg(20) <= 'X';
              rddata_reg(21) <= 'X';
              rddata_reg(22) <= 'X';
              rddata_reg(23) <= 'X';
              rddata_reg(24) <= 'X';
              rddata_reg(25) <= 'X';
              rddata_reg(26) <= 'X';
              rddata_reg(27) <= 'X';
              rddata_reg(28) <= 'X';
              rddata_reg(29) <= 'X';
              rddata_reg(30) <= 'X';
              rddata_reg(31) <= 'X';
            end if;
            ack_sreg(0) <= '1';
            ack_in_progress <= '1';
          when "1100" => 
            if (wb_we_i = '1') then
            else
              if (minic_tsfifo_rdreq_int_d0 = '0') then
                minic_tsfifo_rdreq_int <= not minic_tsfifo_rdreq_int;
              else
                rddata_reg(31 downto 0) <= minic_tsfifo_out_int(31 downto 0);
                ack_in_progress <= '1';
                ack_sreg(0) <= '1';
              end if;
            end if;
          when "1101" => 
            if (wb_we_i = '1') then
            else
              rddata_reg(4 downto 0) <= minic_tsfifo_out_int(36 downto 32);
              rddata_reg(20 downto 5) <= minic_tsfifo_out_int(52 downto 37);
              rddata_reg(21) <= 'X';
              rddata_reg(22) <= 'X';
              rddata_reg(23) <= 'X';
              rddata_reg(24) <= 'X';
              rddata_reg(25) <= 'X';
              rddata_reg(26) <= 'X';
              rddata_reg(27) <= 'X';
              rddata_reg(28) <= 'X';
              rddata_reg(29) <= 'X';
              rddata_reg(30) <= 'X';
              rddata_reg(31) <= 'X';
            end if;
            ack_sreg(0) <= '1';
            ack_in_progress <= '1';
          when "1110" => 
            if (wb_we_i = '1') then
            else
              rddata_reg(17) <= minic_tsfifo_empty_int;
              rddata_reg(0) <= 'X';
              rddata_reg(1) <= 'X';
              rddata_reg(2) <= 'X';
              rddata_reg(3) <= 'X';
              rddata_reg(4) <= 'X';
              rddata_reg(5) <= 'X';
              rddata_reg(6) <= 'X';
              rddata_reg(7) <= 'X';
              rddata_reg(8) <= 'X';
              rddata_reg(9) <= 'X';
              rddata_reg(10) <= 'X';
              rddata_reg(11) <= 'X';
              rddata_reg(12) <= 'X';
              rddata_reg(13) <= 'X';
              rddata_reg(14) <= 'X';
              rddata_reg(15) <= 'X';
              rddata_reg(16) <= 'X';
              rddata_reg(18) <= 'X';
              rddata_reg(19) <= 'X';
              rddata_reg(20) <= 'X';
              rddata_reg(21) <= 'X';
              rddata_reg(22) <= 'X';
              rddata_reg(23) <= 'X';
              rddata_reg(24) <= 'X';
              rddata_reg(25) <= 'X';
              rddata_reg(26) <= 'X';
              rddata_reg(27) <= 'X';
              rddata_reg(28) <= 'X';
              rddata_reg(29) <= 'X';
              rddata_reg(30) <= 'X';
              rddata_reg(31) <= 'X';
            end if;
            ack_sreg(0) <= '1';
            ack_in_progress <= '1';
          when others =>
-- prevent the slave from hanging the bus on invalid address
            ack_in_progress <= '1';
            ack_sreg(0) <= '1';
          end case;
        end if;
      end if;
    end if;
  end process;
  
  
-- Drive the data output bus
  wb_data_o <= rddata_reg;
-- TX DMA start
  process (bus_clock_int, rst_n_i)
  begin
    if (rst_n_i = '0') then 
      minic_mcr_tx_start_dly0 <= '0';
      minic_mcr_tx_start_o <= '0';
    elsif rising_edge(bus_clock_int) then
      minic_mcr_tx_start_dly0 <= minic_mcr_tx_start_int;
      minic_mcr_tx_start_o <= minic_mcr_tx_start_int and (not minic_mcr_tx_start_dly0);
    end if;
  end process;
  
  
-- TX DMA idle
-- TX DMA error
-- RX DMA ready
-- RX DMA buffer full
-- RX DMA enable
  minic_mcr_rx_en_o <= minic_mcr_rx_en_int;
-- TX DMA buffer address
  minic_tx_addr_o <= wrdata_reg(23 downto 0);
-- RX DMA buffer address
  minic_rx_addr_o <= wrdata_reg(23 downto 0);
-- RX available words
  minic_rx_avail_o <= wrdata_reg(23 downto 0);
-- extra code for reg/fifo/mem: TX timestamp FIFO
  minic_tsfifo_in_int(31 downto 0) <= minic_tsfifo_tsval_i;
  minic_tsfifo_in_int(36 downto 32) <= minic_tsfifo_pid_i;
  minic_tsfifo_in_int(52 downto 37) <= minic_tsfifo_fid_i;
  minic_tsfifo_INST : wbgen2_fifo_sync
    generic map (
      g_size               => 16,
      g_width              => 53,
      g_usedw_size         => 4
    )
    port map (
      wr_req_i             => minic_tsfifo_wr_req_i,
      wr_full_o            => minic_tsfifo_wr_full_o,
      wr_empty_o           => minic_tsfifo_wr_empty_o,
      rd_full_o            => open,
      rd_empty_o           => minic_tsfifo_empty_int,
      rd_usedw_o           => open,
      rd_req_i             => minic_tsfifo_rdreq_int,
      clk_i                => bus_clock_int,
      wr_data_i            => minic_tsfifo_in_int,
      rd_data_o            => minic_tsfifo_out_int
    );
  
-- interrupt counter
-- status of wb_irq_o line
-- extra code for reg/fifo/mem: Interrupt disable register
  eic_idr_int(2 downto 0) <= wrdata_reg(2 downto 0);
-- extra code for reg/fifo/mem: Interrupt enable register
  eic_ier_int(2 downto 0) <= wrdata_reg(2 downto 0);
-- extra code for reg/fifo/mem: Interrupt status register
  eic_isr_clear_int(2 downto 0) <= wrdata_reg(2 downto 0);
-- extra code for reg/fifo/mem: IRQ_CONTROLLER
  eic_irq_controller_inst : wbgen2_eic
    generic map (
      g_num_interrupts     => 3,
      g_irq00_mode         => 3,
      g_irq01_mode         => 3,
      g_irq02_mode         => 3,
      g_irq03_mode         => 0,
      g_irq04_mode         => 0,
      g_irq05_mode         => 0,
      g_irq06_mode         => 0,
      g_irq07_mode         => 0,
      g_irq08_mode         => 0,
      g_irq09_mode         => 0,
      g_irq0a_mode         => 0,
      g_irq0b_mode         => 0,
      g_irq0c_mode         => 0,
      g_irq0d_mode         => 0,
      g_irq0e_mode         => 0,
      g_irq0f_mode         => 0,
      g_irq10_mode         => 0,
      g_irq11_mode         => 0,
      g_irq12_mode         => 0,
      g_irq13_mode         => 0,
      g_irq14_mode         => 0,
      g_irq15_mode         => 0,
      g_irq16_mode         => 0,
      g_irq17_mode         => 0,
      g_irq18_mode         => 0,
      g_irq19_mode         => 0,
      g_irq1a_mode         => 0,
      g_irq1b_mode         => 0,
      g_irq1c_mode         => 0,
      g_irq1d_mode         => 0,
      g_irq1e_mode         => 0,
      g_irq1f_mode         => 0
    )
    port map (
      clk_i                => bus_clock_int,
      rst_n_i              => rst_n_i,
      irq_i                => irq_inputs_vector_int,
      irq_ack_o            => eic_irq_ack_int,
      reg_imr_o            => eic_imr_int,
      reg_ier_i            => eic_ier_int,
      reg_ier_wr_stb_i     => eic_ier_write_int,
      reg_idr_i            => eic_idr_int,
      reg_idr_wr_stb_i     => eic_idr_write_int,
      reg_isr_o            => eic_isr_status_int,
      reg_isr_i            => eic_isr_clear_int,
      reg_isr_wr_stb_i     => eic_isr_write_int,
      wb_irq_o             => wb_irq_o
    );
  
  irq_inputs_vector_int(0) <= irq_tx_i;
  irq_tx_ack_o <= eic_irq_ack_int(0);
  irq_tx_mask_o <= eic_imr_int(0);
  irq_inputs_vector_int(1) <= irq_rx_i;
  irq_rx_ack_o <= eic_irq_ack_int(1);
  irq_inputs_vector_int(2) <= irq_txts_i;
-- extra code for reg/fifo/mem: FIFO 'TX timestamp FIFO' data output register 0
  process (bus_clock_int, rst_n_i)
  begin
    if (rst_n_i = '0') then 
      minic_tsfifo_rdreq_int_d0 <= '0';
    elsif rising_edge(bus_clock_int) then
      minic_tsfifo_rdreq_int_d0 <= minic_tsfifo_rdreq_int;
    end if;
  end process;
  
  
-- extra code for reg/fifo/mem: FIFO 'TX timestamp FIFO' data output register 1
  rwaddr_reg <= wb_addr_i;
-- ACK signal generation. Just pass the LSB of ACK counter.
  wb_ack_o <= ack_sreg(0);
end syn;
