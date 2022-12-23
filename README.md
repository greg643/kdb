# kdb projects

## Candyland

Over thanksgiving weekend, I was playing Candyland with my son. Our version of the game is several years old and I realized that cards were missing and some were starting to rip. Before the deck of cards was too far gone, I decided to create a simple program to recreate the deck of candyland cards, and then I realized with a little more effort, I could replace the entire deck with a script, track whose turn it was, and reshuffle the deck when it was exhausted.

This is a simple and fun example of dynmic list creation, random selection without replacement, updating global variables, and putting it all together into something you can actually use to play a game. Now - drawing a real candyland card from a deck is a lot more tangibly satisfying than clicking a button on your computer, but this approach also saves time for shuffling cards, drawing them and replacing them. So, considering the simplicity of Candyland for bigger kids, this can make the game into a novelty - we wound up playing "speed Candyland" where winnner would be best of 3 or best of 5. 

Hope you enjoy!

## kdb neural net

I wanted to understand neural nets in more detail, so I had my own intuitive understanding of what a neural net actually is. 

Having completed the project, the simplest description I can come up with for a neural net, is a set of formulas that continually update a matrix of weights. The matrix dimensions can vary based on the problem being solved. Through repetition, assuming we're on a solvable problem, the weights can converge to predictive values that allow the network to tease out relationships between inputs and outputs, without having any specific logic to understand the problem it is solving beyond the weights.

The XOR problem is a great starting point for understanding how neural nets work. XOR is a simple logical concept meaning "exclusive OR". The entire exercise is solving for: given two inputs, if either one is true, return true; if both are true or both false, return false.

A real world example of this logic: "Mary is either a singer or a poet (meaning, she is not neither, and she is not both)." 

Using a neural net here is like using a sledgehammer to kill an ant. XOR can be trivially coded as an "if" statement, which makes the use of a neural net humorously complex by comparison - one "and/or" evaluation, solves the XOR problem: if[((x=0)&(y=0))|((x=1)&(y=1));0;1]

To achieve this outcome with a neural net requires thousands of iterations, using much more complex code, to achieve the same thing. (In this particular case with the default variables shown, it seems to take around 6,000 repetitions to solve XOR.)

What is hopefully much more impressive here, is that this neural net will learn, over a number of iterations, to "predict" XOR results without any specific logic to understand the problem. 

XOR is useful as a learning example for neural nets, precisely because it is overkill: the constrained inputs and outputs mean that we can use a small number of layers, and with severely constrained inputs and outputs, it is easy to verify we have the right answer.

In conclusion: the magic of the neural net is that we can see how a collection of formulas, plus repetition, can build upon itself, and "learn" through repetition by updating weghts, to the point where the weights will reflect the same result as a strict logical rule. 

If you imagine scaling a neural net to different contexts, such as problems where the output is not as rigidly defined and can change over time, then a neural net can serve as a flexible tool for prediction.

The code I used here was originally inspired by a kx tutorial, but the code was more complicated than I needed and didn't seem to work, so I instead found a good python example that worked, and then adapted that code instead. Python was much easier to implement, and I was able to verify that my kdb code was working by comparing the values to the equivalent result from python.

I can already hear folks saying "this is why python is superior for data science" and there's a lot of merit to that view. Since I already do most of my work in kdb, my preference is to stay in kdb wherever possible, and this was a decent way to get familiar with the math of a neural net.

I like to keep my code very simple, (1) using language primitives wherever possible, (2) using more verbose versions wherever possible. I imagine there are smarter ways to achieve everything I show here, such as my deus ex machina of just "setting" global variables to manage the weight pieces. If you have a smarter way, let me know!

## Sources

This is the example I implemented, from Python:

https://github.com/shayanalibhatti/Coding-neural_network-for-XOR-logic-from-scratch/blob/master/neural_network_xor_logic_from_scratch.ipynb

Here is an example provided by kx, which has fancier kdb code than mine, but didn't work for me:

https://code.kx.com/q/wp/neural-networks/

Wikipedia background on XOR:

https://en.wikipedia.org/wiki/Exclusive_or

This example relies heavily on kdb matrix multiplication - the "mmu" function. Working with matrices in kdb was new to me with this example, and I found mmu fairly fussy the first time around.

https://code.kx.com/q/ref/mmu/
