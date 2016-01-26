function [M] = randomize(M)
   matSize = size(M,1);
   randomPerm = randperm(matSize);
   tempM = [];
   for i = 1:size(M,1);
       tempM = [tempM;M(randomPerm(i),:)];
   end;
   M = tempM;
end