% Solutions to Exercise 5.1
% by Raphael Wude, Claude Jordan, Martin Brückmann, Daniel Degenstein

%values for c)
y=[1 3 2 0 1];
x=[3 1 0 0 2];
s = cyclic_convolution(x,y);
%plots for c)
subplot(1,2,1);
plot(s);
title('cyclic convolution c)');
xlabel('index');
ylabel('value');

%values for d)
x2 = [1 3 2];
y2 = [2 3];
s2 = cyclic_convolution(x2,y2);
%plots for d)
subplot(1,2,2);
plot(s2)
title('cyclic convolution d)');
xlabel('index');
ylabel('value');

%function for the cylclic convolution of two vectors
function[sol] = cyclic_convolution(x,y)
    if length(x) == length(y) %if both vectors has the same dimensiom
        n = length(x);
        z=x;
        q=y;
    elseif length(x) > length(y) %if x has a larger dimension
        n = length(x);
        z = x;
        q = zeros(n);
        for i= 1:length(y)
            q(i) = y(i);
        end

    else %if y has a larger dimension
        n = length(y);
        z = zeros(1,n);
        q = y;
        for i= 1:length(x)
            z(i) = x(i);
        end
    end
    % solves the quotation
    sol = zeros(1,n);
    for i= 0:n-1
        sum = 0;
        for j = 0:n-1
            sum = sum + (z(j+1) * q(mod((i-j),n)+1));
        end
        sol(i+1) = sum;
    end
end
