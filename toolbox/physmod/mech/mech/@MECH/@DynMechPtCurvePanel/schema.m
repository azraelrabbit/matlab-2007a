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
    hCreateInPackage = findpackage('MECH');
    hBaseObj = hCreateInPackage.findclass('PmMechPtCurvePanel');
    % 13 15
    % 14 15
    hThisClass = schema.class(hCreateInPackage, 'DynMechPtCurvePanel', hBaseObj);
    % 16 18
    % 17 18
    schema.prop(hThisClass, 'hDialog', 'handle');
    % 19 22
    % 20 22
    % 21 22
    m = schema.method(hThisClass, 'Render');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','mxArray'};
    s.OutputTypes = {'bool','mxArray'};
    % 27 28
    m = schema.method(hThisClass, 'OnEditClick');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle','handle','string'};
    s.OutputTypes = {};
end % function
