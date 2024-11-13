# CPU Implement in Verilog
### This project demonstrates a single-cycle RISC-V CPU design, implemented in Verilog, focusing on a simple and efficient datapath to execute RISC-V instructions. The CPU supports essential components like the Main Control Unit, Data Memory, Branch Control, and Register File. 
## Single Cycle RISC-V Datapath Schematics
- ### Detail Schematic
![p1](https://github.com/ChingSsuyuan/CPU_Implement_Verilog/blob/824c368b2396667f14397a4a7d7e41988461efb3/Design%20Schematics/CPU1.png)
- ### Simple Schematic
![p3](https://github.com/ChingSsuyuan/CPU_Implement_Verilog/blob/0ee61d5a37c2c4a72669923d3575d11ccf364f6d/Design%20Schematics/Cpu_3.png)
## CPU Waveform 
![p2](https://github.com/ChingSsuyuan/CPU_Implement_Verilog/blob/460033829c0336be8cc324d4e1cf62db5998eb88/Design%20Schematics/Cpu_Waveform.png)
## Module Functions
- ### ALU: 
![p4](https://github.com/ChingSsuyuan/CPU_Implement_Verilog/blob/bc1fbd9cbc426db116dc6ba92ff4baf3de0b7096/Design%20Schematics/ALU.png)
- ### Program Counter:
  Holds the address of the current instruction being executed. After each instruction is fetched, the Program Counter is typically incremented to point to the next instruction. 
- ### Instruction Memory:
  Stores the instructions for the program being executed. It provides the instruction corresponding to the address specified by the Program Counter.
- ### Immediate Gen:
  Extracts and sign-extends the immediate value from specific instruction fields, making it compatible with the data size in the datapath.
- ### Main Control Unit:
  Coordinates the actions of the processor, interpreting instructions and directing components on how to respond.
- ### Data Memory:
  Stores and provides data needed by instructions during execution, often organized by addresses for quick retrieval.
- ### Branch Control:
  Manages decisions in the instruction flow, handling branching to ensure correct instruction sequencing.
- ### Register File:
  A small, fast storage area in the CPU that holds intermediate values, frequently used variables, and processor state information for quick access during computation.
