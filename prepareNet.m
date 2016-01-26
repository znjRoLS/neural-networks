function [P,T] = prepareNet(X,Y,C)
    P = [X,Y];
    P = transpose(P);
    T = [];

    uniqueC = unique(C);
    
    for i = 1:size(uniqueC, 1)
        thisT = [];
        for j = 1:size(X, 1)
            if C(j) == uniqueC(i)
                thisT = [thisT,1];
            else
                thisT = [thisT,0];
            end
        end
        T = [T;thisT];
    end
end