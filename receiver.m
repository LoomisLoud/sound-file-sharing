% clc
% clear

% Initializing frequencies, and timers
fs = 44100;
t=0:1/fs:1-1/fs;

freq = [5000 6000 7000 8000];
sync_freq = 3000;
range = 10;
time_bit = 0.1;

signalDep = sin(2*pi*sync_freq*t);
size_result = zeros(1,4);

% Starting to listen and record the data
% recObj = audiorecorder(fs,16,1);
% disp('Start speaking.')
% record(recObj)
% pause;
% stop(recObj)
% disp('End of Recording.');
% signal = getaudiodata(recObj);

% Convolutions the 3 first seconds of the signal with the corresponding frequency to find the
% start of the signal
c = conv(signal(1:3*fs),signalDep);
[maxConv, indexConv] = max(c);
timeStart = indexConv+fs;

 count = 0;
countSize = 0;

% Analyzes the size of the message
for n = timeStart:fs:timeStart + 3*fs
    countSize = countSize + 1;
    tuple = signal(n:n+fs-1);
    m = length(tuple);
    
    % NFFT
    NFFT = 2^nextpow2(m);
    y = fft(tuple,NFFT)/fs;
    Z = 2*abs(y(1:NFFT/2+1));
    f = fs/2*linspace(0,1,NFFT/2+1);
    
    % Taking a small range around the 4 chosen frequencies
    frequency_interval_1 = Z(round(2*freq(1)*size(Z)/m)-range:round(2*freq(1)*size(Z)/m)+range);
    frequency_interval_2 = Z(round(2*freq(2)*size(Z)/m)-range:round(2*freq(2)*size(Z)/m)+range);
    frequency_interval_3 = Z(round(2*freq(3)*size(Z)/m)-range:round(2*freq(3)*size(Z)/m)+range);
    frequency_interval_4 = Z(round(2*freq(4)*size(Z)/m)-range:round(2*freq(4)*size(Z)/m)+range);

    % Pick the highest frequency for each interval and then choose one of
    % the four
    [maxfreq1, indexfreq1] = max(frequency_interval_1);
    [maxfreq2, indexfreq2] = max(frequency_interval_2);
    [maxfreq3, indexfreq3] = max(frequency_interval_3);
    [maxfreq4, indexfreq4] = max(frequency_interval_4);

    switch max([maxfreq1 maxfreq2 maxfreq3 maxfreq4])
        case maxfreq1
            chosen_frequency = freq(1);
        case maxfreq2
            chosen_frequency = freq(2);
        case maxfreq3
            chosen_frequency = freq(3);
        case maxfreq4
            chosen_frequency = freq(4);
        otherwise
            disp('Not found')
    end
    
    size_result(countSize) = chosen_frequency;
end

size_message = convert2size(freq, size_result);

numberOfTuples = size_message*4;
timeSignal = round(time_bit*fs);
result = zeros(1,numberOfTuples);

timeStartMessage = timeStart + 5*fs;
for n = timeStartMessage:timeSignal:timeStartMessage + (numberOfTuples - 1)*timeSignal
    count = count + 1;
    tuple = signal(n:n+timeSignal-1);
    m = length(tuple);

    % NFFT
    NFFT = 2^nextpow2(m);
    y = fft(tuple,NFFT)/fs;
    Z = 2*abs(y(1:NFFT/2+1));
    f = fs/2*linspace(0,1,NFFT/2+1);

    % Taking a small range around the 4 chosen frequencies
    frequency_interval_1 = Z(round(2*time_bit*freq(1)*size(Z)/m)-range:round(2*time_bit*freq(1)*size(Z)/m)+range);
    frequency_interval_2 = Z(round(2*time_bit*freq(2)*size(Z)/m)-range:round(2*time_bit*freq(2)*size(Z)/m)+range);
    frequency_interval_3 = Z(round(2*time_bit*freq(3)*size(Z)/m)-range:round(2*time_bit*freq(3)*size(Z)/m)+range);
    frequency_interval_4 = Z(round(2*time_bit*freq(4)*size(Z)/m)-range:round(2*time_bit*freq(4)*size(Z)/m)+range);

    % Pick the highest frequency for each interval and then choose one of
    % the four
    [maxfreq1, indexfreq1] = max(frequency_interval_1);
    [maxfreq2, indexfreq2] = max(frequency_interval_2);
    [maxfreq3, indexfreq3] = max(frequency_interval_3);
    [maxfreq4, indexfreq4] = max(frequency_interval_4);

    switch max([maxfreq1 maxfreq2 maxfreq3 maxfreq4])
        case maxfreq1
            chosen_frequency = freq(1);
        case maxfreq2
            chosen_frequency = freq(2);
        case maxfreq3
            chosen_frequency = freq(3);
        case maxfreq4
            chosen_frequency = freq(4);
        otherwise
            disp('Not found')
    end
    
    result(count) = chosen_frequency;
end
 
celldisp(convert2Ascii(freq, result));