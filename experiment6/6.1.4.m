r = rand(1, 1000);
count_less_0_3 = sum(r < 0.3);
count_greater_equal_0_5 = sum(r >= 0.5);

count_mid = sum(r >= 0.3 & r < 0.5); 
total_sum_check = (count_less_0_3 + count_mid + count_greater_equal_0_5) == length(r);