function [net] = getPerc(P,T, epochs)
    net = newp(P,T);
    net.trainParam.epochs = epochs;
    net = train(net,P,T);
end