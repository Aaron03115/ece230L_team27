# Lab 11 - Counters and Dividers

In this lab, we learned how to make clock dividers from two types of counters. We had to implement a count to 6 using a ripple counter 
and a modulo counter using D_flipflop and T_flipflops

## Rubric

| Item | Description | Value |
| ---- | ----------- | ----- |
| Summary Answers | Your writings about what you learned in this lab. | 25% |
| Question 1 | Your answers to the question | 25% |
| Question 2 | Your answers to the question | 25% |
| Question 3 | Your answers to the question | 25% |

## Lab Questions

### 1 - Why does the Modulo Counter actually divide clocks by 2 * Count?
The counter divides the clocks by 2*count because one cycle of the output reuqires you to do two
 full cycles of the input clock to increment. 

### 2 - Why does the ring counter's output go to all 1s on the first clock cycle?
Its because it is decrementing from its value which would be 6.

### 3 - What width of ring counter would you use to get to an output of ~1KHz?

you would need to do 17 stage counter. If you have 100 MHz = 100,000,000Hz and our output factor is 2^n so 2^17 gives you 762.94Hz.