clc
clear

phrase = 'B';
binary = dec2bin(double(phrase), 8)

fs = 30000; % Hz1
t = 0:1/fs:1; % seconds

size(sin(2.*pi.*500.*t))

character_count = size(binary(:,1),1);
frequencies = zeros(size(t,2), character_count*4);

for n = 1:size(binary,1)
   frequencies(:, n*4) = sin(2.*pi.*choose_frequency(bin2dec(binary(n, 1:2))).*t);
   frequencies(:, n*4 - 3) = sin(2.*pi.*choose_frequency(bin2dec(binary(n, 3:4))).*t);
   frequencies(:, n*4 - 2) = sin(2.*pi.*choose_frequency(bin2dec(binary(n, 5:6))).*t);
   frequencies(:, n*4 - 1) = sin(2.*pi.*choose_frequency(bin2dec(binary(n, 7:8))).*t);
end

reshaped_bin = reshape(binary', 1, numel(binary));
char(bin2dec(reshape(reshaped_bin, 8, []).')).';

frequencies = reshape(frequencies,1,[]);
size(frequencies)

sound(frequencies, fs, 16)