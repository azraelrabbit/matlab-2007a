function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    package = findpackage('mfilt');
    parent = findclass(package, 'linearinterp');
    thisclass = schema.class(package, 'holdinterp', parent);
end % function
