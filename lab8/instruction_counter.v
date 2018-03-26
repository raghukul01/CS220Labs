module instruction_counter(bit, clk, led
    );

    input bit, clk;
    output [7:0] led;
    wire [7:0] led;

    reg [5:0] prog_counter;
    reg [31:0] mem_block[0:63];
    reg [31:0] inst;
    reg [5:0] opcode;
    reg [5:0] func;
    reg [4:0] register;
    reg [1:0] counter[0:31];
    reg [1:0] counterj;
    reg [2:0] counteri;
    reg [2:0] counterr;

    initial begin
        prog_counter = 0;
        counter[0] = 0; counter[1] = 0; counter[2] = 0; counter[3] = 0; counter[4] = 0; counter[5] = 0; counter[6] = 0; counter[7] = 0;
        counter[8] = 0; counter[9] = 0; counter[10] = 0; counter[11] = 0; counter[12] = 0; counter[13] = 0; counter[14] = 0; counter[15] = 0;
        counter[16] = 0; counter[17] = 0; counter[18] = 0; counter[19] = 0; counter[20] = 0; counter[21] = 0; counter[22] = 0; counter[23] = 0;
        counter[24] = 0; counter[25] = 0; counter[26] = 0; counter[27] = 0; counter[28] = 0; counter[29] = 0; counter[30] = 0; counter[31] = 0;
        counterj = 0; counteri = 0; counterr = 0;
        inst = 0;
        opcode = 0;
        func = 0;
        register = 0;
        led = 0;
        mem_block[0] = 32'b001000_00000_00100_0011_0100_0101_0110;
		mem_block[1] = 32'b001000_00000_00101_1111_1111_1111_1111;
		mem_block[2] = 32'b000000_00101_00100_00110_00000_100000;
		mem_block[3] = 32'b001000_00000_00011_0000_0000_0000_0111;
		mem_block[4] = 32'b000000_00011_00110_00110_00000_000100;
		mem_block[5] = 32'b000000_00000_00011_00011_00001_000010;
		mem_block[6] = 32'b100011_00100_00101_1001_1010_1011_1100;
		mem_block[7] = 32'b000010_01_0010_0011_0100_0101_0110;
        mem_block[8] = 0; mem_block[9] = 0; mem_block[10] = 0; mem_block[11] = 0; mem_block[12] = 0;
        mem_block[13] = 0; mem_block[14] = 0; mem_block[15] = 0; mem_block[16] = 0; mem_block[17] = 0;
        mem_block[18] = 0; mem_block[19] = 0; mem_block[20] = 0; mem_block[21] = 0; mem_block[22] = 0;
        mem_block[23] = 0; mem_block[24] = 0; mem_block[25] = 0; mem_block[26] = 0; mem_block[27] = 0;
        mem_block[28] = 0; mem_block[29] = 0; mem_block[30] = 0; mem_block[31] = 0; mem_block[32] = 0;
        mem_block[33] = 0; mem_block[34] = 0; mem_block[35] = 0; mem_block[36] = 0; mem_block[37] = 0;
        mem_block[38] = 0; mem_block[39] = 0; mem_block[40] = 0; mem_block[41] = 0; mem_block[42] = 0;
        mem_block[43] = 0; mem_block[44] = 0; mem_block[45] = 0; mem_block[46] = 0; mem_block[47] = 0;
        mem_block[48] = 0; mem_block[49] = 0; mem_block[50] = 0; mem_block[51] = 0; mem_block[52] = 0;
        mem_block[53] = 0; mem_block[54] = 0; mem_block[55] = 0; mem_block[56] = 0; mem_block[57] = 0;
        mem_block[58] = 0; mem_block[59] = 0; mem_block[60] = 0; mem_block[61] = 0; mem_block[62] = 0;
        mem_block[63] = 0;
    end

    always@(posedge clk) begin
        
        if(prog_counter < 8) begin

            inst <= memblock[prog_counter];

            opcode <= inst[31:26];

            case(opcode)
                
                6'b000000: begin
                    counterr <= counterr + 1;
                    func <= inst[5:0]
                    if((func != 6'b011011) && (func != 6'b011010) && (func != 6'b011000) && (func != 6'b011001) && (func != 6'b010011) && (func != 6'b010001) && (func != 6'b001100) && (func != 6'b001000) && (func != 6'b000000)) begin
                        register <= inst[15:11];
                        counter[register] <= counter[register] + 1;
                    end
                    endcase
                end

                6'b000001: begin
                    ;// Do nothing
                end

                6'b000010: begin
                    counterj <= counterj + 1;
                end

                6'b000011: begin
                    counterj <= counterj + 1;
                end

                default: begin
                    counteri <= counteri + 1;
                    if((opcode != 6'b000100) && (opcode != 6'b000101) && (opcode != 6'b000110) && (opcode != 6'b000111) && (opcode != 6'b101000) && (opcode != 6'b101001) && (opcode != 6'b101011)) begin
                    register <= inst[20:16];
                    counter[register] <= counter[register] + 1;
                    end
                    
            endcase

            prog_counter <= prog_counter + 1; 
        end
    end

        always@(posedge clk) begin
            if(bit == 1'b0) begin
                led[2:0] <= counterr;
                led[5:3] <= counteri;
                led[7:6] <= counterj;
            end
            else begin
                led[1:0] <= counter[5'b00011];
                led[3:2] <= counter[5'b00100];
                led[5:4] <= counter[5'b00101];
                led[7:6] <= counter[6'b00110];
            end
        end

    end
