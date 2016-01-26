function [splitX,splitY] = splitXY(XX, YY, C)
    
    splitX = [];
    splitY = [];

    % magic number !!!
    PAD = max(size(XX));
    
    uniqueTC = unique(C);

    for i = 1:size(uniqueTC, 1)
        thisX = [];
        thisY = [];
        for j = 1:size(XX,1)
            if C(j) == uniqueTC(i)
                thisX = [thisX, XX(j)];
                thisY = [thisY, YY(j)];
            end
        end
        thisX = transpose(thisX);
        thisX = padarray(thisX, PAD - size(thisX,1), 'replicate', 'post');
        thisX = transpose(thisX);
        thisY = transpose(thisY);
        thisY = padarray(thisY, PAD - size(thisY,1), 'replicate', 'post');
        thisY = transpose(thisY);
        splitX = [splitX;thisX];
        splitY = [splitY;thisY];
    end

    splitX = transpose(splitX);
    splitY = transpose(splitY);

end