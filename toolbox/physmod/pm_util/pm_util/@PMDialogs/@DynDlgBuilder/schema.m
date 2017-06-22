function schema
    % 1 14
    % 2 14
    % 3 14
    % 4 14
    % 5 14
    % 6 14
    % 7 14
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    % 13 14
    hCreateInPackage = findpackage('PMDialogs');
    hBaseObj = hCreateInPackage.findclass('PmDlgBuilder');
    % 16 18
    % 17 18
    hThisClass = schema.class(hCreateInPackage, 'DynDlgBuilder', hBaseObj);
    % 19 21
    % 20 21
    p = schema.prop(hThisClass, 'BlockHandle', 'handle');
    % 22 24
    % 23 24
    m = schema.method(hThisClass, 'Render');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','mxArray'};
    s.OutputTypes = {'bool','mxArray'};
end % function
