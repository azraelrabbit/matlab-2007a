function appendTransaction(h, name, reason, funcSet)
    % 1 15
    % 2 15
    % 3 15
    % 4 15
    % 5 15
    % 6 15
    % 7 15
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    % 14 15
    h.Transactions(plus(end, 1.0)).name = cleanBlockName(h, name);
    h.Transactions(end).reason = reason;
    % 17 18
    if doUpdate(h)
        h.Transactions(end).done = true;
    else
        h.Transactions(end).done = false;
    end % if
    % 23 24
    h.Transactions(end).functionSet = funcSet;
end % function
