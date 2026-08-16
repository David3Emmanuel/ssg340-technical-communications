function idx = twoSumIndices(v, target)
% TWOSUMINDICES  Return the indices of the two elements in vector v
%                that sum to target.
%
%   idx = twoSumIndices(v, target)
%   idx is a 1x2 vector [i, j] with i < j, or [] if no pair is found.
%
%   Uses a hash-map style approach (containers.Map) for O(n) lookup,
%   which is efficient and easy to explain in an exam if asked.

    idx = [];
    seen = containers.Map('KeyType', 'double', 'ValueType', 'double');

    for i = 1:numel(v)
        complement = target - v(i);
        if isKey(seen, complement)
            idx = [seen(complement), i];
            return;
        end
        seen(v(i)) = i;
    end

    if isempty(idx)
        warning('No two elements sum to the target value.');
    end
end

%% ---- Quick test ----
% v = [2, 7, 11, 15];
% idx = twoSumIndices(v, 9)   % expect [1 2] since v(1)+v(2) = 2+7 = 9

%% ---- Simple double-loop alternative (if containers.Map feels risky) ----
% function idx = twoSumIndicesSimple(v, target)
%     idx = [];
%     n = numel(v);
%     for i = 1:n-1
%         for j = i+1:n
%             if v(i) + v(j) == target
%                 idx = [i, j];
%                 return;
%             end
%         end
%     end
% end
