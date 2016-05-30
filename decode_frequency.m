function x = decode_frequency(band, freq)

switch freq
   case band(1)
      x = dec2bin(0,2);
   case band(2)
      x = dec2bin(1,2);
   case band(3)
      x = dec2bin(2,2);
   case band(4)
      x = dec2bin(3,2);
   otherwise
      'Not found'
end