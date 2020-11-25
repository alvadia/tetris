module border_regs(// input
                   new_border, new_rho_x, new_rho_y,
                   figure,
                   // output
                   border, rho_x, rho_y,
                   // control
                   clk, rst, write_reg,
                   is_load_fig
                   );
    parameter integer MEM_WIDTH = 10;
    parameter integer MEM_HEIGHT = 20;
    parameter integer WIDTH = 8;
    // input
    input [MEM_WIDTH * WIDTH - 1:0] new_border;
    input [4 * WIDTH - 1:0] new_rho_x, new_rho_y;
    input [WIDTH-1:0] figure;
    // output
    output [MEM_WIDTH * WIDTH - 1:0] border;
    output [4 * WIDTH - 1:0] rho_x, rho_y;
    // control
    input write_reg;
    input clk, rst;
    input is_load_fig;

wire T_fig, Q_fig, I_fig;
reg [4 * WIDTH - 1:0] rst_x_value, rst_y_value;

assign T_fig = (figure == 8'b00000000);
assign Q_fig = (figure == 8'b00000001);
assign I_fig = (figure == 8'b00000010);

always @(*) begin
    // O, Z, T, I, S, L - standart?
    if (T_fig) begin
        rst_x_value[4 * WIDTH - 1: 3 * WIDTH] = 0;
        rst_y_value[4 * WIDTH - 1: 3 * WIDTH] = 0;
        rst_x_value[3 * WIDTH - 1: 2 * WIDTH] = 1;
        rst_y_value[3 * WIDTH - 1: 2 * WIDTH] = 0;
        rst_x_value[2 * WIDTH - 1: 1 * WIDTH] = 2;
        rst_y_value[2 * WIDTH - 1: 1 * WIDTH] = 0;
        rst_x_value[1 * WIDTH - 1: 0 * WIDTH] = 1;
        rst_y_value[1 * WIDTH - 1: 0 * WIDTH] = 1;
    end
    else if (Q_fig) begin // What is Q_fig?
        rst_x_value[4 * WIDTH - 1: 3 * WIDTH] = 0;
        rst_y_value[4 * WIDTH - 1: 3 * WIDTH] = 0;
        rst_x_value[3 * WIDTH - 1: 2 * WIDTH] = 1;
        rst_y_value[3 * WIDTH - 1: 2 * WIDTH] = 0;
        rst_x_value[2 * WIDTH - 1: 1 * WIDTH] = 0;
        rst_y_value[2 * WIDTH - 1: 1 * WIDTH] = 1;
        rst_x_value[1 * WIDTH - 1: 0 * WIDTH] = 0;
        rst_y_value[1 * WIDTH - 1: 0 * WIDTH] = 2;
    end
    else if (I_fig) begin
        rst_x_value = 0;
        rst_y_value[4 * WIDTH - 1: 3 * WIDTH] = 0;
        rst_y_value[3 * WIDTH - 1: 2 * WIDTH] = 1;
        rst_y_value[2 * WIDTH - 1: 1 * WIDTH] = 2;
        rst_y_value[1 * WIDTH - 1: 0 * WIDTH] = 3;
    end
    else begin
        rst_x_value = 0;
        rst_y_value = 0;
    end
end

generate
    genvar i;
    for(i = 0; i < MEM_WIDTH; i = i + 1)
    begin : border_block
        reset_register #(.WIDTH(WIDTH))
            _border(.load(write_reg), 
                 .clk(clk), .rst(rst), 
                 .rst_value(6),
                 .in(new_border[WIDTH*(MEM_WIDTH-i)-1:WIDTH*(MEM_WIDTH-i-1)]), 
                 .out(border[WIDTH*(MEM_WIDTH-i)-1:WIDTH*(MEM_WIDTH-i-1)]));
    end
endgenerate

generate
    genvar j;
    for(j = 0; j < 4; j = j + 1)
    begin : rho_x_block
        reset_register #(.WIDTH(WIDTH))
            _rho_x(.load(write_reg), 
                   .clk(clk), .rst(rst || is_load_fig), 
                   .rst_value(rst_x_value[(4-j)*WIDTH-1:(3-j)*WIDTH]),
                   .in(new_rho_x[(4-j)*WIDTH-1:(3-j)*WIDTH]), 
                   .out(rho_x[(4-j)*WIDTH-1:(3-j)*WIDTH]));
        reset_register #(.WIDTH(WIDTH))
            _rho_y(.load(write_reg), 
                   .clk(clk), .rst(rst || is_load_fig), 
                   .rst_value(rst_y_value[(4-j)*WIDTH-1:(3-j)*WIDTH]),
                   .in(new_rho_y[(4-j)*WIDTH-1:(3-j)*WIDTH]), 
                   .out(rho_y[(4-j)*WIDTH-1:(3-j)*WIDTH]));
    end
endgenerate

endmodule