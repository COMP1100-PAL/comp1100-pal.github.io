General notes on piecewise:
- goes through the function line by line to check if the input matches 

General notes on cases:
- cases use pattern matching (only a single variable)
- use ``_`` to catch all the missed cases at the end
- use ``->`` to indicate the output of the function
- goes through the function line by line to check if the input matches (same as piecewise)
- can nest cases within cases
- can get around the single variable limitation by using tuples

General notes on guards:
- guards use Booleans to pick which block of code to run 
- use ``otherwise`` as a catch-all
- use ``|`` to indicate a guard
- use ``=`` to indicate the output of the function (unless it's in a case statement)
- goes through the function line by line to check if the Boolean expression is ``True``
- can't nest guards (more detail on the next worksheet!!)

General notes on ``where``:

How to use normally:
Write ``where`` undermeath the function and indent it.

How to use with case:
Same indentation level as the patterns for the whole statement, more indented than the arrow for just the specific branch

How to use with guards:
Same indentation level as the guards for the whole statement, can't be used with a specific case
