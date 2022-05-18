
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
    
    k=0:1/N:l1-0.5;
    k2=l1-0.5:1/N:l1;
    k3=l1:1/N:l1+0.5;
    k4=l1+0.5:1/N:(l1+l2);

    hann = 1/2 * (1+cos(2*pi*k2));
    hann2 = 1/2 * (1+cos(2*pi*k3));
    
    %hann at 3 seconds

    a = amplitude1 * sin(2*pi*Hz1*k);
    a2 = ((amplitude1 * sin(2*pi*Hz1*k2)).*hann);
    b = ((amplitude2 * sin(2*pi*Hz2*k3)).*hann2);
    b2 = amplitude2 * sin(2*pi*Hz2*k4);
    
    plot(k, a*0, 'r+', 'MarkerSize', 1, 'LineWidth', 3)
    hold on
    plot(k2, a2)
    plot(k2, hann, 'r+', 'MarkerSize', 1, 'LineWidth', 3)
    hold on
    plot(k3, b)
    plot(k3, hann2, 'r+', 'MarkerSize', 1, 'LineWidth', 3)
    hold on
    plot(k4, b2*0, 'r+', 'MarkerSize', 1, 'LineWidth', 3)
    hold off
    grid

    %plot(k,output);
    title('(d)');
    xlabel('seconds'); 
    ylabel('amplitude');
end

