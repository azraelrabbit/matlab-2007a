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
    hBaseObj = hCreateInPackage.findclass('PmGuiObj');
    % 12 14
    % 13 14
    hThisClass = schema.class(hCreateInPackage, 'PmDescriptionPanel', hBaseObj);
    % 15 19
    % 16 19
    % 17 19
    % 18 19
    p = schema.prop(hThisClass, 'Need2Realize', 'bool');
    p.AccessFlags.PrivateGet = 'on';
    p.AccessFlags.PrivateSet = 'on';
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.PublicSet = 'off';
    % 24 25
    p = schema.prop(hThisClass, 'BlockTitle', 'string');
    p.AccessFlags.PrivateGet = 'on';
    p.AccessFlags.PrivateSet = 'on';
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.PublicSet = 'off';
    % 30 31
    p = schema.prop(hThisClass, 'DescrText', 'string');
    % 32 34
    % 33 34
    m = schema.method(hThisClass, 'Realize');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'bool'};
end % function
