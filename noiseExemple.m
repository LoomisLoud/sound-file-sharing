clc
clear

time_bit = 45;
fs = 44100;
t = 0:1/fs:time_bit-1/fs;

frequency1 = sin(2 * pi * 6000 * t);
frequency2 = sin(2 *pi * 13000 * t);

frequencyFinal = frequency1 + frequency2;
 m = length(frequencyFinal);
    
    % NFFT
    NFFT = 2^nextpow2(m);
    y = fft(frequencyFinal,NFFT)/fs;
    Z = 2*abs(y(1:NFFT/2+1));
    f = fs/2*linspace(0,1,NFFT/2+1);
   % plot(f,Z);
sound(frequencyFinal, fs);