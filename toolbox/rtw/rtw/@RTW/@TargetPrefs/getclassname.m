function className = getclassname(h)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    fullName = h.class;
    dotIndex = findstr(fullName, '.');
    % 11 12
    className = fullName(plus(dotIndex, 1.0):end);
end % function
