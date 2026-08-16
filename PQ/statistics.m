function [meanVal, medianVal, modeVal] = meanMedianMode(v)
% MEANMEDIANMODE  Compute mean, median, and mode(s) of a vector.
%                  If multiple values are tied for most frequent,
%                  ALL of them are returned in modeVal.
%
%   [meanVal, medianVal, modeVal] = meanMedianMode(v)

    v = v(:);   % ensure column vector

    % ---- Mean ----
    meanVal = sum(v) / numel(v);

    % ---- Median ----
    sortedV = sort(v);
    n = numel(sortedV);
    if mod(n, 2) == 1
        medianVal = sortedV((n+1)/2);
    else
        medianVal = (sortedV(n/2) + sortedV(n/2 + 1)) / 2;
    end

    % ---- Mode (handles multiple modes) ----
    uniqueVals = unique(v);
    counts = zeros(size(uniqueVals));
    for i = 1:numel(uniqueVals)
        counts(i) = sum(v == uniqueVals(i));
    end
    maxCount = max(counts);
    modeVal = uniqueVals(counts == maxCount);

    % If every value occurs equally often (e.g. all unique), MATLAB's
    % convention is that there is no meaningful mode -> return full set
    % or optionally flag it:
    if maxCount == 1
        warning('No repeated values — every element is a mode (all unique).');
    end
end

%% ---- Quick test ----
% v = [1 2 2 3 3 4];
% [m, med, mo] = meanMedianMode(v)
% mo should be [2; 3]  (two modes, tied)