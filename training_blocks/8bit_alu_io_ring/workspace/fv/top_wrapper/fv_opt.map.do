
//input ports
add mapped point A[7] A[7] -type PI PI
add mapped point A[6] A[6] -type PI PI
add mapped point A[5] A[5] -type PI PI
add mapped point A[4] A[4] -type PI PI
add mapped point A[3] A[3] -type PI PI
add mapped point A[2] A[2] -type PI PI
add mapped point A[1] A[1] -type PI PI
add mapped point A[0] A[0] -type PI PI
add mapped point B[7] B[7] -type PI PI
add mapped point B[6] B[6] -type PI PI
add mapped point B[5] B[5] -type PI PI
add mapped point B[4] B[4] -type PI PI
add mapped point B[3] B[3] -type PI PI
add mapped point B[2] B[2] -type PI PI
add mapped point B[1] B[1] -type PI PI
add mapped point B[0] B[0] -type PI PI
add mapped point Sel[1] Sel[1] -type PI PI
add mapped point Sel[0] Sel[0] -type PI PI
add mapped point clk_in clk_in -type PI PI
add mapped point rst rst -type PI PI

//output ports
add mapped point Out[7] Out[7] -type PO PO
add mapped point Out[6] Out[6] -type PO PO
add mapped point Out[5] Out[5] -type PO PO
add mapped point Out[4] Out[4] -type PO PO
add mapped point Out[3] Out[3] -type PO PO
add mapped point Out[2] Out[2] -type PO PO
add mapped point Out[1] Out[1] -type PO PO
add mapped point Out[0] Out[0] -type PO PO

//inout ports




//Sequential Pins
add mapped point u_alu_core/Out[3]/q u_alu_core_Out_reg[3]/Q -type DFF DFF
add mapped point u_alu_core/Out[1]/q u_alu_core_Out_reg[1]/Q -type DFF DFF
add mapped point u_alu_core/Out[0]/q u_alu_core_Out_reg[0]/Q -type DFF DFF
add mapped point u_alu_core/Out[7]/q u_alu_core_Out_reg[7]/Q -type DFF DFF
add mapped point u_alu_core/Out[5]/q u_alu_core_Out_reg[5]/Q -type DFF DFF
add mapped point u_alu_core/Out[2]/q u_alu_core_Out_reg[2]/Q -type DFF DFF
add mapped point u_alu_core/Out[4]/q u_alu_core_Out_reg[4]/Q -type DFF DFF
add mapped point u_alu_core/Out[6]/q u_alu_core_Out_reg[6]/Q -type DFF DFF



//Black Boxes



//Empty Modules as Blackboxes
