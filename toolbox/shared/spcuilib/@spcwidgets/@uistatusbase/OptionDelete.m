function OptionDelete(h, delIdx)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    if isempty(delIdx)
        return;
    end % if
    N = CheckOptionIndex(h, delIdx);
    % 15 16
    keepIdx = 1.0:N;
    keepIdx(delIdx) = [];
    OptionKeep(h, keepIdx);
end % function
