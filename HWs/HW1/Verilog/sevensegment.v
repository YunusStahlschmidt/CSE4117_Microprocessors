// module ssegment (grounds, display, clk);

// output wire [6:0] display;
// output wire [3:0] grounds;
// input clk;

// reg [15:0] number;
// reg [25:0] clk1;

// always @(posedge clk) 
//     clk1<=clk1+1;

// always @(posedge clk[23]) 
//     number<=number+1;



// sevensegment ss1 (.datain(number), .grounds(grounds), .display(display), .clk(clk));

// initial
//     begin
//        number=0; 
//     end

// endmodule

module sevensegment(datain, grounds, display, clk);

input wire[15:0] datain;
output reg[6:0] display;
output reg[3:0] grounds;
input clk;


reg [3:0] data [3:0];

reg [25:0] clk1;
reg [1:0] count;


always @(posedge clk) 
    clk1<=clk1+1;

always @(posedge clk[15]) // 19 wavy, 23 fast
    begin
        grounds <={grounds [2:0], grounds[3]};
        count<=count+1
    end

always @*
    begin
        data[3]=datain[15:12];
        data[2]=datain[11:8];
        data[1]=datain[7:4];
        data[0]=datain[3:0];
    end

always @*
    case (data[count])
        0: display=7'b1111110; //starts with a ends with g
        1: display=7'b0110000; 
        2: display=7'b1101101; 
        3: display=7'b1111001; 
        4: display=7'b0110011; 
        5: display=7'b1011011; 
        6: display=7'b1011111; 
        7: display=7'b1110000; 
        8: display=7'b1111111; 
        9: display=7'b1111011; 
        'ha: display=7'b1110111; 
        'hb: display=7'b0011111; 
        'hc: display=7'b1001110; 
        'hd: display=7'b0111101; 
        'he: display=7'b1001111; 
        'hf: display=7'b1000111; 
        default display=7'b1111111;
    endcase

initial begin
count=0;
grounds=4'b1110;
clk1=0;
end


endmodule
