# XOR Neural Net

I wanted to understand neural nets in more detail to develop an intuitive understanding of what a neural net actually is and how it works. I started this project before the explosion of LLMs in 2023 but turns out this was a great way to understand the current explosion of interest in AI.

Code: https://github.com/greg643/kdb/blob/main/xor.q

## What is a neural net?

The simplest description I can come up with for a neural net is that it is a mathematical representation of what it looks like to learn by trial and error. You take an action, it works, or it doesn't, and you "learn" from that - it gets encoded. As you repeat and get better, the solution "clicks" and recalls - such as how to align muscles to accurately throw a football  to a target - and can adapt over time as things change: a heavier football, throwing to a moving target, or on a windy day.

Now, the human mind is not as simple as a neural net, but I imagine that elements of how neurons "learn" are similar to what we see in a weight matrix. The difference between the human mind and a raw weight matrix is probably many optimizations, overlays, and "pre-optimizations" encoded in our genetics, but ultimately the process of trying, failing, and trying again until we achieve success creates encodings in our neurons in a similar manner.

Creating a computational neural net is achieved through a set of formulas that update a matrix of output weights. The size of the weight matrix will vary based on the problem being solved. Through repetition, the weights will converge to values that allow the network to dynamically store relationships between inputs and outputs, in essence "predicting" the outcome. The magic of a neural net is that solely by using this weight matrix, without having any "understanding" a human can conceive of in terms of logic, such as "if-then" optimizations, can converge to a solution using only the weights.

## The XOR Problem

XOR is a simple logical concept meaning "exclusive OR", one of sixteen bitwise used on binary inputs, such as in the logic of a CPU. XOR is a simple construct: given two inputs, if either one is true, return true; but if both are true or both are false, return false. The XOR problem is a great starting point for understanding a neural net.

A real-world example of this logic is: "Mary is either a singer or a poet (meaning, she is not neither, and she is not both)." 

XOR can be trivially coded as an "if" statement, which makes the use of a neural net humorously complex by comparison. This is why the beginner can easily miss the significance of a neural net. For example, in kdb, one if statement with an "and/or" evaluation can trivially solve the XOR problem: 

```
  if[((x=0)&(y=0))|((x=1)&(y=1));0;1]
```

XOR is useful as a learning example for neural nets precisely because it is overkill: the constrained inputs and outputs mean that we can use a small number of layers, and with constrained inputs and outputs, checking the outputs is much easier.

## How does a neural net solve this problem?

Using a neural net for a problem this simple is like using a sledgehammer to kill an ant. To replicate the elegance of the solution above with a neural net requires thousands of iterations, using much more complex code, to achieve the same thing. In this particular case, with the default variables shown, it seems to take around 7,000 repetitions to solve XOR.

What is hopefully much more impressive here is that this neural net will learn, over a number of iterations, to "predict" XOR results without any specific logic to understand the problem. 

In conclusion, the magic of the neural net is that we can see how a collection of formulas, plus repetition, can build upon itself and "learn" through repetition by updating weights, to the point where the weights will reflect the same result as a strict logical rule. 

If you imagine scaling a neural net to different contexts, such as problems where the output is not as rigidly defined and can change over time, then a neural net can serve as a flexible tool for prediction.

## Why write this in kdb?

The code I used here was originally inspired by a kx tutorial, but the kx tutorial was alternatively less detailed and more complicated than needed (and didn't seem to work), so I instead found a good Python example that worked and then adapted that code instead. Python served as a check, so I was able to debug my kdb code at each step by comparing it to the equivalent result from Python.

Now, I can already hear folks saying, "This is why Python is superior for data science," and I'm not going to argue it - there's a lot of merit to that view. As a personal project - since I already do so much work in kdb, my preference is to stay in kdb as much as possible, inspiring this example. 

I like to keep my code very simple. My personal rules for coding in kdb are (1) use language primitives wherever possible; (2) prefer slightly more verbose implementations; (3) all else equal, prefer simpler implementations.

I imagine there are smarter ways to achieve everything I did here, particularly my deus ex machina of (a) skipping iteration with dictionaries, (b) "setting" global variables to manage the core weight updates, and (c) "learning" through a simple do command. 

If you have a smarter way, let me know!

## Sources

This is the example I ultimately implemented:

https://github.com/shayanalibhatti/Coding-neural_network-for-XOR-logic-from-scratch/blob/master/neural_network_xor_logic_from_scratch.ipynb

This is the original example that inspired me, provided by kx. I used some pieces, but overall didn't work for me:

https://code.kx.com/q/wp/neural-networks/

Wikipedia background on XOR:

https://en.wikipedia.org/wiki/Exclusive_or

This example relies heavily on kdb matrix multiplication - the "mmu" function. Working with matrices in kdb was new to me with this example, and I found mmu fairly fussy as a first time user. More to learn here.

https://code.kx.com/q/ref/mmu/

# Candyland

Our version of Candyland is several years old, and I realized that cards were missing and some were starting to rip. Before the deck of cards was too far gone, I decided to create a simple program to recreate the deck of Candyland cards, and then I realized with a little more effort, I could replace the entire deck with a script, track whose turn it was, and reshuffle the deck when it was exhausted.

Code: https://github.com/greg643/kdb/blob/main/candyland.q

This is a simple and fun example of dynamic list creation, random selection without replacement, updating global variables, and putting it all together into something you can actually use to play a game. 

Drawing a real candyland card from a deck is a lot more tangibly satisfying than clicking a button on your computer, but this approach also saves time for shuffling cards, drawing them and replacing them. 

Considering the simplicity of Candyland for bigger kids, this can make the game into a novelty - we wound up playing "speed Candyland" where winner would be best of 3 or best of 5. 

Hope you enjoy!


