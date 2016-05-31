function x = best_frequencies_from_noise(freq1,freq2)

distanceMinBetweenNoise = 2000;
distanceMinBetweenFreq = 1000;
tab = [4000 4000 4000 4000 4000];
index = [2 3 4 5; 1 3 4 5; 1 2 4 5; 1 2 3 5; 1 2 3 4];
for i= 1:5
    index1 = index(i,1); 
    index2 = index(i,2); 
    index3 = index(i,3);
    index4 = index(i,4);
    
    while (abs(tab(i)-freq1) < distanceMinBetweenNoise || abs(tab(i)-freq2) < distanceMinBetweenNoise || abs(tab(index1)-tab(i)) < distanceMinBetweenFreq || abs(tab(index2)-tab(i)) < distanceMinBetweenFreq || abs(tab(index3)-tab(i)) < distanceMinBetweenFreq ||  abs(tab(index4)-tab(i)) < distanceMinBetweenFreq )
        tab(i) = tab(i) + 1000;
    end
end

x = tab;
    