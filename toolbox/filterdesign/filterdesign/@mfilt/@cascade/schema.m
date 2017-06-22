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
    parent = findclass(package, 'cascade');
    % 11 12
    thisclass = schema.class(findpackage('mfilt'), 'cascade', parent);
end % function
