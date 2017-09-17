# For Those Just Starting

So you've walked into the study event, head still drowsy from the glorious 2-week break, and it's suddenly hitting you that there's another COMP1100 assignment due this week! Not to mention, you know nothing about the stock market that you're apparently supposed to be an expert in!

But do not fear. But I'm gonna let you in on a secret - our friends at PAL aren't stock market experts either. The good news is that nobody expects you to be a finance whiz, not now, and not at the end of the assignment. You simply need to find a strategy that you're happy with and can implement while showing off your *creativity* and *skills as a coder*, not necessarily a stock market broker! But that's for the other rooms.

We can only do that once we've understood Steven's base functions. Luckily, we can feel at peace knowing that these are all perfectly functional.

Before you do anything, make sure you've __read the whole assignment spec first__!

Here's a little something to get you started, to put the entire Stock Market into perspective: 

![TINA DOESN'T HAVE ACCESS](https://github.com/COMP1100-PAL/comp1100-pal.github.io/blob/master/_posts/studyevent/Untitled%20Diagram.png "Tina now has access")

As you're reading through the code, make sure to comment it!! If you haven't been commenting your code in assignments, now's a good time to start. Stay consistent with your coding style. Both your tutor and your future self will thank you later for doing this.

If you feel comfortable so far, move onto the next section for some more nitty-gritty stuff!

# For those who are halfway there

As is the norm for PAL, it's time to get up on the whiteboards and collaborate. Firstly, draw a diagram of the different functions, include the helper functions, and how they all relate to each other. You can use the diagram above as a starting point. Talk to each other, discuss something when you don't understand it. Your understanding will be better for it, and this time, it's assessed!

It may be a good idea to explicitly write out the Input and Output for each of the 4 function. Not only will this clarify what is going on for you, it will do the same for your tutor. (Note: this is also a good tip for commenting your functions in general for future assignments!). This is more than just reciting the type signature, it is a careful consideration of what the inputs and outputs actually are in scope of the larger problem.


e.g. for `calculateWealth`,

Inputs: Current portfolio and stock history generated from all the 'stock rounds' prior to the current round

Output: Current wealth as a sum of existing wealth + sum of cash gained/lost from all stocks in possession, each individually weighted by quantity

Brainstorm with your fellow COMP1100ers on how you could write the function differently. Keep in mind that the assignmetn does not request a detailed rewrite of these functions, and so keeping it broad and conceptual is where it's at.

# Syntax to get familiar with

`a@(b,c)` - When using tuples, this essentially defines the tuple so that it gives values to both the tuple itself and the two separate values inside the tuple.

So we can refer to the information stored in the tuple by the entire tuple `a` itself or the parts `b` and `c` separately.

`notElem` - Takes in an argument and a list, and returns False if the list contains an item equal to the element.

`transpose` - Takes in a list of lists, and transposes the rows with the columns (equivalent to matrix transposition). e.g. `transpose [[1,2,3],[4,5,6],[7,8,9]] = [[1,4,7],[2,5,8],[3,6,9]]`

# Vocab to get familiar with

Short position: Stocks that are owed (i.e. sold and not bought back yet)

Long position: Stocks that are bought and still currently owned

i.e. An investor who owns 50 shares of Google is said to be long 50 shares, as they have paid in full the cost of owning the shares. Alternatively, an investor who has sold 50 Google shares without currently owning those shares is said to be short 50 shares.

Order: An order is basically your instruction on whether to buy/sell a stock. (Note: Essentially what you are trying to program for `makeOrders` is one or more particular strategy or heuristic that will get you the greatest profit.) i.e. `Order s q` translates to "buy `q` amounts of stock `s`"
