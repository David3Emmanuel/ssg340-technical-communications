scores = [];
score = input('Enter exam score (negative to stop): ');
while score >= 0
    if score > 100
        disp('Invalid score. Must be between 0 and 100.');
        score = input('Enter exam score (negative to stop): ');
        continue;
    end
    scores(end+1) = score;
    score = input('Enter exam score (negative to stop): ');
end
if isempty(scores)
    disp('No valid scores entered.');
else
    n = length(scores);
    meanScore = sum(scores)/n;
    highest = -Inf;
    lowest = Inf;
    aboveMean = 0;
    belowMean = 0;
    passCount = 0;
    for i = 1:n
        if scores(i) > highest
            highest = scores(i);
        end
        if scores(i) < lowest
            lowest = scores(i);
        end
        if scores(i) >= meanScore
            aboveMean = aboveMean + 1;
        else
            belowMean = belowMean + 1;
        end
        if scores(i) >= 50
            passCount = passCount + 1;
        end
    end
    percentPass = (passCount/n)*100;
    fprintf('Number of valid scores: %d\n', n);
    fprintf('Mean: %g\n', meanScore);
    fprintf('Highest: %g\n', highest);
    fprintf('Lowest: %g\n', lowest);
    fprintf('Scores >= mean: %d\n', aboveMean);
    fprintf('Scores < mean: %d\n', belowMean);
    fprintf('Percentage >= 50: %g%%\n', percentPass);
end
