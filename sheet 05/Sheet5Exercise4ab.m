
%sampling frequency
N=5000;

%frequencies of the signals
Hz1 = 1;
Hz2 = 5;

%length of the signals
l1 = 3;
l2 = 3;

%amplitudes
amplitude1 = 1;
amplitude2 = 0.5;

functiona(Hz1,Hz2,N, l1, l2, amplitude1, amplitude2);

function[] = functiona(Hz1, Hz2, N, l1, l2, amplitude1, amplitude2)
    
    k=0:1/N:l1;
    k2=l1:1/N:(l1+l2);
    a = amplitude1 * sin(2*pi*Hz1*k);
    b = amplitude2 * sin(2*pi*Hz2*k2);
    

    
    plot(k, a)
    hold on
    plot(k2, b)
    hold off
    grid

    %plot(k,output);
    title('(a), (b)');
    xlabel('seconds'); 
    ylabel('amplitude');
end

