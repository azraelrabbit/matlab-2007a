function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    hCreateInPackage = findpackage('MECH');
    hBaseObj = hCreateInPackage.findclass('PmMechBranchBarPanel');
    % 10 12
    % 11 12
    hThisClass = schema.class(hCreateInPackage, 'DynMechBranchBarPanel', hBaseObj);
    % 13 18
    % 14 18
    % 15 18
    % 16 18
    % 17 18
    m = schema.method(hThisClass, 'Render');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','mxArray'};
    s.OutputTypes = {'bool','mxArray'};
end % function
