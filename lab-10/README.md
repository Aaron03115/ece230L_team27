# Sequential Circuits: Latches
Teryn Blacketter
Aaron Eagleton
Group 27

In this lab, you’ve learned about edge sensitive circuits and explored some of the power therein. We built a d-flip-flop using a positive edge implementation. We then used that d-flip-flop to build a jk-flip-flop and then a t-flip-flop using the jk-flip-flop. This demonstartes the power of reusing modules to build edge sensitive circuits. 

## Rubric

| Item | Description | Value |
| ---- | ----------- | ----- |
| Summary Answers | Your writings about what you learned in this lab. | 25% |
| Question 1 | Your answers to the question | 25% |
| Question 2 | Your answers to the question | 25% |
| Question 3 | Your answers to the question | 25% |

## Lab Questions

### What is different between edge and level sensitive circuits?
Edge level circuits will capture the values at the edges of a clock cycle while level circuits react to the voltage level itself and can change as a signal changes. 

### Why is it important to declare initial state?
Because verilog doesnt know how to interpret the intial state so we must provide it.  

### What do edge sensitive circuits let us build?
They allow us to build memory cells and counters that follow a clock cycle. 
