# Statemachine 
***   
## For you to do skipped items:  
- 2 & 3 A testbench, can be easy  
- 5 watch a video, nothing to answer.  
- Assignment? 开摆.  
***  
## For you to do answers:
1. Code is in the sv file.  
4. First one is a Mux Gate with one always low voltage input. And the next one is a latch triggered by enable signal which I think it comes better with an always_latch instead of always_comb because you tend to create a latch.  
6. Yes. Take the traffic light controller as an example, circuits that only use sequential logic are certainly simpler than combinational and sequential logic circuits, but the latter can be more efficient than the former. Design according to product requirements is the best choice.  
***  
## Design a statemachine manually
    By using ASM chart  
***  
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