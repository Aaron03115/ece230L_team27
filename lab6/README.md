# Number Theory: Addition

In this lab you've learned the basics of number theory as it relates to addition.

## Rubric

| Item | Description | Value |
| ---- | ----------- | ----- |
| Summary Answers | Your writings about what you learned in this lab. | 25% |
| Question 1 | Your answers to the question | 25% |
| Question 2 | Your answers to the question | 25% |
| Question 3 | Your answers to the question | 25% |

## Lab Questions

### Summary:
	In this lab we learned how to write the logic of an adder/full_adder and then combine them together using carry bits and step patterns to 
	demonstrate adding two two-bit numbers. Oh and an XOR switch.

### 1 - How might you add more than two bits together?
	You would need to make another another carry bit and string together another full_adder for every increased bit.

### 2 - What is the importance of the XOR gate in an adder?
	It keeps track of the bit place. So if its A or B you get a value of 1 but if you have a carry bit and you have both it pushes it to
	the next place.

### 3 - What is the largest number a two bit adder can handle? What happens when you go over?
	6 is the largest if you can include the carry light being off so you are representing the binary 110. If you were to go over you wont be able
	to represent it and wouldnt be able to add more than 4 anyways with a two bit adder.

