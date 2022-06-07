% Solutions to Exercise 7.3
% by Raphael Wude, Claude Jordan, Martin Brückmann, Daniel Degenstein

% b)
function [indfunc, matchfunc] = ComputeMatchingFunction(inlist,cq,dataLen)
    [I,J] = ind2sub(size(cq), find(cq));
    queryPoints = cat(2,J-1,I);
    queryLen = size(cq, 2);

    indfunc = zeros(size(queryPoints,1),dataLen+queryLen);
    for i=1:size(queryPoints,1)
        m = queryPoints(i,1);
        k = queryPoints(i,2);
        L = inlist(k);
        L = L{1}-m;
        for n=-queryLen+1:dataLen
            if ismember(n,L)
                indfunc(i,n+queryLen-1) = 1;
            end
        end
    end
    matchfunc = sum(indfunc, 1);
end
