function x = convert2Ascii(freqencies)

if(mod(size(frequencies),4) ~= 0)
    disp('Error: some tuples are missing');
end
word ='';
for n = 1:4:size(frequencies)
    tuple1 = decode_frequencies(frequencies(n));
    tuple2 = decode_frequencies(frequencies(n+1));
    tuple3 = decode_frequencies(frequencies(n+2));
    tuple4 = decode_frequencies(frequencies(n+3));
    
    binaryLetter = strcat(tuple1,tuple2,tuple3,tuple4);
    
    decimalLetter = bin2dec(binaryLetter);
    letter = double(num2str(decimalLetter));
    word = strcat(word,letter);
end

x = word;