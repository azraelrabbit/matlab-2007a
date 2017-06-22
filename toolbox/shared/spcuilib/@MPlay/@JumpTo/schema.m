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
    hThisClass = schema.class(hCreateInPackage, 'JumpTo', hDeriveFromClass);
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
    % 22 25
    % 23 25
    % 24 25
    schema.prop(hThisClass, 'frame', 'double');
    schema.prop(hThisClass, 'frameStr', 'string');
    % 27 28
    p = schema.prop(hThisClass, 'maxframe', 'double');
    p.AccessFlags.PublicSet = 'off';
    % 30 35
    % 31 35
    % 32 35
    % 33 35
    % 34 35
    p = schema.prop(hThisClass, 'performingFrameReset', 'bool');
    p.FactoryValue = false;
    p.AccessFlags.PublicSet = 'off';
end % function
