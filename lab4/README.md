# Lab 04 - SOP/POS and KMaps

In this lab, you’ve learned how to apply KMaps, Sum Of Products and Products of
sums to simplify digital logic equations. Then, you’ve proven out that they work
using an implemented design on your Basys3 boards.

## Rubric

| Item | Description | Value |
| ---- | ----------- | ----- |
| Summary Answers | Your writings about what you learned in this lab. | 25% |
| Question 1 | Your answers to the question | 25% |
| Question 2 | Your answers to the question | 25% |
| Question 3 | Your answers to the question | 25% |

## Lab Summary

We learned how to set up and use a Kmap, min and max terms and how to simplify a logic functions from truth tables. 

## Lab Questions

### Why are the groups of 1’s (or 0’s) that we select in the KMap able to go across edges?
	Those cells are still considered ajacent since they only change or differ by one bit which still makes them fulfull the requirement. 

### Why are the names Sum of Products and Products of Sums?
Because when we are using min terms we are and'ing all of the individual terms then or'ing them which is the sum of the products and vice versa (or'ing all terms then and'ing together)
for the products of sums.

### Open the test.v file – how are we able to check that the signals match using XOR?

Because any time output of the logic is different the value will be true for an XOR gate. 