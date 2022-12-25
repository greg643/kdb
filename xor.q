///// XOR NEURAL NET EXAMPLE

/ The XOR problem is a good starting point for understanding neural nets. 
/ XOR is a logical concept meaning "exclusive OR". Given two inputs, if either one is true, return true; if both are true or both false, return false.
/ Real world example: "Mary is either a singer or a poet (ie, she is not neither, and she is not both)." 
/ This neural net will learn, over a number of iterations, to "predict" that of four possible inputs, and two outputs, the right answer any XOR input.
/ Through repetition, the neural net develops and enhances a system of weights, that ultimately converge on the solution
/ in this particular case, it seems to take around 6,000 repetitions
/ This is a great starting example because it is very simple to understand, has just a few inputs with known outputs
/ Obviously it would be much easier to just program logic to handle XOR inputs, but that's not the point - the point is that we can see how a neural net "learns" to process inputs
/ This was inspired by a kx tutorial, but that didn't seem to work, so i adapted code from python instead
/ Example below is fairly primitive use of kdb, the objective here is to do minimal "wrapping" of the code inside my own functions, and instead keep them as close to raw kdb primitives as possible
/ This example does not use bias units

/ Sources:
/ this is the example i implemented:
/ https://github.com/shayanalibhatti/Coding-neural_network-for-XOR-logic-from-scratch/blob/master/neural_network_xor_logic_from_scratch.ipynb
/ example provided by kx
/ https://code.kx.com/q/wp/neural-networks/
/ for some background on XOR
/ wikipedia: https://en.wikipedia.org/wiki/Exclusive_or

/notes - we rely a lot on the kdb matrix multiplication function here - mmu/$. mmu observes the following dimensional rules:
/count y must match:
/count x where x is a vector
/count first x where x is a matrix

// Inputs and expected target values for XOR problem

inputs:((0 0f);(0 1f);(1 0f);(1 1f));

outputs:0 1 1 0f;

sigmoid:{1%1+exp neg x};

/These are XOR inputs
x:inputs; /np.array([[0,0,1,1],[0,1,0,1]])

/These are XOR outputs
y:outputs; /np.array([[0,1,1,0]])

/Number of inputs
n_x:2;

/Number of neurons in output layer
n_y:1;

/Number of neurons in hidden layer
n_h:2;

/Total training examples
m:(count x);

/Learning rate
lr:0.1;

/Define random seed for consistent results - not used in kdb example
/np.random.seed(2)

/Define weight matrices for neural network
/w1 = np.random.rand(n_h;n_x)
w1:{[x;y]x?1.0}[n_x] each til n_h;

/Weight matrix for hidden layer
/w2 = np.random.rand()   # Weight matrix for output layer
w2:{[x;y]x?1.0}[n_h] each til n_y;

/We will use this list to accumulate losses
losses:();

/learning function
neuralNet:{[w1;w2;x;y;lr]

    /forward propogae
    z1:w1 mmu flip x;
    a1:sigmoid[z1];
    z2:w2 mmu a1;
    a2:sigmoid[z2];

    loss:-1*(1%(count x))*sum((enlist y)*log(a2)+(1-enlist y)*log(1-a2));
  
    /back propagate
    dz2:a2-enlist y;
    dw2:(dz2 mmu flip a1)% (count x);
    dz1:((flip w2) mmu (dz2)) * (a1*(1-a1));
    /dz1:({(w2[x] * (dz2))} each (1+ til count w2)-1) * (a1*(1-a1));
    dw1:(dz1 mmu x) % (count x);

    `losses set (losses,loss); 
    `w2 set w2-lr*dw2;
    `w1 set w1-lr*dw1;
  
};

/prediction function
predict:{[w1;w2;imp]

    /forward propogate
    z1:w1 mmu flip enlist imp;
    a1:sigmoid[z1];
    z2:w2 mmu a1;
    a2:sigmoid[z2];

    ?[a2[0]>=0.5;1;0]

};

///// teach the neural net

do[7000;neuralNet[w1;w2;x;y;lr]];

/// show results

flip (`gate1`gate2`prediction)!(flip inputs,'raze {[zz] predict[w1;w2;inputs[zz]] }  each 0+til 4 )

