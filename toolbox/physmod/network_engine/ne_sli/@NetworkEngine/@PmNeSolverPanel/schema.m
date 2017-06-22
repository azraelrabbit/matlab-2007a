function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    hBasePackage = findpackage('PMDialogs');
    hBaseObj = hBasePackage.findclass('PmGuiObj');
    hCreateInPackage = findpackage('NetworkEngine');
    % 12 14
    % 13 14
    hThisClass = schema.class(hCreateInPackage, 'PmNeSolverPanel', hBaseObj);
end % function
