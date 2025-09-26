# Lab 05 - Combinatorial Logic

In this lab, you’ve learned real world applications of digital logic, as well
as how to assemble your own Verilog modules. In addition, you’ve learned how
the constraints file maps your inputs and outputs to real pins on the FPGA.

## Rubric

| Item | Description | Value |
| ---- | ----------- | ----- |
| Summary Answers | Your writings about what you learned in this lab. | 25% |
| Question 1 | Your answers to the question | 25% |
| Question 2 | Your answers to the question | 25% |
| Question 3 | Your answers to the question | 25% |

## Lab Questions

### Summary 
We learned how to create two seperate modules in verilog and conenct the in a top file. This wil lallow us to create complicated circuits furhter on in the semester. 
We also learned how to map the inputs and outputs of the board to or vivado projects using the constraints file. 

### 1 - Explain the role of the Top Level file.
The role of top is to connect all of the inputs and outputs to the switches and LEDs and to connect 
other modules to each other to build a larger system/design

### 2 - Explain the function of the Constraints file.
It is used to map the inputs and outputs from vivado to our board using specific pins and naming them. 

### 3 - Was the selection of Minterm and Maxterm correct for each circuit? What would you have chosen?
I believe they were correct because they generated easy kmaps that simplified the boolean ciruit logic.
