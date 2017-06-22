function val = dlgDatatypeStringVector(dao, propName, rawStr)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    val = strread(rawStr, '%s', 'delimiter', char(10.0));
    % 9 10
    set(dao, propName, val);
end % function
