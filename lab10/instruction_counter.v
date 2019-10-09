`define MAX_PC 11
`define OUTPUT_REG 4

module instruction_counter(clk, led
    );

    input clk;
    output [7:0] led;
    reg [7:0] led;

    reg [7:0] prog_counter;
    reg [31:0] mem_block[0:10];
    reg [7:0] data_mem[0:2];
    reg [7:0] reg_file[0:31];
    reg [31:0] inst;
    reg [5:0] opcode;
    reg [5:0] func;
    reg [4:0] register[0:2];
    reg [2:0] state;
    reg [7:0] val;
    reg invalid;
    reg [4:0] address;
    reg [7:0] ans;

    initial begin

		prog_counter = 0;
    led = 0;
    inst = 0;
    opcode = 0;
    func = 0;
    register[0] = 0; register[1] = 0; register[2] = 0;
    state = 0;
    val = 0;
    address = 0;
    ans = 0;

		data_mem[0] = 8'b11101100; // stores a
		data_mem[1] = 8'b00001010; // stores b
		data_mem[2] = 8'b00000010; // stores c

		mem_block[0] = 32'b100011_00000_00001_0000_0000_0000_0000; // lw $1, 0($0)
		mem_block[1] = 32'b100011_00000_00010_0000_0000_0000_0001; // lw $2, 1($0)
		mem_block[2] = 32'b100011_00000_00011_0000_0000_0000_0010; // lw $3, 2($0)
		mem_block[3] = 32'b001001_00000_00100_0000_0000_0000_0000; // addiu $4, $0, 0
		mem_block[4] = 32'b001001_00001_00101_0000_0000_0000_0000; // addiu $5, $1, 0
		mem_block[5] = 32'b000000_00101_00010_00110_00000_101010;  // slt $6, $5, $2
		mem_block[6] = 32'b000100_00110_00000_0000_0000_0000_0101; // beq $6, $0, exit
		mem_block[7] = 32'b000000_00100_00101_00100_00000_100001;  // addu $4, $4, $5
		mem_block[8] = 32'b000000_00101_00011_00101_00000_100001;  // addu $5, $5, $3
		mem_block[9] = 32'b000000_00101_00010_00110_00000_101010;  // slt $6, $5, $2
	   mem_block[10] = 32'b000101_00110_00000_1111_1111_1111_1101; // bne $6, $0, loop

		reg_file[0] = 0; reg_file[1] = 0; reg_file[2] = 0; reg_file[3] = 0; reg_file[4] = 0;
		reg_file[5] = 0; reg_file[6] = 0; reg_file[7] = 0;reg_file[8] = 0; 
		reg_file[9] = 0; reg_file[10] = 0; reg_file[11] = 0; reg_file[12] = 0;
        reg_file[13] = 0; reg_file[14] = 0; reg_file[15] = 0; reg_file[16] = 0; reg_file[17] = 0;
        reg_file[18] = 0; reg_file[19] = 0; reg_file[20] = 0; reg_file[21] = 0; reg_file[22] = 0;
        reg_file[23] = 0; reg_file[24] = 0; reg_file[25] = 0; reg_file[26] = 0; reg_file[27] = 0;
        reg_file[28] = 0; reg_file[29] = 0; reg_file[30] = 0; reg_file[31] = 0;

	  end

    always@(posedge clk) begin
        
       if(state == 0) begin
           inst <= mem_block[prog_counter];
           state <= state + 1;
       end
       else if(state == 1) begin
           opcode <= inst[31:26];
           func <= inst[5:0];
           state <= state + 1;
       end
       else if(state == 2) begin
        case(opcode)
            
            6'b000000: begin
                  register[0] <= inst[25:21];
                  register[1] <= inst[20:16];
                  register[2] <= inst[15:11];
                  state <= state + 1;
            end

            default: begin
                  register[0] <= inst[25:21];
                  register[2] <= inst[20:16];
                  val <= inst[7:0];
                  state <= state + 1;
            end
                
        endcase
       end
       else if(state == 3) begin

         if(opcode == 6'b000000 && func == 6'b100001) begin
           ans <= reg_file[register[1]] + reg_file[register[0]];
           prog_counter <= prog_counter + 1;
         end
         else if(opcode == 6'b000000 && func == 6'b101010) begin
           if(reg_file[register[0]] < reg_file[register[1]]) begin
             ans <= 1;
           end
           else begin
             ans <= 0;
           end
           prog_counter <= prog_counter + 1;
         end
         else if(opcode == 6'b001001) begin
           ans <= reg_file[register[0]] + val;
           prog_counter <= prog_counter + 1;
         end
         else if(opcode == 6'b000100) begin
           if(reg_file[register[0]] == reg_file[register[2]]) begin
             prog_counter <= prog_counter + val;
           end
           else begin
            prog_counter <= prog_counter + 1;
           end
         end
         else if(opcode == 6'b000101) begin
           if(reg_file[register[0]] != reg_file[register[2]]) begin
             prog_counter <= prog_counter + val;
           end
           else begin
            prog_counter <= prog_counter + 1;
           end
         end
         else if(opcode == 6'b100011) begin
           address <= register[0] + val[4:0];
           prog_counter <= prog_counter + 1;
         end
         else begin
           invalid <= 1;
           prog_counter <= prog_counter + 1;
         end

         state <= state + 1;

       end
       else if(state == 4) begin
         if(opcode == 6'b100011) begin
           reg_file[register[2]] <= data_mem[address];
         end
         state <= state + 1;
       end
       else if(state == 5) begin
         if(invalid == 1'b0) begin
           if(register[2] != 5'b00000) begin
             reg_file[register[2]] <= ans;
           end
         end
         if(prog_counter < `MAX_PC) begin
          state <= 0;
         end
         else begin
          state <= state + 1;
         end
       end
       else if(state == 6) begin
        led <= reg_file[`OUTPUT_REG];
       end
    end
endmodule
