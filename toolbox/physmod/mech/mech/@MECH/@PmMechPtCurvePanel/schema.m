function schema
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    hBasePackage = findpackage('PMDialogs');
    hBaseObj = hBasePackage.findclass('PmGuiObj');
    hCreateInPackage = findpackage('MECH');
    % 14 16
    % 15 16
    cls = schema.class(hCreateInPackage, 'PmMechPtCurvePanel', hBaseObj);
end % function
