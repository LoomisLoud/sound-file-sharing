clc
clear

fs = 32768; %Hz
t=0:1/fs:1-1/fs;
timeListen = 8;

recObj = audiorecorder(fs,16,1);
disp('Start speaking.')
recordblocking(recObj, timeListen);
disp('End of Recording.');
x = getaudiodata(recObj);

%plot(x)

signalDep = sin(2*pi*3000*t);
c = conv(x,signalDep);
[maxConv, indexConv] = max(c);
a = 1;
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

for n = timeStart:timeSignal:timeStart + 3*timeSignal
    tuple = x(n:n+timeSignal);
    m = length(tuple);
    NFFT = 2^nextpow2(m);
    y = fft(tuple,NFFT)/fs;
    Z = 2*abs(y(1:NFFT/2+1));
    f = fs/2*linspace(0,1,NFFT/2+1);
    [maxZ, indexZ] = max(Z(5000:end));
    %indexDeZ = indexZ+5000
    freq = (indexZ+5000-1)/2
    plot(f,Z);
end
