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
    hCreateInPackage = findpackage('NetworkEngine');
    hBaseObj = hCreateInPackage.findclass('PmNePSConvertPanel');
    % 12 14
    % 13 14
    hThisClass = schema.class(hCreateInPackage, 'DynNePSConvertPanel', hBaseObj);
    % 15 21
    % 16 21
    % 17 21
    % 18 21
    % 19 21
    % 20 21
    m = schema.method(hThisClass, 'Render');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','mxArray'};
    s.OutputTypes = {'bool','mxArray'};
end % function
