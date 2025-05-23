// Single-Port RAM with synchronous reset

module ram(
    input clk,                  // Clock input
    input [9:0] address,        // 10-bit address input (1024 locations)
    input write,                // Write enable signal
    input [7:0] data_in,        // 8-bit data input
    input reset,                // Synchronous reset
    output reg [7:0] data_out   // 8-bit data output
);

reg [7:0] ram_b [0:1023];      // 1K x 8-bit memory array
integer i;

always @(posedge clk)
begin
    if (reset) 
    begin
        data_out <= 8'b0;           // Clear output on reset
        // Clear all memory locations on reset
        for (integer i = 0; i < 1024; i = i + 1) begin
            ram_b[i] <= 8'b0;
        end
    end 
    else 
    begin
        if (write) 
        begin
            ram_b[address] <= data_in;   // Write data to memory at given address
        end 
        else 
        begin
            data_out <= ram_b[address];  // Read data from memory at given address
        end
    end
end

endmodule