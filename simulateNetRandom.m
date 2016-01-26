function [TT, TX, TY, splitedTX, splitedTY, TC] = simulateNetRandom(net, P, T, C, points, unionClasses, minY, maxY, minX, maxX)
    
    uniqueC = unique(C);

    %define the random universe
    %PP = rand(size(P,1),2000);
    %PP = PP -0.5;
    %PP = PP * universeSize * 2;
    
    PPX = rand(1,points);
    PPX = PPX * (maxX - minX);
    PPX = PPX + minX;
    
    PPY = rand(1, points) ;
    PPY = PPY * (maxY - minY);
    PPY = PPY + minY;
    
    PP = [PPX; PPY];
    
    
    TX = transpose(PP(1,:));
    TY = transpose(PP(2,:));

    TT = sim(net,PP);

    TC = unionClasses(TT,uniqueC);
    
    [splitedTX,splitedTY] = splitXY(TX, TY, TC);

end