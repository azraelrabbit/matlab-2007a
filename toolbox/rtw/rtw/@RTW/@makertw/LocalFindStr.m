function found = LocalFindStr(h, s1, s2)
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
    found = and(ge(length(s1), length(s2)), not(isempty(findstr(s1, s2))));
end % function
