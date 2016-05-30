clc
clear

fs = 44100; %Hz
t=0:1/fs:1-1/fs;
timeListen = 4;

recObj = audiorecorder(fs,16,1);
disp('Start speaking.')
recordblocking(recObj, timeListen);
disp('End of Recording.');
x = getaudiodata(recObj);

%plot(x)

signalDep = sin(2*pi*3000*t);
c = conv(x,signalDep);
[maxConv, indexConv] = max(c);
a = 0.2;
timeSignal = round(a*fs);
timeStart = indexConv+fs;

% mX = length(x);
% NFFTX = 2^nextpow2(mX);
% yX = fft(x,NFFTX)/fs;
% ZX = 2*abs(yX(1:NFFTX/2+1));
% fX = fs/2*linspace(0,1,NFFTX/2+1);
% 
% 
% plot(fX,ZX)
freq = [4000 5000 6000 7000];
range = 10;
%plot(x)
for n = timeStart:timeSignal:timeStart + 3*timeSignal
    
    tuple = x(n:n+timeSignal-1);
    m = length(tuple);
    
    
    NFFT = 2^nextpow2(m);
    y = fft(tuple,NFFT)/fs;    
    Z = 2*abs(y(1:NFFT/2+1));
    f = fs/2*linspace(0,1,NFFT/2+1);
    
    
    I1 = Z(round(2*a*freq(1)*size(Z)/m)-range:round(2*a*freq(1)*size(Z)/m)+range);   
    I2 = Z(round(2*a*freq(2)*size(Z)/m)-range:round(2*a*freq(2)*size(Z)/m)+range);
    I3 = Z(round(2*a*freq(3)*size(Z)/m)-range:round(2*a*freq(3)*size(Z)/m)+range);
    I4 = Z(round(2*a*freq(4)*size(Z)/m)-range:round(2*a*freq(4)*size(Z)/m)+range);
    
    [maxI1, indexI1] = max(I1);
    [maxI2, indexI2] = max(I2);
    [maxI3, indexI3] = max(I3);
    [maxI4, indexI4] = max(I4);
    
    %maximum = [maxI1 maxI2 maxI3 maxI4];
    
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
    b

   % plot(f,Z)
end
