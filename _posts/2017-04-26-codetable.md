# Codetable

Before attempting this worksheet, make sure that you've already written the **Frequency** part and **constructed the Huffman tree**.

!["hello"](http://www.binaryessence.com/dct/deG00026.gif)

As described in the assignment, this is a description of how the coding sequences are generated, simply by traversing down the tree.
The only difference is - in your current assignments you'll use *L* and *R* in place of 0 and 1 so that it's a bit more intuitive for you!

e.g. Generating the letter "B" would have a code of "100" i.e. "RLL"
e.g. Generating the letter "D" would have a code of "RRL"

How would you generate the letter E with the above tree using only *R*s and *L*s?

The *codetable* module of your assignment is essentially the same thing but on a larger scale, with careful assigning of characters to bit values.

# Encoding

Encoding using the Huffman algorithm is simply matching up values with the values in the codetable to compose a string of bits (in this case, *L* and *R* values). It is essentially the application of the codetable.

Using the above tree as an example, the word "BAD" would be composed of the string "1000110" i.e. "RLLLRRL"

How would you generate the word "BEAD" with the tree using only *R*s and *L*s?

Now - write a function so that the values in the codetable are matched up to represent an arbitrary input string into Huffman code.
