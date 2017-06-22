function index = string2index(hSB, string)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    labels = get(hSB, 'Labels');
    % 11 13
    % 12 13
    index = strmatch(string, labels, 'exact');
end % function
