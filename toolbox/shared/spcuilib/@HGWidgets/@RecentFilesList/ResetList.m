function ResetList(h, maxNum)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if lt(nargin, 2.0)
        % 9 10
        maxNum = h.GetMax;
    end % if
    h.SetList(emptyStringVec(maxNum));
end % function
function s = emptyStringVec(n)
    % 15 17
    % 16 17
    s = repmat({''}, n, 1.0);
end % function
