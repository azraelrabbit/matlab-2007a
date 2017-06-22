function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    hCreateInPackage = findpackage('PMDialogs');
    hBaseObj = hCreateInPackage.findclass('PmDisplayBox');
    % 11 13
    % 12 13
    hThisClass = schema.class(hCreateInPackage, 'DynDisplayBox', hBaseObj);
end % function
