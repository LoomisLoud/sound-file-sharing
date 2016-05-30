function x = choose_frequency(band, num)

switch num
   case 0
      x = band(1);
   case 1
      x = band(2);
   case 2
      x = band(3);
   case 3
      x = band(4);
   otherwise
      'Not found'
end