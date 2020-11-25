module instructions(clk, rst, curr_command, out_data);
    parameter integer WIDTH = 8;
    parameter integer INSTRACTION_NUMBERS = 4;
    input clk, rst;
    input [WIDTH-1: 0] curr_command;
    output [2 * WIDTH-1:0] out_data;

reg [2 * WIDTH-1:0] mem [0:INSTRACTION_NUMBERS-1];
wire [2 * WIDTH-1:0] memory = mem[curr_command];
wire [WIDTH-1:0] prng_data;
reg [WIDTH-1:0] data;
reg enable;

initial begin
    $readmemb("mem_content.list", mem); // Raw binary format
end

linear_congruential_generator #(
    .seed(8), .variant(0),
    .width_state(18), .width_output(WIDTH),
    ) LCG_instance (
    .clk(clk), .rst(rst),
    .enable(enable), .out(prng_data)
    );

wire [2 * WIDTH-1:0] memory = mem[curr_command];
casez(memory)
    {WIDTH{1'b0}, WIDTH{1'bz}}: begin
        data <= prng_data % 3; // 3 is number of diff. figurines
        enable <= 1'b1;
    end
    default: begin
        enable <= 1'b0;
    end
endcase
assign out_data = {memory[2*WIDTH-1:1*WIDTH], data}
endmodule
