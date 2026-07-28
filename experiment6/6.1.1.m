a = [1, 4, 7, 10, 12];
elements_greater_than_5 = a(a > 5);
disp(elements_greater_than_5);

elements_divisible_by_2 = a(mod(a, 2) == 0);
disp(elements_divisible_by_2);

count_greater_or_equal_to_5 = sum(a >= 5);
disp(count_greater_or_equal_to_5);