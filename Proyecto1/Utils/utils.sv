// Fetch - Decode Pipeline Register Data
typedef struct packed {
	logic[31:0] Instruction;			// Raw instruction data
	logic [31:0] PC;					// Program counter
} fetch_decode_t;