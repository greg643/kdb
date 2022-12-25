# kdb Projects

## Candyland

Our version of Candyland is several years old and I realized that cards were missing, and some were starting to rip. Before the deck of cards was too far gone, I decided to create a simple program to recreate the deck of candyland cards, and then I realized with a little more effort, I could replace the entire deck with a script, track whose turn it was, and reshuffle the deck when it was exhausted.

This is a simple and fun example of dynmic list creation, random selection without replacement, updating global variables, and putting it all together into something you can actually use to play a game. Now - drawing a real candyland card from a deck is a lot more tangibly satisfying than clicking a button on your computer, but this approach also saves time for shuffling cards, drawing them and replacing them. 

Considering the simplicity of Candyland for bigger kids, this can make the game into a novelty - we wound up playing "speed Candyland" where winnner would be best of 3 or best of 5. 

Hope you enjoy!

## Neural Net in kdb

I wanted to understand neural nets in more detail, to develop an intuitive understanding of what a neural net actually is and how it works.

Having completed the project, the simplest description I can come up with for a neural net, is a set of formulas that continually update a matrix of weights. The size of the matrix of weights will vary based on the problem being solved. Through repetition, assuming we're on a solvable problem, the weights will hopefully converge to values that allow the network to tease out relationships between inputs and outputs, in essence "predicting" the outcome, without having any specific logic to understand the problem it is solving beyond the weights.

The XOR problem is a great starting point for understanding a neural net. XOR is a simple logical concept meaning "exclusive OR". The entire exercise solves a simple construct: given two inputs, if either one is true, return true; but if both are true, or both are false, return false.

A real world example of this logic: "Mary is either a singer or a poet (meaning, she is not neither, and she is not both)." 

XOR can be trivially coded as an "if" statement, which makes the use of a neural net humorously complex by comparison - one "and/or" evaluation, solves the XOR problem: if[((x=0)&(y=0))|((x=1)&(y=1));0;1]

Using a neural net for this problem is like using a sledgehammer to kill an ant. To achieve this outcome with a neural net requires thousands of iterations, using much more complex code, to achieve the same thing. In this particular case with the default variables shown, it seems to take around 7,000 repetitions to solve XOR.

What is hopefully much more impressive here, is that this neural net will learn, over a number of iterations, to "predict" XOR results without any specific logic to understand the problem. 

XOR is useful as a learning example for neural nets, precisely because it is overkill: the constrained inputs and outputs mean that we can use a small number of layers, and with constrained inputs and outputs, checking the outputs is much easier.

In conclusion: the magic of the neural net is that we can see how a collection of formulas, plus repetition, can build upon itself, and "learn" through repetition by updating weghts, to the point where the weights will reflect the same result as a strict logical rule. 

If you imagine scaling a neural net to different contexts, such as problems where the output is not as rigidly defined and can change over time, then a neural net can serve as a flexible tool for prediction.

The code I used here was originally inspired by a kx tutorial, but the kx tutorial was alternatively less detailed and more complicated than needed (and didn't seem to work), so I instead found a good python example that worked, and then adapted that code instead. Python served as a check, so I was able to debug my kdb code at each step by comparing to the equivalent result from python.

Now, I can already hear folks saying "this is why python is superior for data science" and I'm not going to argue it - there's a lot of merit to that view. As a personal project - since I already do so much work in kdb, my preference is to stay in kdb as much as possible, inspiring this example. 

I like to keep my code very simple. My personal rules for coding kdb: 
(1) use language primitives wherever possible;
(2) prefer slightly more verbose implementations;
(3) all else equal, prefer simpler implementations.

I imagine there are smarter ways to achieve everything I did here, particularly my deus ex machina of skipping iteration with dictionaries, "setting" global variables to manage the core weight updates, and "learning" through a simple do command. 

If you have a smarter way, let me know!

## Sources

This is the original example that inspired me, provided by kx. I used some pieces, but overall didn't work for me:

https://code.kx.com/q/wp/neural-networks/

This is the example I ultimately implemented:

https://github.com/shayanalibhatti/Coding-neural_network-for-XOR-logic-from-scratch/blob/master/neural_network_xor_logic_from_scratch.ipynb

Wikipedia background on XOR:

https://en.wikipedia.org/wiki/Exclusive_or

This example relies heavily on kdb matrix multiplication - the "mmu" function. Working with matrices in kdb was new to me with this example, and I found mmu fairly fussy as a first time user. More to learn here.

https://code.kx.com/q/ref/mmu/
