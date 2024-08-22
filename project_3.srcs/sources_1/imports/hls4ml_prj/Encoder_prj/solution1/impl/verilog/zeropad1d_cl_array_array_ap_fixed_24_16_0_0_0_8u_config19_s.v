// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and OpenCL
// Version: 2020.1
// Copyright (C) 1986-2020 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module zeropad1d_cl_array_array_ap_fixed_24_16_0_0_0_8u_config19_s (
        ap_clk,
        ap_rst,
        ap_start,
        start_full_n,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        start_out,
        start_write,
        data_V_data_0_V_dout,
        data_V_data_0_V_empty_n,
        data_V_data_0_V_read,
        data_V_data_1_V_dout,
        data_V_data_1_V_empty_n,
        data_V_data_1_V_read,
        data_V_data_2_V_dout,
        data_V_data_2_V_empty_n,
        data_V_data_2_V_read,
        data_V_data_3_V_dout,
        data_V_data_3_V_empty_n,
        data_V_data_3_V_read,
        data_V_data_4_V_dout,
        data_V_data_4_V_empty_n,
        data_V_data_4_V_read,
        data_V_data_5_V_dout,
        data_V_data_5_V_empty_n,
        data_V_data_5_V_read,
        data_V_data_6_V_dout,
        data_V_data_6_V_empty_n,
        data_V_data_6_V_read,
        data_V_data_7_V_dout,
        data_V_data_7_V_empty_n,
        data_V_data_7_V_read,
        res_V_data_0_V_din,
        res_V_data_0_V_full_n,
        res_V_data_0_V_write,
        res_V_data_1_V_din,
        res_V_data_1_V_full_n,
        res_V_data_1_V_write,
        res_V_data_2_V_din,
        res_V_data_2_V_full_n,
        res_V_data_2_V_write,
        res_V_data_3_V_din,
        res_V_data_3_V_full_n,
        res_V_data_3_V_write,
        res_V_data_4_V_din,
        res_V_data_4_V_full_n,
        res_V_data_4_V_write,
        res_V_data_5_V_din,
        res_V_data_5_V_full_n,
        res_V_data_5_V_write,
        res_V_data_6_V_din,
        res_V_data_6_V_full_n,
        res_V_data_6_V_write,
        res_V_data_7_V_din,
        res_V_data_7_V_full_n,
        res_V_data_7_V_write
);

parameter    ap_ST_fsm_state1 = 4'd1;
parameter    ap_ST_fsm_state2 = 4'd2;
parameter    ap_ST_fsm_state3 = 4'd4;
parameter    ap_ST_fsm_state4 = 4'd8;

input   ap_clk;
input   ap_rst;
input   ap_start;
input   start_full_n;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
output   start_out;
output   start_write;
input  [23:0] data_V_data_0_V_dout;
input   data_V_data_0_V_empty_n;
output   data_V_data_0_V_read;
input  [23:0] data_V_data_1_V_dout;
input   data_V_data_1_V_empty_n;
output   data_V_data_1_V_read;
input  [23:0] data_V_data_2_V_dout;
input   data_V_data_2_V_empty_n;
output   data_V_data_2_V_read;
input  [23:0] data_V_data_3_V_dout;
input   data_V_data_3_V_empty_n;
output   data_V_data_3_V_read;
input  [23:0] data_V_data_4_V_dout;
input   data_V_data_4_V_empty_n;
output   data_V_data_4_V_read;
input  [23:0] data_V_data_5_V_dout;
input   data_V_data_5_V_empty_n;
output   data_V_data_5_V_read;
input  [23:0] data_V_data_6_V_dout;
input   data_V_data_6_V_empty_n;
output   data_V_data_6_V_read;
input  [23:0] data_V_data_7_V_dout;
input   data_V_data_7_V_empty_n;
output   data_V_data_7_V_read;
output  [23:0] res_V_data_0_V_din;
input   res_V_data_0_V_full_n;
output   res_V_data_0_V_write;
output  [23:0] res_V_data_1_V_din;
input   res_V_data_1_V_full_n;
output   res_V_data_1_V_write;
output  [23:0] res_V_data_2_V_din;
input   res_V_data_2_V_full_n;
output   res_V_data_2_V_write;
output  [23:0] res_V_data_3_V_din;
input   res_V_data_3_V_full_n;
output   res_V_data_3_V_write;
output  [23:0] res_V_data_4_V_din;
input   res_V_data_4_V_full_n;
output   res_V_data_4_V_write;
output  [23:0] res_V_data_5_V_din;
input   res_V_data_5_V_full_n;
output   res_V_data_5_V_write;
output  [23:0] res_V_data_6_V_din;
input   res_V_data_6_V_full_n;
output   res_V_data_6_V_write;
output  [23:0] res_V_data_7_V_din;
input   res_V_data_7_V_full_n;
output   res_V_data_7_V_write;

