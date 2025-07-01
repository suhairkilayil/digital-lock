module digital_lock (
    input wire clk,       // Clock signal
    input wire reset,     // Asynchronous reset
    input wire in_bit,    // Serial input bit
    output reg lock       // Lock state
);

// State encoding
localparam IDLE   = 3'b000;
localparam S1     = 3'b001;
localparam S11    = 3'b010;
localparam S110   = 3'b011;
localparam S1101  = 3'b100;
localparam UNLOCK = 3'b101;

reg [2:0] current_state, next_state;

// State transition logic
always @(posedge clk or posedge reset) begin
    if (reset)
        current_state <= IDLE;
    else
        current_state <= next_state;
end

// Next state logic and output control
always @(*) begin
    // Default values
    next_state = current_state;
    lock = 0;

    case (current_state)
        IDLE: begin
            if (in_bit)
                next_state = S1;
            else
                next_state = IDLE;
        end

        S1: begin
            if (in_bit)
                next_state = S11;
            else
                next_state = IDLE;
        end

        S11: begin
            if (!in_bit)
                next_state = S110;
            else
                next_state = S11;
        end

        S110: begin
            if (in_bit)
                next_state = S1101;
            else
                next_state = IDLE;
        end

        S1101: begin
            next_state = UNLOCK;
        end

        UNLOCK: begin
            lock = 1; // Unlock when correct pattern is detected
            next_state = IDLE;
        end

        default: next_state = IDLE;
    endcase
end

endmodule
