function schema
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    hCreateInPackage = findpackage('RTW');
    % 11 13
    % 12 13
    hThisClass = schema.class(hCreateInPackage, 'TargetPrefs');
    % 14 16
    % 15 16
    hThisMethod = schema.method(hThisClass, 'load', 'static');
end % function
