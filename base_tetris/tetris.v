module tetris(clk, rst);
    parameter integer MEM_WIDTH = 10;
    parameter integer MEM_HEIGHT = 20;
    parameter integer WIDTH = 8;
    parameter integer INSTRACTION_NUMBERS = 8;

    input clk, rst;

wire [WIDTH-1:0] instr_addr, new_instr_addr;
wire [2*WIDTH-1:0] instr;
wire [WIDTH-1:0] action, figure;

wire [MEM_WIDTH * WIDTH - 1:0] border;
wire [MEM_WIDTH * WIDTH - 1:0] new_border;
wire [4 * WIDTH - 1:0] rho_x, rho_y, new_rho_x, new_rho_y;

// control
wire is_load_PC, write_reg, write_mem, is_move;
wire is_load_fig, is_touch;

PC _PC(.load(is_load_PC), .clk(clk), .rst(rst), 
       .in(new_instr_addr), .out(instr_addr));

adder #(.WIDTH(WIDTH))
    _adder_plus_one(.clk(clk), .rst(rst),
                    .x(instr_addr), .y(8'b1), .out(new_instr_addr));

instructions #(.WIDTH(WIDTH), .INSTRACTION_NUMBERS(INSTRACTION_NUMBERS)) 
              _inst(.clk(clk), .rst(rst),
                    .curr_command(instr_addr), 
                    .out_data(instr));

assign action = instr[2*WIDTH-1:WIDTH];
assign figure = instr[WIDTH-1:0];

border_regs #(.WIDTH(WIDTH), .MEM_WIDTH(MEM_WIDTH), .MEM_HEIGHT(MEM_HEIGHT))
    _border_regs(// input
                 .new_border(new_border), .new_rho_x(new_rho_x),
                 .new_rho_y(new_rho_y),
                 .figure(figure),
                 // output
                 .border(border), .rho_x(rho_x), .rho_y(rho_y),
                 // control
                 .clk(clk), .rst(rst), .write_reg(write_reg),
                 .is_load_fig(is_load_fig));

alu #(.WIDTH(WIDTH), .MEM_WIDTH(MEM_WIDTH), .MEM_HEIGHT(MEM_HEIGHT))
    _alu(// input
        .action(action), .figure(figure),
        .border(border), .rho_x(rho_x), .rho_y(rho_y),
        // output
        .new_border(new_border), .new_rho_x(new_rho_x),
        .new_rho_y(new_rho_y),
        // control
        .is_move(is_move)
        );

memory #(.WIDTH(WIDTH), .MEM_WIDTH(MEM_WIDTH), .MEM_HEIGHT(MEM_HEIGHT)) 
    _mem(// input
         .new_border(new_border), .new_rho_x(new_rho_x),
         .new_rho_y(new_rho_y),
         // control
         .clk(clk), .rst(rst), .write_mem(write_mem)
         );

control_fsm #(.WIDTH(WIDTH), .MEM_WIDTH(MEM_WIDTH), 
              .MEM_HEIGHT(MEM_HEIGHT), .INSTRACTION_NUMBERS(INSTRACTION_NUMBERS))
    _fsm(// input
         .instr_addr(instr_addr),
         .action(action), .figure(figure),
         .rho_x(rho_x), .rho_y(rho_y),
         .border(border),
         // output
         .write_reg(write_reg), .write_mem(write_mem),
         .is_move(is_move), .is_load_PC(is_load_PC),
         .is_touch(is_touch), .is_load_fig(is_load_fig)
         );

endmodule