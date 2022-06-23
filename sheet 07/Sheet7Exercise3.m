% Solutions to Exercise 7.3
% by Raphael Wude, Claude Jordan, Martin Brückmann, Daniel Degenstein

% c)

% data from chapter 4, slide 16
D = [1 1 0 1 0 1 0; 0 0 1 0 1 0 0; 1 0 0 1 0 1 0; 0 0 0 1 1 0 0];
Q = [0 0 0; 1 0 1; 0 1 0; 0 1 1];
correct_indfns = [0 0 0 0 1 0 1 0 0 0; 0 1 0 0 1 0 1 0 0 0; 0 0 0 0 1 1 0 0 0 0; 0 0 1 0 1 0 0 0 0 0; 0 0 0 1 1 0 0 0 0 0];
correct_mfn = [0 1 1 1 5 1 2 0 0 0];

% compute indicator and matching function
L = InvertedLists(D);
[invf, mf] = ComputeMatchingFunction(L,Q,7);

% check if the result are correct
all(correct_indfns == invf, 'all')
all(correct_mfn == mf, 'all')
