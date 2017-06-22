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
    hBaseObj = hCreateInPackage.findclass('PmGroupPanel');
    % 11 13
    % 12 13
    hThisClass = schema.class(hCreateInPackage, 'DynGroupPanel', hBaseObj);
    % 14 19
    % 15 19
    % 16 19
    % 17 19
    % 18 19
    m = schema.method(hThisClass, 'Render');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','mxArray'};
    s.OutputTypes = {'bool','mxArray'};
end % function
