module Counter
(
	input logic set_zero,
	output integer count
);

integer _count;
logic _flag;
initial begin
	_count = (set_zero == 1) ? 0: count+1;
end

assign count = _count;
endmodule
