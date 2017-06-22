function schema
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    % 11 12
    hBasePackage = findpackage('NetworkEngine');
    hBaseObj = hBasePackage.findclass('DynNeDlgSource');
    hCreateInPackage = hBasePackage;
    % 15 17
    % 16 17
    cls = schema.class(hCreateInPackage, 'DynNeUtilDlgSource', hBaseObj);
    % 18 23
    % 19 23
    % 20 23
    % 21 23
    % 22 23
    m = schema.method(cls, 'internalGetPmSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle'};
    s.OutputTypes = {'mxArray'};
end % function
