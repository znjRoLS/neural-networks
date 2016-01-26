function [net] = getFeedforward(P,T,arrSizes, arrFunctions, epochs, goal, min_grad, useEarlyStopping)
    net = newff(P, T,arrSizes,arrFunctions,'traingdm');
    net.trainParam.epochs = epochs;
    net.trainParam.goal = goal;
    net.trainFcn = 'trainlm';
    net.trainParam.min_grad = min_grad;
    if (useEarlyStopping == 0)
        net.divideFcn = '';
    end;
    net = train(net, P, T);
end