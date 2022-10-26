# Statemachine  
## Design a statemachine manually
    By using ASM chart  
## Design in System Verilog  
### coding style template:  
- Style1:  
    block1:  
        enum{state1, state2, state3...} present_state, next_state;  
        always_ff: flip-flop  
    block2:  
        always_comb & unique case(present_state): what to do in different states  
    Note:  
        A label can help seeing what's going on inside the always_ff  
- Style2:  
    Change block1 in style1: Add a case lists with the triggers of switching states  
- Style3:  
    Only use one always_ff block: emerge the cases in style2  
## Register Transfer Notation  
No significant inforation noted  
## Testbench for Sequential System  
- 2 ways of writing clock cycles.  
- Avoid pulling the input signals along with the rise edge of the clock signal.  
- Display  
## For you to do   
    3 for you to do.  