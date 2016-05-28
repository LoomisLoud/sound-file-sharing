function x = decode_frequency(freq)

frequency_band = [3600 3700 3800 3900];
range = 20

if freq > frequency_band(1)-range & freq < frequency_band(1)+range
   x = 0;
elseif freq > frequency_band(2)-range & freq < frequency_band(2)+range
   x = 1;
elseif freq > frequency_band(3)-range & freq < frequency_band(3)+range
   x = 2;
elseif freq > frequency_band(4)-range & freq < frequency_band(4)+range
   x = 3;
else
      'Not found'
end