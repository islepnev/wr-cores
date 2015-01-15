`define ADDR_MDIO_MCR                  7'h0
`define MDIO_MCR_RESV_OFFSET 0
`define MDIO_MCR_RESV 32'h0000001f
`define MDIO_MCR_UNI_EN_OFFSET 5
`define MDIO_MCR_UNI_EN 32'h00000020
`define MDIO_MCR_SPEED1000_OFFSET 6
`define MDIO_MCR_SPEED1000 32'h00000040
`define MDIO_MCR_CTST_OFFSET 7
`define MDIO_MCR_CTST 32'h00000080
`define MDIO_MCR_FULLDPLX_OFFSET 8
`define MDIO_MCR_FULLDPLX 32'h00000100
`define MDIO_MCR_ANRESTART_OFFSET 9
`define MDIO_MCR_ANRESTART 32'h00000200
`define MDIO_MCR_ISOLATE_OFFSET 10
`define MDIO_MCR_ISOLATE 32'h00000400
`define MDIO_MCR_PDOWN_OFFSET 11
`define MDIO_MCR_PDOWN 32'h00000800
`define MDIO_MCR_ANENABLE_OFFSET 12
`define MDIO_MCR_ANENABLE 32'h00001000
`define MDIO_MCR_SPEED100_OFFSET 13
`define MDIO_MCR_SPEED100 32'h00002000
`define MDIO_MCR_RESV_OFFSET 14
`define MDIO_MCR_RESV 32'h00004000
`define MDIO_MCR_RESET_OFFSET 15
`define MDIO_MCR_RESET 32'h00008000
`define MDIO_MCR_LOOPBACK_OFFSET 16
`define MDIO_MCR_LOOPBACK 32'h00070000
`define MDIO_MCR_SFP_TX_FAULT_OFFSET 19
`define MDIO_MCR_SFP_TX_FAULT 32'h00080000
`define MDIO_MCR_SFP_LOSS_OFFSET 20
`define MDIO_MCR_SFP_LOSS 32'h00100000
`define MDIO_MCR_SFP_TX_DISABLE_OFFSET 21
`define MDIO_MCR_SFP_TX_DISABLE 32'h00200000
`define MDIO_MCR_TX_PRBS_SEL_OFFSET 22
`define MDIO_MCR_TX_PRBS_SEL 32'h01c00000
`define ADDR_MDIO_MSR                  7'h4
`define MDIO_MSR_ERCAP_OFFSET 0
`define MDIO_MSR_ERCAP 32'h00000001
`define MDIO_MSR_JCD_OFFSET 1
`define MDIO_MSR_JCD 32'h00000002
`define MDIO_MSR_LSTATUS_OFFSET 2
`define MDIO_MSR_LSTATUS 32'h00000004
`define MDIO_MSR_ANEGCAPABLE_OFFSET 3
`define MDIO_MSR_ANEGCAPABLE 32'h00000008
`define MDIO_MSR_RFAULT_OFFSET 4
`define MDIO_MSR_RFAULT 32'h00000010
`define MDIO_MSR_ANEGCOMPLETE_OFFSET 5
`define MDIO_MSR_ANEGCOMPLETE 32'h00000020
`define MDIO_MSR_MFSUPPRESS_OFFSET 6
`define MDIO_MSR_MFSUPPRESS 32'h00000040
`define MDIO_MSR_UNIDIRABLE_OFFSET 7
`define MDIO_MSR_UNIDIRABLE 32'h00000080
`define MDIO_MSR_ESTATEN_OFFSET 8
`define MDIO_MSR_ESTATEN 32'h00000100
`define MDIO_MSR_100HALF2_OFFSET 9
`define MDIO_MSR_100HALF2 32'h00000200
`define MDIO_MSR_100FULL2_OFFSET 10
`define MDIO_MSR_100FULL2 32'h00000400
`define MDIO_MSR_10HALF_OFFSET 11
`define MDIO_MSR_10HALF 32'h00000800
`define MDIO_MSR_10FULL_OFFSET 12
`define MDIO_MSR_10FULL 32'h00001000
`define MDIO_MSR_100HALF_OFFSET 13
`define MDIO_MSR_100HALF 32'h00002000
`define MDIO_MSR_100FULL_OFFSET 14
`define MDIO_MSR_100FULL 32'h00004000
`define MDIO_MSR_100BASE4_OFFSET 15
`define MDIO_MSR_100BASE4 32'h00008000
`define ADDR_MDIO_PHYSID1              7'h8
`define MDIO_PHYSID1_OUI_OFFSET 0
`define MDIO_PHYSID1_OUI 32'h0000ffff
`define ADDR_MDIO_PHYSID2              7'hc
`define MDIO_PHYSID2_REV_NUM_OFFSET 0
`define MDIO_PHYSID2_REV_NUM 32'h0000000f
`define MDIO_PHYSID2_MMNUM_OFFSET 4
`define MDIO_PHYSID2_MMNUM 32'h000003f0
`define MDIO_PHYSID2_OUI_OFFSET 10
`define MDIO_PHYSID2_OUI 32'h0000fc00
`define ADDR_MDIO_ADVERTISE            7'h10
`define MDIO_ADVERTISE_RSVD3_OFFSET 0
`define MDIO_ADVERTISE_RSVD3 32'h0000001f
`define MDIO_ADVERTISE_FULL_OFFSET 5
`define MDIO_ADVERTISE_FULL 32'h00000020
`define MDIO_ADVERTISE_HALF_OFFSET 6
`define MDIO_ADVERTISE_HALF 32'h00000040
`define MDIO_ADVERTISE_PAUSE_OFFSET 7
`define MDIO_ADVERTISE_PAUSE 32'h00000180
`define MDIO_ADVERTISE_RSVD2_OFFSET 9
`define MDIO_ADVERTISE_RSVD2 32'h00000e00
`define MDIO_ADVERTISE_RFAULT_OFFSET 12
`define MDIO_ADVERTISE_RFAULT 32'h00003000
`define MDIO_ADVERTISE_RSVD1_OFFSET 14
`define MDIO_ADVERTISE_RSVD1 32'h00004000
`define MDIO_ADVERTISE_NPAGE_OFFSET 15
`define MDIO_ADVERTISE_NPAGE 32'h00008000
`define ADDR_MDIO_LPA                  7'h14
`define MDIO_LPA_RSVD3_OFFSET 0
`define MDIO_LPA_RSVD3 32'h0000001f
`define MDIO_LPA_FULL_OFFSET 5
`define MDIO_LPA_FULL 32'h00000020
`define MDIO_LPA_HALF_OFFSET 6
`define MDIO_LPA_HALF 32'h00000040
`define MDIO_LPA_PAUSE_OFFSET 7
`define MDIO_LPA_PAUSE 32'h00000180
`define MDIO_LPA_RSVD2_OFFSET 9
`define MDIO_LPA_RSVD2 32'h00000e00
`define MDIO_LPA_RFAULT_OFFSET 12
`define MDIO_LPA_RFAULT 32'h00003000
`define MDIO_LPA_LPACK_OFFSET 14
`define MDIO_LPA_LPACK 32'h00004000
`define MDIO_LPA_NPAGE_OFFSET 15
`define MDIO_LPA_NPAGE 32'h00008000
`define ADDR_MDIO_EXPANSION            7'h18
`define MDIO_EXPANSION_RSVD1_OFFSET 0
`define MDIO_EXPANSION_RSVD1 32'h00000001
`define MDIO_EXPANSION_LWCP_OFFSET 1
`define MDIO_EXPANSION_LWCP 32'h00000002
`define MDIO_EXPANSION_ENABLENPAGE_OFFSET 2
`define MDIO_EXPANSION_ENABLENPAGE 32'h00000004
`define MDIO_EXPANSION_RSVD2_OFFSET 3
`define MDIO_EXPANSION_RSVD2 32'h0000fff8
`define ADDR_MDIO_ESTATUS              7'h3c
`define MDIO_ESTATUS_RSVD1_OFFSET 0
`define MDIO_ESTATUS_RSVD1 32'h00000fff
`define MDIO_ESTATUS_1000_THALF_OFFSET 12
`define MDIO_ESTATUS_1000_THALF 32'h00001000
`define MDIO_ESTATUS_1000_TFULL_OFFSET 13
`define MDIO_ESTATUS_1000_TFULL 32'h00002000
`define MDIO_ESTATUS_1000_XHALF_OFFSET 14
`define MDIO_ESTATUS_1000_XHALF 32'h00004000
`define MDIO_ESTATUS_1000_XFULL_OFFSET 15
`define MDIO_ESTATUS_1000_XFULL 32'h00008000
`define ADDR_MDIO_WR_SPEC              7'h40
`define MDIO_WR_SPEC_TX_CAL_OFFSET 0
`define MDIO_WR_SPEC_TX_CAL 32'h00000001
`define MDIO_WR_SPEC_RX_CAL_STAT_OFFSET 1
`define MDIO_WR_SPEC_RX_CAL_STAT 32'h00000002
`define MDIO_WR_SPEC_CAL_CRST_OFFSET 2
`define MDIO_WR_SPEC_CAL_CRST 32'h00000004
`define MDIO_WR_SPEC_BSLIDE_OFFSET 4
`define MDIO_WR_SPEC_BSLIDE 32'h000001f0
