module mag_comb_logic (
    input startn, stopn, clearn, door_closed, timer_done
    output reg set, reset
);
    assign set = (~startn) & (stopn) & (~timer_done) & (door_closed);
    assign reset = (~stopn) | (~clearn) | (timer_done) | (~door_closed);
endmodule