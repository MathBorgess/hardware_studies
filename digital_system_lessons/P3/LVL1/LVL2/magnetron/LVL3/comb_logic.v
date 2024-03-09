module mag_comb_logic (
    input wire startn, stopn, clearn, door_closed, timer_done
    output reg set, reset
);

    always @(*) begin
        set = (~startn) & (stopn) & (~timer_done) & (door_closed);
        reset = (~stopn) | (~clearn) | (timer_done) | (~door_closed);
    end

endmodule