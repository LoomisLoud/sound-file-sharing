function x = convert2Ascii(frequencies)

if(mod(size(frequencies),4) ~= 0)
    disp('Error: some tuples are missing');
end
word ='';

for n = 1:4:size(frequencies(:))
    n
    tuple1 = decode_frequency(frequencies(n));
    tuple2 = decode_frequency(frequencies(n+1));
    tuple3 = decode_frequency(frequencies(n+2));
    tuple4 = decode_frequency(frequencies(n+3));
    
    binaryLetter = strcat(tuple1,tuple2,tuple3,tuple4);
    
    
    letter = char(bin2dec(binaryLetter));
    word = strcat(word,letter);
end

x = word;