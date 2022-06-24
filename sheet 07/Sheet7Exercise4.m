%b)

%audio files
database_1 = audioread("database_1.wav");
database_2 = audioread("database_2.wav");
database_3 = audioread("database_3.wav");
[query, sample_rate] = audioread("query.wav");

%constellation maps; We can extract the peaks with the function we defined
%in ex.4a (see below)
kappa = 3;
tau = 3;
window_size = 2*sample_rate;
const_1 = extractPeaks(database_1, tau, kappa, window_size);
const_2 = extractPeaks(database_2, tau, kappa, window_size);
const_3 = extractPeaks(database_3, tau, kappa, window_size);
const_query = extractPeaks(query, tau, kappa, window_size);

%inverted lists for the corresponding constellation maps of the databases
LInv_1 = InvertedLists(const_1);
LInv_2 = InvertedLists(const_2);
LInv_3 = InvertedLists(const_3);

%matching functions
[~, matchingfunction_1] = ComputeMatchingFunction(LInv_1,const_query, size(const_1, 2));
[~, matchingfunction_2] = ComputeMatchingFunction(LInv_2,const_query, size(const_2, 2));
[~, matchingfunction_3] = ComputeMatchingFunction(LInv_3,const_query, size(const_3, 2));

%matching with maximum value
value_max = zeros(1,3);
index_max = zeros(1,3);
[value_max(1), index_max(1)] = max(matchingfunction_1);
[value_max(2), index_max(2)] = max(matchingfunction_2);
[value_max(3), index_max(3)] = max(matchingfunction_3);


[~, index_matched] = max(value_max);
disp("The query is inside the following audio file: database "+index_matched)


%Database 3 matches the query. Play the sound from where it starts
start = (index_max(3)+1)*window_size/2-size(query,1);
sound(database_3(start:start+size(query,1)), sample_rate);

%Display time stamps
disp("The time stamps are: "+start+" to "+(start+size(query,1)))



%a)

function [const_map] = extractPeaks(signal, tau, kappa, window_size)
    S = spectrogram(signal, hann(window_size));
    const_map = zeros(size(S));
    for i=1:size(S,1)
        for j=1:size(S,2)
            window = S(max(1,i-kappa):min(size(S,1),i+kappa), max(1,j-tau):min(size(S,2),j+tau));
            window(kappa+1, tau+1) = 0;
            if abs(S(i,j)) > max(abs(window))
                const_map(i,j) = 1;
            end
        end
    end
end