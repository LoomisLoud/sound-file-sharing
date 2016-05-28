function x = choose_frequency(num)

%frequency_band = [3600 3625 3650 3675];
frequency_band = [3600 3800 4000 4200];
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
      'nique'
end