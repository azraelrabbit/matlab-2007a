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
    hBasePackage = findpackage('PMDialogs');
    hBaseObj = hBasePackage.findclass('DynDlgSource');
    hCreateInPackage = findpackage('MECH');
    % 13 15
    % 14 15
    cls = schema.class(hCreateInPackage, 'DynMechDlgSource', hBaseObj);
    % 16 21
    % 17 21
    % 18 21
    % 19 21
    % 20 21
    m = schema.method(cls, 'internalGetPmSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle'};
    s.OutputTypes = {'mxArray'};
end % function
