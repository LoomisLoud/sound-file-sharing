function x = choose_others_frequency(freq1,freq2)

disp(freq1);
disp(freq2);
differenceOfFrequencies = abs(freq1-freq2);
result = zeros(4,1);
if(differenceOfFrequencies >= 8000)
    frequencyStart = max([freq1 freq2]) - 5000;
    disp(frequencyStart);
    for n = 1:size(result)
        result(n) = frequencyStart + n*200;
    end
else
   if(max([freq1,freq2]) > 15000)
       frequencyStart = 10000 - 5000;
       for n = 1:size(result)
        result(n) = frequencyStart + n*200;
       end
   elseif(min([freq1,freq2]) < 5000)
           frequencyStart = 10000 + 5000;
           for n = 1:size(result)
            result(n) = frequencyStart + n*200;
           end
   else
       frequencyStart = 1000;
       for n = 1:size(result)
           result(n) = frequencyStart + n*200;
       end
   end
end
x = result;
    









