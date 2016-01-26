function [TT, TX, TY, splitedTX, splitedTY, TC] = simulateNetWithSame(net, P, T, C, unionClasses)
    
    uniqueC = unique(C);

    TX = transpose(P(1,:));
    TY = transpose(P(2,:));

    TT = sim(net,P);

    TC = unionClasses(TT,uniqueC);
    
    [splitedTX,splitedTY] = splitXY(TX, TY, TC);

end