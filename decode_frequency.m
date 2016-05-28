function x = decode_frequency(freq)

frequency_band = [3600 3800 4000 4200];

if freq > frequency_band(1)-100 & freq < frequency_band(1)+100
   x = 0;
elseif freq > frequency_band(2)-100 & freq < frequency_band(2)+100
   x = 1;
elseif freq > frequency_band(3)-100 & freq < frequency_band(3)+100
   x = 2;
elseif freq > frequency_band(4)-100 & freq < frequency_band(4)+100
   x = 3;
else
      'Not found'
end