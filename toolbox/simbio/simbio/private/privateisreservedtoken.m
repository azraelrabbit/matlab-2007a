function reserved = privateisreservedtoken(strs)
    % 1 17
    % 2 17
    % 3 17
    % 4 17
    % 5 17
    % 6 17
    % 7 17
    % 8 17
    % 9 17
    % 10 17
    % 11 17
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    reservedTokens = {'time'};
    % 17 20
    % 18 20
    if ischar(strs)
        strs = cellstr(strs);
    end % if
    reserved = ismember(strs, reservedTokens);
end % function
