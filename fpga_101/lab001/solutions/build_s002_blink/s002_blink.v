// -----------------------------------------------------------------------------
// Auto-Generated by:        __   _ __      _  __
//                          / /  (_) /____ | |/_/
//                         / /__/ / __/ -_)>  <
//                        /____/_/\__/\__/_/|_|
//                     Build your hardware, easily!
//                   https://github.com/enjoy-digital/litex
//
// Filename   : s002_blink.v
// Device     : xc7k325t-ffg900-2
// LiteX sha1 : a4cc859d
// Date       : 2022-05-18 08:47:36
//------------------------------------------------------------------------------


//------------------------------------------------------------------------------
// Module
//------------------------------------------------------------------------------

module s002_blink (
	output reg  user_led,
	(* dont_touch = "true" *)	input  wire clk156_p,
	input  wire clk156_n
);


//------------------------------------------------------------------------------
// Signals
//------------------------------------------------------------------------------

reg  [31:0] counter = 32'd0;
wire sys_clk;
wire sys_rst;
wire por_clk;
wire clk_se;
reg  int_rst = 1'd1;

//------------------------------------------------------------------------------
// Combinatorial Logic
//------------------------------------------------------------------------------

assign sys_clk = clk_se;
assign por_clk = clk_se;
assign sys_rst = int_rst;


//------------------------------------------------------------------------------
// Synchronous Logic
//------------------------------------------------------------------------------

always @(posedge por_clk) begin
	int_rst <= 1'd0;
end

always @(posedge sys_clk) begin
	counter <= (counter + 1'd1);
	// if ((counter == 27'd78249999)) begin
	if ((counter == 27'd10)) begin
		counter <= 1'd0;
		user_led <= (~user_led);
	end
	if (sys_rst) begin
		user_led <= 1'd0;
		counter <= 32'd0;
	end
end


//------------------------------------------------------------------------------
// Specialized Logic
//------------------------------------------------------------------------------

IBUFDS IBUFDS(
	.I(clk156_p),
	.IB(clk156_n),
	.O(clk_se)
);

endmodule

// -----------------------------------------------------------------------------
//  Auto-Generated by LiteX on 2022-05-18 08:47:36.
//------------------------------------------------------------------------------
