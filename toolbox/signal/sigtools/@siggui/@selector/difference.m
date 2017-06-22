function factor = difference(hSct, indx)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    lbls = get(hSct, 'Strings');
    tags = get(hSct, 'Identifiers');
    % 10 11
    factor = minus(length(tags{indx}), length(lbls{indx}));
end % function
