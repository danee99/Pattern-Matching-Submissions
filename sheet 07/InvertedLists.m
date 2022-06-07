% Solutions to Exercise 7.3
% by Raphael Wude, Claude Jordan, Martin Brückmann, Daniel Degenstein

% a)
function [invLists] = InvertedLists(conMap)
    invLists = {};
    for i=1:size(conMap, 1)
        invLists{i} = find(conMap(i,:));
    end
end