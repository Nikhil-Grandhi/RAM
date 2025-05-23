// Dual-Port RAM with synchronous reset and independent read/write ports

module DP_RAM (
    input clk,                    // Clock input
    input [9:0] addr_a,           // Address for port A
    input [9:0] addr_b,           // Address for port B
    input [7:0] data_in_a,        // Data input for port A
    input [7:0] data_in_b,        // Data input for port B
    input w_a,                    // Write enable for port A
    input w_b,                    // Write enable for port B
    input reset,                  // Synchronous reset
    output reg [7:0] data_out_a,  // Data output for port A
    output reg [7:0] data_out_b   // Data output for port B
);

reg [7:0] RAM [0:1023];           // 1K x 8-bit memory array
integer i;

always @(posedge clk) begin
    // Synchronous reset: clear outputs and RAM
    if (reset) 
    begin
        data_out_a <= 8'b0;
        data_out_b <= 8'b0;
        for (i = 0; i < 1024; i = i + 1) 
        begin
            RAM[i] <= 8'b0;
        end
    end
    else begin
        // Port A operation
        if (w_a) begin
            RAM[addr_a] <= data_in_a;      // Write to RAM at addr_a
        end 
        else begin
            data_out_a <= RAM[addr_a];     // Read from RAM at addr_a
        end
        
        // Port B operation
        if (w_b) begin
            // Prevent simultaneous write to the same address by both ports
            if (!(w_a && addr_a == addr_b)) begin
                RAM[addr_b] <= data_in_b;  // Write to RAM at addr_b
            end
        end 
        else begin
            data_out_b <= RAM[addr_b];     // Read from RAM at addr_b
        end
    end
end

endmodule