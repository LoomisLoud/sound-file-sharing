function x = choose_frequency(num)

frequency_band = [4000 5000 6000 7000];
switch num
   case 0
      x = frequency_band(1);
   case 1
      x = frequency_band(2);
   case 2
      x = frequency_band(3);
   case 3
      x = frequency_band(4);
   otherwise
      'Not found'
end