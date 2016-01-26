function [TC] = unionClassesMax(T, uniqueC)
    
    TC = [];
    for i = 1:size(T,2)
        [nesto,nesto1] = max(T(:,i));
        TC = [TC, uniqueC(nesto1)];
    end
    
    TC = transpose(TC);
end