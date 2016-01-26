function [TC] = unionClasses01(T, uniqueC)
    RANDOMVAR = 2222;

    TC = [];
    for i = 1:size(T,2)
        if sum(T(:,i)) == 1
            TC = [TC, uniqueC(find(T(:,i)))];
        else
            TC = [TC, RANDOMVAR];
        end
    end

    TC = transpose(TC);
end