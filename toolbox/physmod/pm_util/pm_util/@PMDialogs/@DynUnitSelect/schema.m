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
    hBaseObj = hCreateInPackage.findclass('PmUnitSelect');
    % 11 13
    % 12 13
    hThisClass = schema.class(hCreateInPackage, 'DynUnitSelect', hBaseObj);
    % 14 20
    % 15 20
    % 16 20
    % 17 20
    % 18 20
    % 19 20
    m = schema.method(hThisClass, 'Render');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','mxArray'};
    s.OutputTypes = {'bool','mxArray'};
end % function
