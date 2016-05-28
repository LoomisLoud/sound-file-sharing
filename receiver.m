clc
clear

fs = 8192; %Hz
t=0:1/fs:1-1/fs;

recObj = audiorecorder(fs,16,1);
disp('Start speaking.')
recordblocking(recObj, 8);
disp('End of Recording.');
x = getaudiodata(recObj);

%x = sin(2*pi*500*t) + sin(2*pi*2000*t) + sin(2*pi*3500*t);

%x = sin(2*pi*500*t);

signalDep = sin(2*pi*500*t);
c = conv(x,signalDep);
[maxConv, indexConv] = max(c);


m = length(x);

NFFT = 2^nextpow2(m);
y = fft(x,NFFT)/fs;
Z = 2*abs(y(1:NFFT/2+1));
f = fs/2*linspace(0,1,NFFT/2+1);

%plot(c)
%plot(f, Z)
