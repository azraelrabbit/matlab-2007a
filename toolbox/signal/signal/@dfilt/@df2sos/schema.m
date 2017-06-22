function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    package = findpackage('dfilt');
    parent = findclass(package, 'abstractsos');
    % 11 12
    thisclass = schema.class(package, 'df2sos', parent);
end % function
