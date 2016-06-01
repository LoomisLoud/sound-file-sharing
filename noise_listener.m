function x = noise_listener()

% Initializing frequencies, and timers
fs = 44100;
listen_for = 7;

% Starting to listen and record the data
recObj = audiorecorder(fs,16,1);
disp('Start speaking.');
recordblocking(recObj, listen_for)
disp('End of Recording.');
signal = getaudiodata(recObj);

% Analyzes the size of the message
m = length(signal);
    
% NFFT
NFFT = 2^nextpow2(m);
y = fft(signal,NFFT)/fs;
Z = 2*abs(y(1:NFFT/2+1));
f = fs/2*linspace(0,1,NFFT/2+1);

% Pick the highest frequency for each interval and then choose one of
% the four

lowest_interesting_freq = round(2*listen_for*100*size(Z,1)/m);

[maxfreqMax, first_indexfreqMax] = max(Z(lowest_interesting_freq:end));

first_indexfreqMax = first_indexfreqMax + lowest_interesting_freq;

maxfreqMax_left = 0;
if first_indexfreqMax > lowest_interesting_freq + 100;
   Z_left = Z(lowest_interesting_freq:first_indexfreqMax-50);
   [maxfreqMax_left, indexfreqMax_left] = max(Z_left);
   indexfreqMax_left = indexfreqMax_left + lowest_interesting_freq;
end

Z_right = Z(first_indexfreqMax+50:end);
[maxfreqMax_right, indexfreqMax_right] = max(Z_right);
indexfreqMax_right = indexfreqMax_right + first_indexfreqMax+50;

switch max([maxfreqMax_left maxfreqMax_right])
   case maxfreqMax_left
      real_freq2 = round(indexfreqMax_left*m/(size(Z,1)*2*listen_for));
   case maxfreqMax_right
      real_freq2 = round((indexfreqMax_right + 50)*m/(size(Z,1)*2*listen_for));
   otherwise
end

real_freq1 = round(first_indexfreqMax*m/(size(Z,1)*2*listen_for));

noise = [roundn(real_freq1,2) roundn(real_freq2,2)]
x = best_frequencies_from_noise(noise(1), noise(2));