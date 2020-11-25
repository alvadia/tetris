module LCG (clk, rst, enable, out);
    parameter seed = 8;
    parameter width_output = 4;
    parameter width_state = 48;
    parameter multiplier = 49235258628958;
    parameter module_const = 281474976710597;
    
    input wire clk, rst, enable;
    output wire [0:width_output-1] out;
    assign out = register[width_state / 2 - width_output / 2 +:width_output];

    reg [0:width_state-1] register;
    always @(posedge clk, posedge rst) begin
        if (rst) begin
            if (seed == 0)
                 register <= $sdate | 1;
            else register <= seed;
        end
        else if (enable)
            register <= (register * multiplier) % module_const;
    end

endmodule
