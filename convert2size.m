function x = convert2size(band, frequencies)

if(mod(size(frequencies),4) ~= 0)
    disp('Error: some tuples are missing');
end

tuple1 = decode_frequency(band, frequencies(1));
tuple2 = decode_frequency(band, frequencies(2));
tuple3 = decode_frequency(band, frequencies(3));
tuple4 = decode_frequency(band, frequencies(4));
    
binaryLetter = strcat(tuple1,tuple2,tuple3,tuple4);

sizeDec = bin2dec(binaryLetter);

x = sizeDec;