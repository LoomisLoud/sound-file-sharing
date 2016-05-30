% clc
% clear

fs = 44100; %Hz
t=0:1/fs:1-1/fs;
timeListen = 8;

% recObj = audiorecorder(fs,16,1);
% disp('Start speaking.')
% recordblocking(recObj, timeListen);
% disp('End of Recording.');
% x = getaudiodata(recObj);

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
freq = [4000 5000 6000 7000];
range = 100;
%plot(x)
for n = timeStart:timeSignal:timeStart + 3*timeSignal
    
    tuple = x(n:n+timeSignal-1);
    m = length(tuple);
    NFFT = 2^nextpow2(m);
    y = fft(tuple,NFFT)/fs;    
    Z = 2*abs(y(1:NFFT/2+1));
    f = fs/2*linspace(0,1,NFFT/2+1);

    I1 = Z(freq(1)-range:freq(1)+range);   
    I2 = Z(freq(2)-range:freq(2)+range)
    I3 = Z(freq(3)-range:freq(3)+range);
    I4 = Z(freq(4)-range:freq(4)+range);
    
    
    [maxI1, indexI1] = max(I1);
    [maxI2, indexI2] = max(I2)
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
    b
    %plot(f,Z)
    pause
end
