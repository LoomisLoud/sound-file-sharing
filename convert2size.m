function x = convert2size(band, frequencies)

if(mod(size(frequencies),4) ~= 0)
    disp('Error: some tuples are missing');
end
sizeDec = 0;

for n = 1:4:size(frequencies(:))
    tuple1 = decode_frequency(band, frequencies(n));
    tuple2 = decode_frequency(band, frequencies(n+1));
    tuple3 = decode_frequency(band, frequencies(n+2));
    tuple4 = decode_frequency(band, frequencies(n+3));
    
    binaryLetter = strcat(tuple1,tuple2,tuple3,tuple4);
    
    sizeDec = bin2dec(binaryLetter);
end

x = sizeDec;