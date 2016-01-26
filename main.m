M = load('podaciB1.txt');

%randomizes the input ( if needed )
M = randomize(M);

%split the input, X,Y and C are 3 columns in M, splitedVars are X and Y
%splited using the vector C
[X,Y,splitedX, splitedY, C] = splitInput(M);

%plot input data
plot (splitedX, splitedY, '.');

%prepare input for training the net
[P,T] = prepareNet(X,Y,C);

%train and get perceptron network, pass the number of epochs
net = getPerc(P,T, 10);

% simulate network with random data or with the train data
% passing function that unions three outputs of network to single vector
% for random data, pass the size of the universe
[TT, TX, TY, splitedTX, splitedTY, TC] = simulateNetRandom(net, P, T, C, 50000, @unionClasses01, -10,10,-10,15);
[TT, TX, TY, splitedTX, splitedTY, TC] = simulateNetWithSame(net, P, T, C, @unionClasses01);

%plot the data from simulation
plot(splitedTX,splitedTY, '.');

%train and get feedforward network, third argument is the number of neurons
%in hidden layers, fourth are functions, fifth is number of epochs, sixth
%is goal, seventh is useEarlyStopping
netff = getFeedforward(P,T,[8],{'logsig'}, 100, 1e-10, 1e-8, 0);

% same as above
[TT, TX, TY, splitedTX, splitedTY, TC] = simulateNetRandom(netff, P, T, C, 50000, @unionClassesMax, -25,20,-30,30);
[TT, TX, TY, splitedTX, splitedTY, TC] = simulateNetWithSame(netff, P, T, C, @unionClassesMax);

%same as above
plot(splitedTX,splitedTY, '.');

% plots the confusion matrix
plotconfusion(T,TT);