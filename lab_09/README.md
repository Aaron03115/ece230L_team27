# Sequential Circuits: Latches

In this lab, you learned about the basic building block of sequential circuits: the latch. We implemented the latch into
a memory storage device that would store 4 8 bit data structures based upon the enable and the switch data. Then selected memory would be displayed on the leds. 

## Rubric

| Item | Description | Value |
| ---- | ----------- | ----- |
| Summary Answers | Your writings about what you learned in this lab. | 25% |
| Question 1 | Your answers to the question | 25% |
| Question 2 | Your answers to the question | 25% |
| Question 3 | Your answers to the question | 25% |

## Lab Questions

###  Why can we not just use structural Verilog to implement latches?
Becuase the data would be in a combinitorial loop and verilog cannot guarantee its states because asychronous clock times
causing it to error out.

### What is the meaning of always @(*) in a sensitivity block?
It is an implicit event expression that tells the compiler to automatically infer and include all the inputs that are inside the always block inside the sensitivity list. This is to prevent common bugs that arise from manually updating the list.

### What importance is memory to digital circuits?
Allows them to store and retrieve binary data that is important for them to process information without requiring input 
to be active and present at all times. 