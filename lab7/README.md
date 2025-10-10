# Number Theory: Subtraction

In this lab you've learned the basics of number theory as it relates to subtraction. We learned how to get around a combinatoral loop error 
while using binary addition and subraction of one and two bit numbers. We also learned how to implement a half_subtractor. 

## Rubric

| Item | Description | Value |
| ---- | ----------- | ----- |
| Summary Answers | Your writings about what you learned in this lab. | 25% |
| Question 1 | Your answers to the question | 25% |
| Question 2 | Your answers to the question | 25% |
| Question 3 | Your answers to the question | 25% |

## Lab Questions

### 1 - Explain the differences between our Half Adder from last lab and the Half Subtractor from this lab.
A half adder uses a carry to the half sub uses a borrow. The borrow is not a and b while the carry is a and b.

### 2 - What about the end around carry of One’s Complement makes it hard to use and implement?
There is a dependency between the final end around carry and the least significant bit. If you implement it straight through
meaning your LSB's uses C_out while the MSB's final is also C_out without breaking the stream between the two you create a 
combinatoral loop. To get around this you needed to double your full adder count to first add your bits, keep track of the carries,
then go back and the finals from the bits to their respective carries to get your actual final number breaking the connection between 
then MSB and LSB

### 3 - What is the edge case and problem with Two’s Complement number representation?

The issue with the representation is that adding two ,large positive numbers can reseult in a negative number or a positive overflow 
because the most negative numbers is represented by the highest possible magnitude in the binary range/system of all 1's.