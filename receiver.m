% clc
% clear

fs = 44100;
t=0:1/fs:1-1/fs;

freq = [4000 7000 10000 13000];
range = 10;
numberOfTuples = 100;
time_bit = 0.2;
timeListen = numberOfTuples*time_bit + 5;

signalDep = sin(2*pi*3000*t);
timeSignal = round(time_bit*fs);

result = zeros(1,numberOfTuples);

% recObj = audiorecorder(fs,16,1);
% disp('Start speaking.')
% recordblocking(recObj, timeListen);
% disp('End of Recording.');
% x = getaudiodata(recObj);

c = conv(x(1:3*fs),signalDep);
[maxConv, indexConv] = max(c);
timeStart = indexConv+fs;

count = 0;
for n = timeStart:timeSignal:timeStart + (numberOfTuples - 1)*timeSignal
    count = count + 1;
    tuple = x(n:n+timeSignal-1);
    m = length(tuple);
    
    NFFT = 2^nextpow2(m);
    y = fft(tuple,NFFT)/fs;    
    Z = 2*abs(y(1:NFFT/2+1));
    f = fs/2*linspace(0,1,NFFT/2+1);
    
    I1 = Z(round(2*time_bit*freq(1)*size(Z)/m)-range:round(2*time_bit*freq(1)*size(Z)/m)+range);   
    I2 = Z(round(2*time_bit*freq(2)*size(Z)/m)-range:round(2*time_bit*freq(2)*size(Z)/m)+range);
    I3 = Z(round(2*time_bit*freq(3)*size(Z)/m)-range:round(2*time_bit*freq(3)*size(Z)/m)+range);
    I4 = Z(round(2*time_bit*freq(4)*size(Z)/m)-range:round(2*time_bit*freq(4)*size(Z)/m)+range);
    
    [maxI1, indexI1] = max(I1);
    [maxI2, indexI2] = max(I2);
    [maxI3, indexI3] = max(I3);
    [maxI4, indexI4] = max(I4);
    
    switch max([maxI1 maxI2 maxI3 maxI4])
        case maxI1
            b = freq(1);
        case maxI2
            b = freq(2);
        case maxI3
            b = freq(3);
        case maxI4
            b = freq(4);
        otherwise
            'Not found'
    end       
    result(count) = b;
end
n = 'hello'
convert2Ascii(result)