

% Initializing frequencies, and timers
fs = 44100;

% Starting to listen and record the data
% recObj = audiorecorder(fs,16,1);
% disp('Start speaking.');
% recordblocking(recObj, 5)
% disp('End of Recording.');
% signal = getaudiodata(recObj);

% Analyzes the size of the message
m = length(signal);
    
% NFFT
NFFT = 2^nextpow2(m);
y = fft(signal,NFFT)/fs;
Z = 2*abs(y(1:NFFT/2+1));
f = fs/2*linspace(0,1,NFFT/2+1);
    
% Pick the highest frequency for each interval and then choose one of
% the four
[maxfreqMax, first_indexfreqMax] = max(Z);

Z_left = Z(1:first_indexfreqMax-50);
[maxfreqMax_left, indexfreqMax_left] = max(Z_left);

Z_right = Z(first_indexfreqMax+50:end);
[maxfreqMax_right, indexfreqMax_right] = max(Z_right);

second_indexfreqMax = max([indexfreqMax_left indexfreqMax_right]);

real_freq1 = round(first_indexfreqMax*m/(size(Z,1)*2*5))
real_freq2 = round(second_indexfreqMax*m/(size(Z,1)*2*5))

