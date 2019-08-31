import utils::*;
module hazard_unit(input decode_execute_t dec_exe_r, 
            input execute_memory_t exe_mem_r, 
            input memory_writeback_t mem_wb_r,
            output hazard_signals_t hs);
 

  always_comb begin
    hs.StallMemory_DH = RUN;
    //Staling signals
    if((dec_exe_r.R1_addr == exe_mem_r.Rd_addr 
      || dec_exe_r.R2_addr == exe_mem_r.Rd_addr) && exe_mem_r.MemToReg && exe_mem_r.RegWrite) //Register from ID/EXE needs forward stuff said to be in EXE/MEM, but it is needed from memory too, so needs to wait
      begin 
        //Stalling signals
        hs.StallFetch_DH = STALL;
        hs.StallDecode_DH = STALL;
        hs.StallExecute_DH = STALL;
        hs.FlushExecute = FLUSH;
      end
    else
      begin
        //Non Stalling signals
        hs.StallFetch_DH = RUN;
        hs.StallDecode_DH = RUN;
        hs.StallExecute_DH = RUN;
        hs.FlushExecute = KEEP;
      end
      
  //Forward signals
    //// Asumming stall is working.
    
    //For first ALU operand
    if(dec_exe_r.R1_addr == exe_mem_r.Rd_addr && exe_mem_r.RegWrite)
      begin
        // Forward from MEM/WB reg.
        hs.Forward_ID_EX_A = EX_MEM_a; // EX_MEM —> 2´b2
      end
    else if(dec_exe_r.R1_addr == mem_wb_r.Rd_addr && mem_wb_r.RegWrite)
      begin
        // Forward from EXE/MEM reg.
        hs.Forward_ID_EX_A = MEM_WB_a; // MEM_WB —> 2´b1
      end
    else 
      begin
        //No forwarding required
        hs.Forward_ID_EX_A = ID_EX_a; // ID_EX —> 2´b0
      end  
    
    //For second ALU operand
    if(dec_exe_r.R2_addr == exe_mem_r.Rd_addr && exe_mem_r.RegWrite)  
      begin
        // Forward from MEM/WB reg.
        hs.Forward_ID_EX_B = EX_MEM_a; // EX_MEM —> 2´b2
      end
    else if(dec_exe_r.R2_addr == mem_wb_r.Rd_addr && mem_wb_r.RegWrite)
      begin
        // Forward from EXE/MEM reg.
        hs.Forward_ID_EX_B = MEM_WB_a; // MEM_WB —> 2´b1
      end
    else 
      begin
        //No forwarding required
        hs.Forward_ID_EX_B = ID_EX_a; // ID_EX —> 2´b0
      end
      

    //For Mem Forwarding
    if(exe_mem_r.Rd_addr == mem_wb_r.Rd_addr && mem_wb_r.MemToReg && exe_mem_r.MemWrite)
      begin
        // Forward from MEM/WB reg.
        hs.Forward_EX_MEM = MEM_WB_m; // MEM_WB —> 2´b1
      end
    else 
      begin
        //No forwarding required
        hs.Forward_EX_MEM = EX_MEM_m; // EX_MEM —> 2´b0
      end
  
  //When branching occurs.
    if(dec_exe_r.PCSrc)begin
      hs.StallFetch_DH = STALL;
      hs.FlushDecode = FLUSH; 
    end
	 
    else if(exe_mem_r.PCSrc)begin
      hs.StallFetch_DH = STALL;
      hs.StallDecode_DH = STALL;
      hs.FlushDecode = FLUSH;
    end
  
    else begin
      hs.FlushDecode = KEEP;
    end
    
  end
      
endmodule