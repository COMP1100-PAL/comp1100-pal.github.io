# What is Truth?
Who am I? What is Tony talking about? These questions have plagued philosophers for centuries. In this worksheet we will help answer the first of these questions.
Truth tables are a convenient way of describing an operation between Boolean values. For example, consider the truth table for the _AND_ operator:
| P | Q | P _AND_ Q|
|---|---|:---:|
| T | T | T |
| T | F | F |
| F | T | F |
| F | F | F |

### Question 1
Your mission is to write the function 
``and :: Bool -> Bool -> Bool``.
This function takes in two boolean values and return the corresponding boolean output for the _AND_ operator, as shown in the table above. You should use nested case statements.
### Question 2
Design your own truth table for your own boolean operator! Call it whatever you like, and write a function which performs this operation. To make it a bit different, let your input be a tuple of boolean values:

`your_function :: (Bool, Bool) -> Bool`

Can you think of what this operator might do? Discuss within your group a possible application of your operator.
