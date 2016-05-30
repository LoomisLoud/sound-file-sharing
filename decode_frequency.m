function x = decode_frequency(freq)

frequency_band = [4000 5000 6000 7000];

switch freq
   case frequency_band(1)
      x = dec2bin(0,2);
   case frequency_band(2)
      x = dec2bin(1,2);
   case frequency_band(3)
      x = dec2bin(2,2);
   case frequency_band(4)
      x = dec2bin(3,2);
   otherwise
      'Not found'
end