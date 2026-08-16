%% Q3(c) [2023-24 paper]: Read numbers from user until a negative number
%  is entered, then compute and display the average of the POSITIVE
%  numbers entered (the negative terminator itself is NOT included).

total = 0;
count = 0;

while true
    num = input('Enter a number (negative to stop): ');
    if num < 0
        break;
    end
    total = total + num;
    count = count + 1;
end

if count > 0
    avg = total / count;
    fprintf('Average of the %d positive number(s) entered: %.4f\n', count, avg);
else
    fprintf('No positive numbers were entered.\n');
end

% NOTE: If the question instead says "including zero as positive" or
% "stop on a negative OR zero", just adjust the condition `num < 0`
% to `num <= 0` accordingly — read the wording carefully on exam day.
