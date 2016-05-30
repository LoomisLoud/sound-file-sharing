clc
clear

% Sentence to binary
sentence = 'Bonjour sale fils de pute';
binary = dec2bin(double(sentence), 8);
time_bit = 0.2;
time_sync = 1;

% Number of samples by unit of time
fs = 44100;
t = 0:1/fs:time_bit-1/fs;
t_sync = 0:1/fs:time_sync-1/fs;

% Initalizing frequencies and creating four sinusoids for each character
character_count = size(binary(:,1),1);
frequencies = zeros(size(t,2), character_count*4);

for n = 1:size(binary,1)
   frequencies(:, n*4 - 3) = sin(2.*pi.*choose_frequency(bin2dec(binary(n, 1:2))).*t);
   choose_frequency(bin2dec(binary(n, 1:2)))
   frequencies(:, n*4 - 2) = sin(2.*pi.*choose_frequency(bin2dec(binary(n, 3:4))).*t);
   choose_frequency(bin2dec(binary(n, 3:4)))
   frequencies(:, n*4 - 1) = sin(2.*pi.*choose_frequency(bin2dec(binary(n, 5:6))).*t);
   choose_frequency(bin2dec(binary(n, 5:6)))
   frequencies(:, n*4) = sin(2.*pi.*choose_frequency(bin2dec(binary(n, 7:8))).*t);
   choose_frequency(bin2dec(binary(n, 7:8)))
end

reshaped_bin = reshape(binary', 1, numel(binary));
%char(bin2dec(reshape(reshaped_bin, 8, []).')).';

frequencies = reshape(frequencies,1,[]);

sound([sin(2.*pi.*3000.*t_sync) zeros(size(t_sync)) frequencies], fs, 16);