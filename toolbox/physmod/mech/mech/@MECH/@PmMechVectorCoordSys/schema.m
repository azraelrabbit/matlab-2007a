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
    hBaseObj = hBasePackage.findclass('PmGuiObj');
    hCreateInPackage = findpackage('MECH');
    % 13 15
    % 14 15
    hThisClass = schema.class(hCreateInPackage, 'PmMechVectorCoordSys', hBaseObj);
    % 16 18
    % 17 18
    p = schema.prop(hThisClass, 'Label', 'string');
    p = schema.prop(hThisClass, 'LabelAttrb', 'int');
    % 20 22
    % 21 22
    m = schema.method(hThisClass, 'Realize');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'bool'};
end % function
