module fp_5(input in_clk, input in_rst, output out_clk);

reg [2:0] count_u;

always @(posedge in_clk, negedge in_rst)
begin
	if(!in_rst)
		count_u <= 0;
	else
		begin
			if(count_u == 4)
				count_u <= 0;
			else
				count_u <= count_u + 1'b1;
		end
end

reg [2:0] count_d;

always @(negedge in_clk, negedge in_rst)
begin
	if(!in_rst)
		count_d <= 0;
	else begin
		if(count_d == 4)
			count_d <= 0;
		else
			count_d <= count_d +1'b1;
	end
end

reg out_clk_u;

always @(posedge in_clk , negedge in_rst) begin
	if (!in_rst)
		out_clk_u <= 0;
	else begin
		if(count_u <= 2)
			out_clk_u <= 1;
		else
			out_clk_u <= 0;
	end
end

reg out_clk_d;

always @(negedge in_clk , negedge in_rst) begin
	if (!in_rst) 
		out_clk_d <= 0;
	else  begin
		if(count_d <= 2)
			out_clk_d <= 1;
		else
			out_clk_d <= 0;
	end
end

assign out_clk = out_clk_d & out_clk_u;

endmodule