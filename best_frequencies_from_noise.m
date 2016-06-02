function x = best_frequencies_from_noise(freq1,freq2)

if freq1 > 2500 || freq2 > 2500
   distanceMinBetweenNoise = 1000;
   distanceMinBetweenFreq = 200;
   tab = [4000 4000 4000 4000 4000];
   index = [2 3 4 5 ; 1 3 4 5 ; 1 2 4 5 ; 1 2 3 5; 1 2 3 4];
   for i= 1:5
       if(i == 5)
           distanceMinBetweenFreq = 1000;
       end
       index1 = index(i,1);
       index2 = index(i,2);
       index3 = index(i,3);
       index4 = index(i,4);

       while (abs(tab(i)-freq1) < distanceMinBetweenNoise || abs(tab(i)-freq2) < distanceMinBetweenNoise || abs(tab(index1)-tab(i)) < distanceMinBetweenFreq || abs(tab(index2)-tab(i)) < distanceMinBetweenFreq || abs(tab(index3)-tab(i)) < distanceMinBetweenFreq || abs(tab(index4)-tab(i)) < distanceMinBetweenFreq)
        tab(i) = tab(i) + distanceMinBetweenFreq;
       end
   end

   result = [tab(1) tab(2) tab(3) tab(4) tab(5)];
else
   result = [6000 6200 6400 6600 4000]
end
x = result;

