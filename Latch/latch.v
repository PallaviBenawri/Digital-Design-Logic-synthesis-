module latch(q, q_, set, reset);

input set, reset;
output q, q_;
wire q, q_	;
nor #(1) (q, reset, q_);
nor #(1) (q_, set, q);

endmodule

module stimulus;

reg SET, RESET;
wire Q, Q_;

latch latch1(Q,Q_,SET,RESET);

initial
begin
SET = 1'b0;
RESET = 1'b1;

#5 RESET = 1'b0;
#10 SET = 1'b1; RESET = 1'b0;
#15 RESET = 1'b1;

end

initial
$monitor($time, " Q = %d set = %d, reset = %d", Q, SET, RESET);

endmodule 
