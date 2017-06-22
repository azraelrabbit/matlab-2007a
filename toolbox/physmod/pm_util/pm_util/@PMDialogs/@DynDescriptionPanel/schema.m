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
    hCreateInPackage = findpackage('PMDialogs');
    hBaseObj = hCreateInPackage.findclass('PmDescriptionPanel');
    % 12 14
    % 13 14
    hThisClass = schema.class(hCreateInPackage, 'DynDescriptionPanel', hBaseObj);
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
