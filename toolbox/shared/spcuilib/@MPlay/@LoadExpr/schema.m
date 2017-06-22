function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    hDeriveFromPackage = findpackage('MPlay');
    hDeriveFromClass = findclass(hDeriveFromPackage, 'DialogBase');
    hCreateInPackage = findpackage('MPlay');
    hThisClass = schema.class(hCreateInPackage, 'LoadExpr', hDeriveFromClass);
    % 11 12
    MPlay.RegisterDDGMethods(hThisClass, {'getDialogSchema','validate'});
    % 13 17
    % 14 17
    % 15 17
    % 16 17
    m = schema.method(hThisClass, 'handleButtons');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {};
    % 22 27
    % 23 27
    % 24 27
    % 25 27
    % 26 27
    p = schema.prop(hThisClass, 'mlvar', 'string');
    p.FactoryValue = '';
    % 29 31
    % 30 31
    p = schema.prop(hThisClass, 'mlvarEval', 'mxArray');
    p.FactoryValue = [];
end % function
