# Lab 2

## Task 1

![alt text](image.png)

```
module full_adder(
    input wire X,
    input wire Y,
    input wire Cin,
    output wire Z,
    output wire Cout
    );
    
    assign Z = X ^ Y ^ Cin;
    assign Cout = (X & Y) | (Y & Cin) | (X & Cin);
endmodule
```

```
set_property PACKAGE_PIN T16 [get_ports X]
set_property IOSTANDARD LVCMOS33 [get_ports X]

set_property PACKAGE_PIN W13 [get_ports Y]
set_property IOSTANDARD LVCMOS33 [get_ports Y]

set_property PACKAGE_PIN P15 [get_ports Cin]
set_property IOSTANDARD LVCMOS33 [get_ports Cin]

set_property PACKAGE_PIN D18 [get_ports Z]
set_property IOSTANDARD LVCMOS33 [get_ports Z]

set_property PACKAGE_PIN G14 [get_ports Cout]
set_property IOSTANDARD LVCMOS33 [get_ports Cout]
```

## Task 2

```
module overflowCounter(
    input wire clk, reset, enable,
    output wire [3:0] led
);
    reg [28:0] counter;
    always @(posedge clk) begin
        if (reset == 1'b1) begin
            counter <= 29'd0;
        end
        else if (enable == 1'b1) begin
            counter <=  counter + 1'b1;
        end
        else begin
            counter <= counter;
        end
    end
    assign led = counter[28:25];
endmodule
```

![alt text](image-1.png)

simplified code:
```
module overflowCounter(
    input wire clk, reset, enable,
    output wire [3:0] led
);
    reg [28:0] counter;
    always @(posedge clk) begin
        if (reset == 1'b1)counter <= 29'd0;
        else if (enable == 1'b1) counter <=  counter + 1'b1;
        else counter <= counter;
    end
    assign led = counter[28:25];
endmodule
```

constraints

```
set_property -dict { PACKAGE_PIN M14   IOSTANDARD LVCMOS33 } [get_ports { led[0] }]; #IO_L23P_T3_35 Sch=led[0]
set_property -dict { PACKAGE_PIN M15   IOSTANDARD LVCMOS33 } [get_ports { led[1] }]; #IO_L23N_T3_35 Sch=led[1]
set_property -dict { PACKAGE_PIN G14   IOSTANDARD LVCMOS33 } [get_ports { led[2] }]; #IO_0_35 Sch=led[2]
set_property -dict { PACKAGE_PIN D18   IOSTANDARD LVCMOS33 } [get_ports { led[3] }]; #IO_L3N_T0_DQS_AD1N_35 Sch=led[3]

set_property -dict { PACKAGE_PIN K17 IOSTANDARD LVCMOS33 } [get_ports {clk}];
create_clock -add -period 8.00 [get_ports {clk}];

set_property -dict { PACKAGE_PIN K18   IOSTANDARD LVCMOS33 } [get_ports { reset }];
set_property -dict { PACKAGE_PIN G15   IOSTANDARD LVCMOS33 } [get_ports { enable }];
```

## Task 3

So, if we want to derive a 1 kHz clock from the 125 MHz master clock, how big must the overflow
counter be? Use the equation:
$$f_{div} = f_{clk} / 2^n$$

thus
$$n = \log_2(f_{clk} / f_{div}) = \log_2(125E6 / 1E3) = 16.93$$

![alt text](image-2.png)

Note a period of slightly longer than 1ms (1/1kHz) since we need to use a 17 bit counter

![alt text](image-3.png)