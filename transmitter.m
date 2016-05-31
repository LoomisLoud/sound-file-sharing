clc
clear

freq = [3000 6000 9000 12000];
sync_freq = 3000;

% Sentence to binary
sentence = 'Bonjour je teste le nombre de caracteres :D Jespere que tout va marcher. Et suce quand meme mes boules !!! Il manque encore quelques caratere ! Bite, chatte !!!';
size_sentence_bin = dec2bin(size(sentence,2), 8);
binary = dec2bin(double(sentence), 8);

time_bit = 0.1;
time_sync = 1;

% Number of samples by unit of time
fs = 44100;
t = 0:1/fs:time_bit-1/fs;
t_sync = 0:1/fs:time_sync-1/fs;

% Initalizing frequencies and creating four sinusoids for each character
character_count = size(binary(:,1),1);
frequencies_sentence_size = zeros(size(t_sync,2), 4);
frequencies = zeros(size(t,2), character_count*4);

% Send the size of the array
frequencies_sentence_size(:, 1) = sin(2.*pi.*choose_frequency(freq, bin2dec(size_sentence_bin(1, 1:2))).*t_sync);
frequencies_sentence_size(:, 2) = sin(2.*pi.*choose_frequency(freq, bin2dec(size_sentence_bin(1, 3:4))).*t_sync);
frequencies_sentence_size(:, 3) = sin(2.*pi.*choose_frequency(freq, bin2dec(size_sentence_bin(1, 5:6))).*t_sync);
frequencies_sentence_size(:, 4) = sin(2.*pi.*choose_frequency(freq, bin2dec(size_sentence_bin(1, 7:8))).*t_sync);

frequencies_sentence_size = reshape(frequencies_sentence_size,1,[]);

% Send the signal
for n = 1:size(binary,1)
   frequencies(:, n*4 - 3) = sin(2.*pi.*choose_frequency(freq, bin2dec(binary(n, 1:2))).*t);
   frequencies(:, n*4 - 2) = sin(2.*pi.*choose_frequency(freq, bin2dec(binary(n, 3:4))).*t);
   frequencies(:, n*4 - 1) = sin(2.*pi.*choose_frequency(freq, bin2dec(binary(n, 5:6))).*t);
   frequencies(:, n*4) = sin(2.*pi.*choose_frequency(freq, bin2dec(binary(n, 7:8))).*t);
end

frequencies = reshape(frequencies,1,[]);

% Sequence is: 1sec sync tuple, 1 sec silence, 4 sec size sentence, 1 sec
% silence, full sentence transmission
sound([sin(2.*pi.*sync_freq.*t_sync) zeros(size(t_sync)) frequencies_sentence_size zeros(size(t_sync)) frequencies], fs, 16);