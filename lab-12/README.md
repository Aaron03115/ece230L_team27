Teryn Blacketter
Aaron Eaglton
Group 27

# Number Theory: Addition

In this lab, you’ve learned about One Hot and Binary state machines and how to build them. We determined logic by building kmaps for each and implementing them into verilog. We developed a better undertsand for state machines and their use cases.

## Rubric

| Item | Description | Value |
| ---- | ----------- | ----- |
| Summary Answers | Your writings about what you learned in this lab. | 25% |
| Question 1 | Your answers to the question | 25% |
| Question 2 | Your answers to the question | 25% |
| Question 3 | Your answers to the question | 25% |

## Lab Questions

### Compare and contrast One Hot and Binary encodings
Binary encoding assigns binary values to each state while one hot converts each category into its own column corresponding to a category and sets that to one while all others get set to 0.

### Which method did your team find easier, and why?
One hot, because the logic was more straightforward and we understood it more. 

### In what conditions would you have to use one over the other? Think about resource utilization on the FPGA.
Binary is more resource efficient and easier to write for smaller state number and uses fewer bits. One hot is faster for larger models because it generates shorter pathways between the states.
