clc
clear

% Sentence to binary
sentence = 'B';
binary = dec2bin(double(sentence), 8)

% Number of samples by unit of time
fs = 8192; % Hz1
t = 0:1/fs:1-1/fs; % seconds

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

size(binary,1)
reshaped_bin = reshape(binary', 1, numel(binary));
%char(bin2dec(reshape(reshaped_bin, 8, []).')).';

frequencies = reshape(frequencies,1,[]);
size(frequencies)

%sound(frequencies, fs, 16);
%sound(sin(2.*pi.*3500.*t) + sin(2.*pi.*1000.*t) + sin(2.*pi.*2000.*t), fs, 16);
sound([sin(2.*pi.*3000.*t) zeros(size(t)) frequencies], fs, 16);