reg ap_done;
reg ap_idle;
reg start_write;
reg data_V_data_0_V_read;
reg data_V_data_1_V_read;
reg data_V_data_2_V_read;
reg data_V_data_3_V_read;
reg data_V_data_4_V_read;
reg data_V_data_5_V_read;
reg data_V_data_6_V_read;
reg data_V_data_7_V_read;
reg[23:0] res_V_data_0_V_din;
reg res_V_data_0_V_write;
reg[23:0] res_V_data_1_V_din;
reg res_V_data_1_V_write;
reg[23:0] res_V_data_2_V_din;
reg res_V_data_2_V_write;
reg[23:0] res_V_data_3_V_din;
reg res_V_data_3_V_write;
reg[23:0] res_V_data_4_V_din;
reg res_V_data_4_V_write;
reg[23:0] res_V_data_5_V_din;
reg res_V_data_5_V_write;
reg[23:0] res_V_data_6_V_din;
reg res_V_data_6_V_write;
reg[23:0] res_V_data_7_V_din;
reg res_V_data_7_V_write;

reg    real_start;
reg    start_once_reg;
reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [3:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    internal_ap_ready;
reg    data_V_data_0_V_blk_n;
wire    ap_CS_fsm_state3;
wire   [0:0] icmp_ln37_fu_367_p2;
reg    data_V_data_1_V_blk_n;
reg    data_V_data_2_V_blk_n;
reg    data_V_data_3_V_blk_n;
reg    data_V_data_4_V_blk_n;
reg    data_V_data_5_V_blk_n;
reg    data_V_data_6_V_blk_n;
reg    data_V_data_7_V_blk_n;
reg    res_V_data_0_V_blk_n;
wire    ap_CS_fsm_state2;
wire   [0:0] icmp_ln32_fu_355_p2;
wire    ap_CS_fsm_state4;
wire   [0:0] icmp_ln42_fu_419_p2;
reg    res_V_data_1_V_blk_n;
reg    res_V_data_2_V_blk_n;
reg    res_V_data_3_V_blk_n;
reg    res_V_data_4_V_blk_n;
reg    res_V_data_5_V_blk_n;
reg    res_V_data_6_V_blk_n;
reg    res_V_data_7_V_blk_n;
wire   [1:0] i_fu_361_p2;
wire    io_acc_block_signal_op28;
reg    ap_block_state2;
wire   [6:0] i_2_fu_373_p2;
wire    io_acc_block_signal_op37;
wire    io_acc_block_signal_op46;
reg    ap_block_state3;
wire   [1:0] i_3_fu_425_p2;
wire    io_acc_block_signal_op55;
reg    ap_block_state4;
reg   [1:0] i_0_reg_322;
reg    ap_block_state1;
reg   [6:0] i1_0_reg_333;
reg   [1:0] i2_0_reg_344;
reg   [3:0] ap_NS_fsm;

// power-on initialization
initial begin
#0 start_once_reg = 1'b0;
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 4'd1;
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if ((~((io_acc_block_signal_op55 == 1'b0) & (icmp_ln42_fu_419_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state4) & (icmp_ln42_fu_419_p2 == 1'd1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        start_once_reg <= 1'b0;
    end else begin
        if (((internal_ap_ready == 1'b0) & (real_start == 1'b1))) begin
            start_once_reg <= 1'b1;
        end else if ((internal_ap_ready == 1'b1)) begin
            start_once_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((~((io_acc_block_signal_op28 == 1'b0) & (icmp_ln32_fu_355_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state2) & (icmp_ln32_fu_355_p2 == 1'd1))) begin
        i1_0_reg_333 <= 7'd0;
    end else if ((~(((io_acc_block_signal_op46 == 1'b0) & (icmp_ln37_fu_367_p2 == 1'd0)) | ((io_acc_block_signal_op37 == 1'b0) & (icmp_ln37_fu_367_p2 == 1'd0))) & (1'b1 == ap_CS_fsm_state3) & (icmp_ln37_fu_367_p2 == 1'd0))) begin
        i1_0_reg_333 <= i_2_fu_373_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((~(((io_acc_block_signal_op46 == 1'b0) & (icmp_ln37_fu_367_p2 == 1'd0)) | ((io_acc_block_signal_op37 == 1'b0) & (icmp_ln37_fu_367_p2 == 1'd0))) & (1'b1 == ap_CS_fsm_state3) & (icmp_ln37_fu_367_p2 == 1'd1))) begin
        i2_0_reg_344 <= 2'd0;
    end else if ((~((io_acc_block_signal_op55 == 1'b0) & (icmp_ln42_fu_419_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state4) & (icmp_ln42_fu_419_p2 == 1'd0))) begin
        i2_0_reg_344 <= i_3_fu_425_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((~((io_acc_block_signal_op28 == 1'b0) & (icmp_ln32_fu_355_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state2) & (icmp_ln32_fu_355_p2 == 1'd0))) begin
        i_0_reg_322 <= i_fu_361_p2;
    end else if ((~((real_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        i_0_reg_322 <= 2'd0;
    end
end

always @ (*) begin
    if ((~((io_acc_block_signal_op55 == 1'b0) & (icmp_ln42_fu_419_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state4) & (icmp_ln42_fu_419_p2 == 1'd1))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = ap_done_reg;
    end
end

always @ (*) begin
    if (((real_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) & (icmp_ln37_fu_367_p2 == 1'd0))) begin
        data_V_data_0_V_blk_n = data_V_data_0_V_empty_n;
    end else begin
        data_V_data_0_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~(((io_acc_block_signal_op46 == 1'b0) & (icmp_ln37_fu_367_p2 == 1'd0)) | ((io_acc_block_signal_op37 == 1'b0) & (icmp_ln37_fu_367_p2 == 1'd0))) & (1'b1 == ap_CS_fsm_state3) & (icmp_ln37_fu_367_p2 == 1'd0))) begin
        data_V_data_0_V_read = 1'b1;
    end else begin
        data_V_data_0_V_read = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) & (icmp_ln37_fu_367_p2 == 1'd0))) begin
        data_V_data_1_V_blk_n = data_V_data_1_V_empty_n;
    end else begin
        data_V_data_1_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~(((io_acc_block_signal_op46 == 1'b0) & (icmp_ln37_fu_367_p2 == 1'd0)) | ((io_acc_block_signal_op37 == 1'b0) & (icmp_ln37_fu_367_p2 == 1'd0))) & (1'b1 == ap_CS_fsm_state3) & (icmp_ln37_fu_367_p2 == 1'd0))) begin
        data_V_data_1_V_read = 1'b1;
    end else begin
        data_V_data_1_V_read = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) & (icmp_ln37_fu_367_p2 == 1'd0))) begin
        data_V_data_2_V_blk_n = data_V_data_2_V_empty_n;
    end else begin
        data_V_data_2_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~(((io_acc_block_signal_op46 == 1'b0) & (icmp_ln37_fu_367_p2 == 1'd0)) | ((io_acc_block_signal_op37 == 1'b0) & (icmp_ln37_fu_367_p2 == 1'd0))) & (1'b1 == ap_CS_fsm_state3) & (icmp_ln37_fu_367_p2 == 1'd0))) begin
        data_V_data_2_V_read = 1'b1;
    end else begin
        data_V_data_2_V_read = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) & (icmp_ln37_fu_367_p2 == 1'd0))) begin
        data_V_data_3_V_blk_n = data_V_data_3_V_empty_n;
    end else begin
        data_V_data_3_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~(((io_acc_block_signal_op46 == 1'b0) & (icmp_ln37_fu_367_p2 == 1'd0)) | ((io_acc_block_signal_op37 == 1'b0) & (icmp_ln37_fu_367_p2 == 1'd0))) & (1'b1 == ap_CS_fsm_state3) & (icmp_ln37_fu_367_p2 == 1'd0))) begin
        data_V_data_3_V_read = 1'b1;
    end else begin
        data_V_data_3_V_read = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) & (icmp_ln37_fu_367_p2 == 1'd0))) begin
        data_V_data_4_V_blk_n = data_V_data_4_V_empty_n;
    end else begin
        data_V_data_4_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~(((io_acc_block_signal_op46 == 1'b0) & (icmp_ln37_fu_367_p2 == 1'd0)) | ((io_acc_block_signal_op37 == 1'b0) & (icmp_ln37_fu_367_p2 == 1'd0))) & (1'b1 == ap_CS_fsm_state3) & (icmp_ln37_fu_367_p2 == 1'd0))) begin
        data_V_data_4_V_read = 1'b1;
    end else begin
        data_V_data_4_V_read = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) & (icmp_ln37_fu_367_p2 == 1'd0))) begin
        data_V_data_5_V_blk_n = data_V_data_5_V_empty_n;
    end else begin
        data_V_data_5_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~(((io_acc_block_signal_op46 == 1'b0) & (icmp_ln37_fu_367_p2 == 1'd0)) | ((io_acc_block_signal_op37 == 1'b0) & (icmp_ln37_fu_367_p2 == 1'd0))) & (1'b1 == ap_CS_fsm_state3) & (icmp_ln37_fu_367_p2 == 1'd0))) begin
        data_V_data_5_V_read = 1'b1;
    end else begin
        data_V_data_5_V_read = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) & (icmp_ln37_fu_367_p2 == 1'd0))) begin
        data_V_data_6_V_blk_n = data_V_data_6_V_empty_n;
    end else begin
        data_V_data_6_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~(((io_acc_block_signal_op46 == 1'b0) & (icmp_ln37_fu_367_p2 == 1'd0)) | ((io_acc_block_signal_op37 == 1'b0) & (icmp_ln37_fu_367_p2 == 1'd0))) & (1'b1 == ap_CS_fsm_state3) & (icmp_ln37_fu_367_p2 == 1'd0))) begin
        data_V_data_6_V_read = 1'b1;
    end else begin
        data_V_data_6_V_read = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) & (icmp_ln37_fu_367_p2 == 1'd0))) begin
        data_V_data_7_V_blk_n = data_V_data_7_V_empty_n;
    end else begin
        data_V_data_7_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~(((io_acc_block_signal_op46 == 1'b0) & (icmp_ln37_fu_367_p2 == 1'd0)) | ((io_acc_block_signal_op37 == 1'b0) & (icmp_ln37_fu_367_p2 == 1'd0))) & (1'b1 == ap_CS_fsm_state3) & (icmp_ln37_fu_367_p2 == 1'd0))) begin
        data_V_data_7_V_read = 1'b1;
    end else begin
        data_V_data_7_V_read = 1'b0;
    end
end

always @ (*) begin
    if ((~((io_acc_block_signal_op55 == 1'b0) & (icmp_ln42_fu_419_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state4) & (icmp_ln42_fu_419_p2 == 1'd1))) begin
        internal_ap_ready = 1'b1;
    end else begin
        internal_ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((start_once_reg == 1'b0) & (start_full_n == 1'b0))) begin
        real_start = 1'b0;
    end else begin
        real_start = ap_start;
    end
end

always @ (*) begin
    if ((((1'b1 == ap_CS_fsm_state4) & (icmp_ln42_fu_419_p2 == 1'd0)) | ((1'b1 == ap_CS_fsm_state2) & (icmp_ln32_fu_355_p2 == 1'd0)) | ((1'b1 == ap_CS_fsm_state3) & (icmp_ln37_fu_367_p2 == 1'd0)))) begin
        res_V_data_0_V_blk_n = res_V_data_0_V_full_n;
    end else begin
        res_V_data_0_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~(((io_acc_block_signal_op46 == 1'b0) & (icmp_ln37_fu_367_p2 == 1'd0)) | ((io_acc_block_signal_op37 == 1'b0) & (icmp_ln37_fu_367_p2 == 1'd0))) & (1'b1 == ap_CS_fsm_state3) & (icmp_ln37_fu_367_p2 == 1'd0))) begin
        res_V_data_0_V_din = data_V_data_0_V_dout;
    end else if (((~((io_acc_block_signal_op55 == 1'b0) & (icmp_ln42_fu_419_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state4) & (icmp_ln42_fu_419_p2 == 1'd0)) | (~((io_acc_block_signal_op28 == 1'b0) & (icmp_ln32_fu_355_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state2) & (icmp_ln32_fu_355_p2 == 1'd0)))) begin
        res_V_data_0_V_din = 24'd0;
    end else begin
        res_V_data_0_V_din = 'bx;
    end
end

always @ (*) begin
    if (((~((io_acc_block_signal_op55 == 1'b0) & (icmp_ln42_fu_419_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state4) & (icmp_ln42_fu_419_p2 == 1'd0)) | (~((io_acc_block_signal_op28 == 1'b0) & (icmp_ln32_fu_355_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state2) & (icmp_ln32_fu_355_p2 == 1'd0)) | (~(((io_acc_block_signal_op46 == 1'b0) & (icmp_ln37_fu_367_p2 == 1'd0)) | ((io_acc_block_signal_op37 == 1'b0) & (icmp_ln37_fu_367_p2 == 1'd0))) & (1'b1 == ap_CS_fsm_state3) & (icmp_ln37_fu_367_p2 == 1'd0)))) begin
        res_V_data_0_V_write = 1'b1;
    end else begin
        res_V_data_0_V_write = 1'b0;
    end
end

always @ (*) begin
    if ((((1'b1 == ap_CS_fsm_state4) & (icmp_ln42_fu_419_p2 == 1'd0)) | ((1'b1 == ap_CS_fsm_state2) & (icmp_ln32_fu_355_p2 == 1'd0)) | ((1'b1 == ap_CS_fsm_state3) & (icmp_ln37_fu_367_p2 == 1'd0)))) begin
        res_V_data_1_V_blk_n = res_V_data_1_V_full_n;
    end else begin
        res_V_data_1_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~(((io_acc_block_signal_op46 == 1'b0) & (icmp_ln37_fu_367_p2 == 1'd0)) | ((io_acc_block_signal_op37 == 1'b0) & (icmp_ln37_fu_367_p2 == 1'd0))) & (1'b1 == ap_CS_fsm_state3) & (icmp_ln37_fu_367_p2 == 1'd0))) begin
        res_V_data_1_V_din = data_V_data_1_V_dout;
    end else if (((~((io_acc_block_signal_op55 == 1'b0) & (icmp_ln42_fu_419_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state4) & (icmp_ln42_fu_419_p2 == 1'd0)) | (~((io_acc_block_signal_op28 == 1'b0) & (icmp_ln32_fu_355_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state2) & (icmp_ln32_fu_355_p2 == 1'd0)))) begin
        res_V_data_1_V_din = 24'd0;
    end else begin
        res_V_data_1_V_din = 'bx;
    end
end

always @ (*) begin
    if (((~((io_acc_block_signal_op55 == 1'b0) & (icmp_ln42_fu_419_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state4) & (icmp_ln42_fu_419_p2 == 1'd0)) | (~((io_acc_block_signal_op28 == 1'b0) & (icmp_ln32_fu_355_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state2) & (icmp_ln32_fu_355_p2 == 1'd0)) | (~(((io_acc_block_signal_op46 == 1'b0) & (icmp_ln37_fu_367_p2 == 1'd0)) | ((io_acc_block_signal_op37 == 1'b0) & (icmp_ln37_fu_367_p2 == 1'd0))) & (1'b1 == ap_CS_fsm_state3) & (icmp_ln37_fu_367_p2 == 1'd0)))) begin
        res_V_data_1_V_write = 1'b1;
    end else begin
        res_V_data_1_V_write = 1'b0;
    end
end

always @ (*) begin
    if ((((1'b1 == ap_CS_fsm_state4) & (icmp_ln42_fu_419_p2 == 1'd0)) | ((1'b1 == ap_CS_fsm_state2) & (icmp_ln32_fu_355_p2 == 1'd0)) | ((1'b1 == ap_CS_fsm_state3) & (icmp_ln37_fu_367_p2 == 1'd0)))) begin
        res_V_data_2_V_blk_n = res_V_data_2_V_full_n;
    end else begin
        res_V_data_2_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~(((io_acc_block_signal_op46 == 1'b0) & (icmp_ln37_fu_367_p2 == 1'd0)) | ((io_acc_block_signal_op37 == 1'b0) & (icmp_ln37_fu_367_p2 == 1'd0))) & (1'b1 == ap_CS_fsm_state3) & (icmp_ln37_fu_367_p2 == 1'd0))) begin
        res_V_data_2_V_din = data_V_data_2_V_dout;
    end else if (((~((io_acc_block_signal_op55 == 1'b0) & (icmp_ln42_fu_419_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state4) & (icmp_ln42_fu_419_p2 == 1'd0)) | (~((io_acc_block_signal_op28 == 1'b0) & (icmp_ln32_fu_355_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state2) & (icmp_ln32_fu_355_p2 == 1'd0)))) begin
        res_V_data_2_V_din = 24'd0;
    end else begin
        res_V_data_2_V_din = 'bx;
    end
end

always @ (*) begin
    if (((~((io_acc_block_signal_op55 == 1'b0) & (icmp_ln42_fu_419_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state4) & (icmp_ln42_fu_419_p2 == 1'd0)) | (~((io_acc_block_signal_op28 == 1'b0) & (icmp_ln32_fu_355_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state2) & (icmp_ln32_fu_355_p2 == 1'd0)) | (~(((io_acc_block_signal_op46 == 1'b0) & (icmp_ln37_fu_367_p2 == 1'd0)) | ((io_acc_block_signal_op37 == 1'b0) & (icmp_ln37_fu_367_p2 == 1'd0))) & (1'b1 == ap_CS_fsm_state3) & (icmp_ln37_fu_367_p2 == 1'd0)))) begin
        res_V_data_2_V_write = 1'b1;
    end else begin
        res_V_data_2_V_write = 1'b0;
    end
end

always @ (*) begin
    if ((((1'b1 == ap_CS_fsm_state4) & (icmp_ln42_fu_419_p2 == 1'd0)) | ((1'b1 == ap_CS_fsm_state2) & (icmp_ln32_fu_355_p2 == 1'd0)) | ((1'b1 == ap_CS_fsm_state3) & (icmp_ln37_fu_367_p2 == 1'd0)))) begin
        res_V_data_3_V_blk_n = res_V_data_3_V_full_n;
    end else begin
        res_V_data_3_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~(((io_acc_block_signal_op46 == 1'b0) & (icmp_ln37_fu_367_p2 == 1'd0)) | ((io_acc_block_signal_op37 == 1'b0) & (icmp_ln37_fu_367_p2 == 1'd0))) & (1'b1 == ap_CS_fsm_state3) & (icmp_ln37_fu_367_p2 == 1'd0))) begin
        res_V_data_3_V_din = data_V_data_3_V_dout;
    end else if (((~((io_acc_block_signal_op55 == 1'b0) & (icmp_ln42_fu_419_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state4) & (icmp_ln42_fu_419_p2 == 1'd0)) | (~((io_acc_block_signal_op28 == 1'b0) & (icmp_ln32_fu_355_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state2) & (icmp_ln32_fu_355_p2 == 1'd0)))) begin
        res_V_data_3_V_din = 24'd0;
    end else begin
        res_V_data_3_V_din = 'bx;
    end
end

always @ (*) begin
    if (((~((io_acc_block_signal_op55 == 1'b0) & (icmp_ln42_fu_419_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state4) & (icmp_ln42_fu_419_p2 == 1'd0)) | (~((io_acc_block_signal_op28 == 1'b0) & (icmp_ln32_fu_355_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state2) & (icmp_ln32_fu_355_p2 == 1'd0)) | (~(((io_acc_block_signal_op46 == 1'b0) & (icmp_ln37_fu_367_p2 == 1'd0)) | ((io_acc_block_signal_op37 == 1'b0) & (icmp_ln37_fu_367_p2 == 1'd0))) & (1'b1 == ap_CS_fsm_state3) & (icmp_ln37_fu_367_p2 == 1'd0)))) begin
        res_V_data_3_V_write = 1'b1;
    end else begin
        res_V_data_3_V_write = 1'b0;
    end
end

always @ (*) begin
    if ((((1'b1 == ap_CS_fsm_state4) & (icmp_ln42_fu_419_p2 == 1'd0)) | ((1'b1 == ap_CS_fsm_state2) & (icmp_ln32_fu_355_p2 == 1'd0)) | ((1'b1 == ap_CS_fsm_state3) & (icmp_ln37_fu_367_p2 == 1'd0)))) begin
        res_V_data_4_V_blk_n = res_V_data_4_V_full_n;
    end else begin
        res_V_data_4_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~(((io_acc_block_signal_op46 == 1'b0) & (icmp_ln37_fu_367_p2 == 1'd0)) | ((io_acc_block_signal_op37 == 1'b0) & (icmp_ln37_fu_367_p2 == 1'd0))) & (1'b1 == ap_CS_fsm_state3) & (icmp_ln37_fu_367_p2 == 1'd0))) begin
        res_V_data_4_V_din = data_V_data_4_V_dout;
    end else if (((~((io_acc_block_signal_op55 == 1'b0) & (icmp_ln42_fu_419_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state4) & (icmp_ln42_fu_419_p2 == 1'd0)) | (~((io_acc_block_signal_op28 == 1'b0) & (icmp_ln32_fu_355_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state2) & (icmp_ln32_fu_355_p2 == 1'd0)))) begin
        res_V_data_4_V_din = 24'd0;
    end else begin
        res_V_data_4_V_din = 'bx;
    end
end

always @ (*) begin
    if (((~((io_acc_block_signal_op55 == 1'b0) & (icmp_ln42_fu_419_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state4) & (icmp_ln42_fu_419_p2 == 1'd0)) | (~((io_acc_block_signal_op28 == 1'b0) & (icmp_ln32_fu_355_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state2) & (icmp_ln32_fu_355_p2 == 1'd0)) | (~(((io_acc_block_signal_op46 == 1'b0) & (icmp_ln37_fu_367_p2 == 1'd0)) | ((io_acc_block_signal_op37 == 1'b0) & (icmp_ln37_fu_367_p2 == 1'd0))) & (1'b1 == ap_CS_fsm_state3) & (icmp_ln37_fu_367_p2 == 1'd0)))) begin
        res_V_data_4_V_write = 1'b1;
    end else begin
        res_V_data_4_V_write = 1'b0;
    end
end

always @ (*) begin
    if ((((1'b1 == ap_CS_fsm_state4) & (icmp_ln42_fu_419_p2 == 1'd0)) | ((1'b1 == ap_CS_fsm_state2) & (icmp_ln32_fu_355_p2 == 1'd0)) | ((1'b1 == ap_CS_fsm_state3) & (icmp_ln37_fu_367_p2 == 1'd0)))) begin
        res_V_data_5_V_blk_n = res_V_data_5_V_full_n;
    end else begin
        res_V_data_5_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~(((io_acc_block_signal_op46 == 1'b0) & (icmp_ln37_fu_367_p2 == 1'd0)) | ((io_acc_block_signal_op37 == 1'b0) & (icmp_ln37_fu_367_p2 == 1'd0))) & (1'b1 == ap_CS_fsm_state3) & (icmp_ln37_fu_367_p2 == 1'd0))) begin
        res_V_data_5_V_din = data_V_data_5_V_dout;
    end else if (((~((io_acc_block_signal_op55 == 1'b0) & (icmp_ln42_fu_419_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state4) & (icmp_ln42_fu_419_p2 == 1'd0)) | (~((io_acc_block_signal_op28 == 1'b0) & (icmp_ln32_fu_355_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state2) & (icmp_ln32_fu_355_p2 == 1'd0)))) begin
        res_V_data_5_V_din = 24'd0;
    end else begin
        res_V_data_5_V_din = 'bx;
    end
end

always @ (*) begin
    if (((~((io_acc_block_signal_op55 == 1'b0) & (icmp_ln42_fu_419_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state4) & (icmp_ln42_fu_419_p2 == 1'd0)) | (~((io_acc_block_signal_op28 == 1'b0) & (icmp_ln32_fu_355_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state2) & (icmp_ln32_fu_355_p2 == 1'd0)) | (~(((io_acc_block_signal_op46 == 1'b0) & (icmp_ln37_fu_367_p2 == 1'd0)) | ((io_acc_block_signal_op37 == 1'b0) & (icmp_ln37_fu_367_p2 == 1'd0))) & (1'b1 == ap_CS_fsm_state3) & (icmp_ln37_fu_367_p2 == 1'd0)))) begin
        res_V_data_5_V_write = 1'b1;
    end else begin
        res_V_data_5_V_write = 1'b0;
    end
end

always @ (*) begin
    if ((((1'b1 == ap_CS_fsm_state4) & (icmp_ln42_fu_419_p2 == 1'd0)) | ((1'b1 == ap_CS_fsm_state2) & (icmp_ln32_fu_355_p2 == 1'd0)) | ((1'b1 == ap_CS_fsm_state3) & (icmp_ln37_fu_367_p2 == 1'd0)))) begin
        res_V_data_6_V_blk_n = res_V_data_6_V_full_n;
    end else begin
        res_V_data_6_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~(((io_acc_block_signal_op46 == 1'b0) & (icmp_ln37_fu_367_p2 == 1'd0)) | ((io_acc_block_signal_op37 == 1'b0) & (icmp_ln37_fu_367_p2 == 1'd0))) & (1'b1 == ap_CS_fsm_state3) & (icmp_ln37_fu_367_p2 == 1'd0))) begin
        res_V_data_6_V_din = data_V_data_6_V_dout;
    end else if (((~((io_acc_block_signal_op55 == 1'b0) & (icmp_ln42_fu_419_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state4) & (icmp_ln42_fu_419_p2 == 1'd0)) | (~((io_acc_block_signal_op28 == 1'b0) & (icmp_ln32_fu_355_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state2) & (icmp_ln32_fu_355_p2 == 1'd0)))) begin
        res_V_data_6_V_din = 24'd0;
    end else begin
        res_V_data_6_V_din = 'bx;
    end
end

always @ (*) begin
    if (((~((io_acc_block_signal_op55 == 1'b0) & (icmp_ln42_fu_419_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state4) & (icmp_ln42_fu_419_p2 == 1'd0)) | (~((io_acc_block_signal_op28 == 1'b0) & (icmp_ln32_fu_355_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state2) & (icmp_ln32_fu_355_p2 == 1'd0)) | (~(((io_acc_block_signal_op46 == 1'b0) & (icmp_ln37_fu_367_p2 == 1'd0)) | ((io_acc_block_signal_op37 == 1'b0) & (icmp_ln37_fu_367_p2 == 1'd0))) & (1'b1 == ap_CS_fsm_state3) & (icmp_ln37_fu_367_p2 == 1'd0)))) begin
        res_V_data_6_V_write = 1'b1;
    end else begin
        res_V_data_6_V_write = 1'b0;
    end
end

always @ (*) begin
    if ((((1'b1 == ap_CS_fsm_state4) & (icmp_ln42_fu_419_p2 == 1'd0)) | ((1'b1 == ap_CS_fsm_state2) & (icmp_ln32_fu_355_p2 == 1'd0)) | ((1'b1 == ap_CS_fsm_state3) & (icmp_ln37_fu_367_p2 == 1'd0)))) begin
        res_V_data_7_V_blk_n = res_V_data_7_V_full_n;
    end else begin
        res_V_data_7_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~(((io_acc_block_signal_op46 == 1'b0) & (icmp_ln37_fu_367_p2 == 1'd0)) | ((io_acc_block_signal_op37 == 1'b0) & (icmp_ln37_fu_367_p2 == 1'd0))) & (1'b1 == ap_CS_fsm_state3) & (icmp_ln37_fu_367_p2 == 1'd0))) begin
        res_V_data_7_V_din = data_V_data_7_V_dout;
    end else if (((~((io_acc_block_signal_op55 == 1'b0) & (icmp_ln42_fu_419_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state4) & (icmp_ln42_fu_419_p2 == 1'd0)) | (~((io_acc_block_signal_op28 == 1'b0) & (icmp_ln32_fu_355_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state2) & (icmp_ln32_fu_355_p2 == 1'd0)))) begin
        res_V_data_7_V_din = 24'd0;
    end else begin
        res_V_data_7_V_din = 'bx;
    end
end

always @ (*) begin
    if (((~((io_acc_block_signal_op55 == 1'b0) & (icmp_ln42_fu_419_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state4) & (icmp_ln42_fu_419_p2 == 1'd0)) | (~((io_acc_block_signal_op28 == 1'b0) & (icmp_ln32_fu_355_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state2) & (icmp_ln32_fu_355_p2 == 1'd0)) | (~(((io_acc_block_signal_op46 == 1'b0) & (icmp_ln37_fu_367_p2 == 1'd0)) | ((io_acc_block_signal_op37 == 1'b0) & (icmp_ln37_fu_367_p2 == 1'd0))) & (1'b1 == ap_CS_fsm_state3) & (icmp_ln37_fu_367_p2 == 1'd0)))) begin
        res_V_data_7_V_write = 1'b1;
    end else begin
        res_V_data_7_V_write = 1'b0;
    end
end

always @ (*) begin
    if (((start_once_reg == 1'b0) & (real_start == 1'b1))) begin
        start_write = 1'b1;
    end else begin
        start_write = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((real_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if ((~((io_acc_block_signal_op28 == 1'b0) & (icmp_ln32_fu_355_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state2) & (icmp_ln32_fu_355_p2 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else if ((~((io_acc_block_signal_op28 == 1'b0) & (icmp_ln32_fu_355_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state2) & (icmp_ln32_fu_355_p2 == 1'd0))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        ap_ST_fsm_state3 : begin
            if ((~(((io_acc_block_signal_op46 == 1'b0) & (icmp_ln37_fu_367_p2 == 1'd0)) | ((io_acc_block_signal_op37 == 1'b0) & (icmp_ln37_fu_367_p2 == 1'd0))) & (1'b1 == ap_CS_fsm_state3) & (icmp_ln37_fu_367_p2 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else if ((~(((io_acc_block_signal_op46 == 1'b0) & (icmp_ln37_fu_367_p2 == 1'd0)) | ((io_acc_block_signal_op37 == 1'b0) & (icmp_ln37_fu_367_p2 == 1'd0))) & (1'b1 == ap_CS_fsm_state3) & (icmp_ln37_fu_367_p2 == 1'd0))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state4 : begin
            if ((~((io_acc_block_signal_op55 == 1'b0) & (icmp_ln42_fu_419_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state4) & (icmp_ln42_fu_419_p2 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else if ((~((io_acc_block_signal_op55 == 1'b0) & (icmp_ln42_fu_419_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state4) & (icmp_ln42_fu_419_p2 == 1'd0))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

always @ (*) begin
    ap_block_state1 = ((real_start == 1'b0) | (ap_done_reg == 1'b1));
end

always @ (*) begin
    ap_block_state2 = ((io_acc_block_signal_op28 == 1'b0) & (icmp_ln32_fu_355_p2 == 1'd0));
end

always @ (*) begin
    ap_block_state3 = (((io_acc_block_signal_op46 == 1'b0) & (icmp_ln37_fu_367_p2 == 1'd0)) | ((io_acc_block_signal_op37 == 1'b0) & (icmp_ln37_fu_367_p2 == 1'd0)));
end

always @ (*) begin
    ap_block_state4 = ((io_acc_block_signal_op55 == 1'b0) & (icmp_ln42_fu_419_p2 == 1'd0));
end

assign ap_ready = internal_ap_ready;

assign i_2_fu_373_p2 = (i1_0_reg_333 + 7'd1);

assign i_3_fu_425_p2 = (i2_0_reg_344 + 2'd1);

assign i_fu_361_p2 = (i_0_reg_322 + 2'd1);

assign icmp_ln32_fu_355_p2 = ((i_0_reg_322 == 2'd2) ? 1'b1 : 1'b0);

assign icmp_ln37_fu_367_p2 = ((i1_0_reg_333 == 7'd64) ? 1'b1 : 1'b0);

assign icmp_ln42_fu_419_p2 = ((i2_0_reg_344 == 2'd2) ? 1'b1 : 1'b0);

assign io_acc_block_signal_op28 = (res_V_data_7_V_full_n & res_V_data_6_V_full_n & res_V_data_5_V_full_n & res_V_data_4_V_full_n & res_V_data_3_V_full_n & res_V_data_2_V_full_n & res_V_data_1_V_full_n & res_V_data_0_V_full_n);

assign io_acc_block_signal_op37 = (data_V_data_7_V_empty_n & data_V_data_6_V_empty_n & data_V_data_5_V_empty_n & data_V_data_4_V_empty_n & data_V_data_3_V_empty_n & data_V_data_2_V_empty_n & data_V_data_1_V_empty_n & data_V_data_0_V_empty_n);

assign io_acc_block_signal_op46 = (res_V_data_7_V_full_n & res_V_data_6_V_full_n & res_V_data_5_V_full_n & res_V_data_4_V_full_n & res_V_data_3_V_full_n & res_V_data_2_V_full_n & res_V_data_1_V_full_n & res_V_data_0_V_full_n);

assign io_acc_block_signal_op55 = (res_V_data_7_V_full_n & res_V_data_6_V_full_n & res_V_data_5_V_full_n & res_V_data_4_V_full_n & res_V_data_3_V_full_n & res_V_data_2_V_full_n & res_V_data_1_V_full_n & res_V_data_0_V_full_n);

assign start_out = real_start;

endmodule //zeropad1d_cl_array_array_ap_fixed_24_16_0_0_0_8u_config19_s
