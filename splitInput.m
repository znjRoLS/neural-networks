function [X, Y, splitedX, splitedY, C] = splitInput(M)
    X = M(:,2);
    Y = M(:,1);
    C = M(:,3);

    [splitedX, splitedY] = splitXY(X,Y,C);
    
end