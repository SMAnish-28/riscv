// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
// Date        : Thu Jan 29 20:07:48 2026
// Host        : HP-Laptop-14s-er0xx running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ dpram_2048x32_sim_netlist.v
// Design      : dpram_2048x32
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "dpram_2048x32,blk_mem_gen_v8_4_9,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_9,Vivado 2024.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (clka,
    ena,
    wea,
    addra,
    dina,
    clkb,
    enb,
    addrb,
    doutb);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_mode = "slave BRAM_PORTA" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_ADDRESS_MODE BYTE_ADDRESS, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [10:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [31:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_mode = "slave BRAM_PORTB" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_ADDRESS_MODE BYTE_ADDRESS, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [10:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [31:0]doutb;

  wire [10:0]addra;
  wire [10:0]addrb;
  wire clka;
  wire clkb;
  wire [31:0]dina;
  wire [31:0]doutb;
  wire ena;
  wire enb;
  wire [0:0]wea;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [31:0]NLW_U0_douta_UNCONNECTED;
  wire [10:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [10:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "11" *) 
  (* C_ADDRB_WIDTH = "11" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "2" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     9.549 mW" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "1" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "1" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "dpram_2048x32.mem" *) 
  (* C_INIT_FILE_NAME = "dpram_2048x32.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "1" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "2048" *) 
  (* C_READ_DEPTH_B = "2048" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "32" *) 
  (* C_READ_WIDTH_B = "32" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "1" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "2048" *) 
  (* C_WRITE_DEPTH_B = "2048" *) 
  (* C_WRITE_MODE_A = "NO_CHANGE" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "32" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_9 U0
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(clkb),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(NLW_U0_douta_UNCONNECTED[31:0]),
        .doutb(doutb),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(enb),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[10:0]),
        .regcea(1'b1),
        .regceb(1'b1),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[10:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[31:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2024.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
FPXllyX2NFs/RMngGqZy2bLYbZr92CdofeZrJOHklWXExpaPgHNYp2Lzm4MnflbnrfSkCmLwwKT5
zfRgEip7FKQ5Zhb73p0MAIADixBZ/ZRt4hQkJL0T9brm0waLHfanjnov2aCX6jN3LbQc3ujmDga6
Dd73k78u4xjRTDv1/P4=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
kr7VKKvChFoiyRCReag+OvU3jnmG9pN0cv+BxhNmMKLthg/ksgNZyU3L+fQ7cmIQELtlUjwjkBAP
Jjq5RsCnHbJxj+Ys1GNhriiBsxLqxWCP8onhAVvgZN2xZFOih0UWpqlU8NVP8Eww1ohvkDgxTstC
3kDmYehxIUJjqCC/mgRZmuezqugrFdubYmBoz16tUvD17iA5qqCIMS9xSIXYp2LBNekmWEwrVqzu
R4koEo4UlXl/CEw0XY3QvMoHnlXgu6N/6sc+nxZtKSwjiMVvGnZE9UVvJPAC3Hn3zKFGlK53mmGO
Tj0dWzhwX0ahSYzkyJC/HLdbGZmriL2UNvDyFw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
CaLc9FGt3AdRHfNtGAsGFY/QEvHY1Vv4TvvgCDsdDMqiuDeLizFJDJeskBWjeKDoE2cufK8TxiBq
mySRQNJoeOKnxTiDdf+Rx6m0iR6h/YeswegYwgghpM5KVrl6mSwF3+4yEovPM7a+9ArDQ5vl+WT8
SilNGzyW0KnTwe7+szs=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
cEnudSW1X71p0Xuq6jrXOxHnBku87IA0RA3zKqmeZHZM0r+9rEm5MSzX8RecnQ994yiqeyxbIH2l
fGEzUzr0ZzryS3fkf2LnJuB39f2YARW9eVCSiaeWaraZuY1l89T+h3vgdlurS/1LIraYLS1MyOXa
6F1LAcQp3W4OO4ctc3q1FRMZGldRS1biMsKwJ8Lxj8NEOm67UfgFrJNQAxbVXEfbWRWhKtwNxcTB
JbgC8j4EHkIA46mzoHloeBAL6KieplQUBjKXSSTb66rxglbFhWLy+mirROHcocu9J4ZbvTRYZEww
4lso1lqAllVLAoKYqa3WImZuSRoTbGDngBt9Lg==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
rOyI+x4PlmKcVSFoN3oKgSYpVlmYxc194Ej04il/YmBg10xopy4zmtu5sdCP/uGSNYcNGWeAiw01
mNf98KyNgTUFXruHCA38qjhhEIvl4vfWWn3W3mFRxrIuwmnreT6qTvgMaxIkCdVBDP7Iy7O6WmCf
3Va5X5hnCHhtXgX5UYniBHiLjmupv63B8XMAYDH2n6mQ3H0DF7mtb7psBafd0Z6+IWUbmzwMtKrf
ZrRJBGAhNT0i1KrEjEh/rWjN7Z7N32zQ+Pl1kc5gYCQIX5McfdTdqSaRVXZ/HF90ymS7/8d5LDyj
Er+ORdcjnOn6oAyY4PuUUl4OYUHv5k+RglTe5Q==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2023_11", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
bJa7kPSpDipzoJoQu1APEjc8vFLqBfQZK/grZvWijD7/FgMTerFCWLUY6n8DWeGdvjXvTeyrqCHE
2rP/H57wUqPC8tIJlGm6ZYQGjZ3TgYqLrJshDE5zYMTO//q0vuSraWvZP7A7SLuW6y7tFE/nplpx
L8gbYORx6j70okGUwnamCMS9yhFr7Z2QTJne1k4GNFGvy66URk3k5cBPl5j4/1yc4xGV+aWYl6L8
q8RorRU/CltObHKrji/jdiY1WtdGrkpRyCEFc+XNPazL9xSLLu5bz6XlvKwoks+8a5KYT/VFUovM
JbM0bpAXM8Z7rGaPuXjqXtZBg5praTZLu/WNcA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
PYKBDinOGc/kIVdFzXrz2wA4/QNFxLDrQfTWfR5TjYE6bm49vrZi0bawcr9HXp4OP1+XxPLB3oCP
oV5e/rYeDln531ebt8yEg27XCoSHEX4FU8oG8aBJ8fqgWayOnAMJt025WodOxuZXbhT1zPo7J3uh
6iO9Mv7RtYE2fZ1W+G8oN//FTOEJYPWlKYnt0cDeZrN3I4rHHptZHuu7l8T+df0PYea3x6U3Mvkl
ojZ+TwQtdu0NuYY5j3QNgx3+W2XYq1M773FAnEz/deW54EjE+jf1jjrBk2pl8SYxeKuutS15oPVF
eHdqXYVcJxoUY5JH8z04lITKEnZ4oq6sYS6dog==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
tl+2vFCWZ583gQGsVC7oopz2NCKBiJ9uOHYBGzJZheOHJMqI/ehNvo25l710eBx00tztXzM30AH6
ZhAJg+kJwE2jO0MV5fmG5dnwXmLqoGEJMBs7xwWxvYK7w/0z9M0AJKD7HnuC+IiLhNU/fIxyuE+I
+vWqp//RcfY0tMMp2I2J1yEW6GUahS1ve/4JchssZ7Xu7VthoSDWXMQWATbvsUsDzeSo2+Ruz8Kq
Dc05HqEU8NgBxDPPEKLCcdKLp4byglwj7iCAtCjsPy8P18qjgb2sycFjNgmaiNMMB51WqeD+hneG
hLOue9bqVdEojkrb3q4WbsGZKz0bAGsryxslOlYHP1b8vey3yI2ixA80wyERe8d3GRIeZiSxGykH
qWxsE6x/iyi8QRb5mXZPMApA+Fln8tYmn7+1rFCm8gF4gJWhr1PsSJqTi658symGrzT0Ghjvf2QL
SvvoaeNdy0pOsWs7jLBFndd4GiFA+9K6Y33sziLToU9EvvFokENIslod

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
oYiCujFRj1F3wKsGZlHR9niEtR9MLXEVAVfy+f/3xrmpW6Ye5a+fBCvm4TH+iRQefGHNdMPnzTNW
K/pEPAS9uMJjOdFiu+APT+LYrSRnEg4W0dX5buSDGM6LBWAuMseoTMjbJJoYDGLRckJgW43E30mX
ej4823nkbfwc+Ecbrup825qLyv8RTQLNHafvJA5lSapdqXwnlOIYRmcHn+sfAh5pGv9kW9aokcdh
ObR2XYxX99rYloyvz3x0pmjxD5ILW4SQMB1IUEuuyqX6eb5IQ+kZ41hjvsHIuQH29vzpCfV9Jqha
WC5yxxK1R+cleZSKD1H1gVzbTei8uFs/91Bgeg==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
urNc+S8AFPj+GVFdqJE5V7P8O6QI6MA3nkwYb8NKbYbVufnXKg6voJIRYYeYr7EOa8mrqirozWbY
Lln9SLWnkaAy2LvL/N6WahoQdCt++4RH+xe768XvSrVUFPrIwZRixqMLurc/tPov4i5P/ukZKl18
ZPZvXRzUNlvCZnMPcF+5QCQihqPbjcZ0YyGgWgX/ipTGG3sNqmylGN7qLa4Rgqu/mB5a2xVyu5Wc
911+/X3VVFx697WVaP5V0SbOzYN8R8+8B8kdznwixMA+f4lSbBXyRysVOSzYjo8bKEMqyKMVBQn9
xDmEuV0DvVWXdO7VPvWA1LuJFwS07OxeI2GCcQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
QcP7fsLZxaDrG29e9HQeXfu2TsKsdyW7Yc1vWct6lbmDEfXkWMU1fFWSPIjPzRc9UOnfEu0bRn+B
D+8MWokqes3WF7txljBmgUPiNGZ8arUU6ENa/IY/Wv7iaB/ZKM5PtdnFAkjDIrYyKFCTz/U6Yzwi
hBGGarK/wYQOLzeeKRewiPTiNUL7tztWuMZ1t1msxD951EeKrwjrjcXIIuf/TzrOGUOlWgjHlnrl
4Q/lfMAnRLBNTSWG+5wWewCE8jK2X/gJ5AV4p3x1WP3+JglbxpP39l3pzedXqciZPbuz2XlFnRPV
KByaUaAShzJ56p8+0HjWebibqQdieGNPiPWW0Q==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 47360)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
