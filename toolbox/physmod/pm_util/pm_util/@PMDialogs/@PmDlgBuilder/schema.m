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
    hBaseObj = hCreateInPackage.findclass('PmGuiObj');
    % 16 18
    % 17 18
    hThisClass = schema.class(hCreateInPackage, 'PmDlgBuilder', hBaseObj);
    % 19 21
    % 20 21
    p = schema.prop(hThisClass, 'OnBlockSchema', 'MATLAB array');
    p = schema.prop(hThisClass, 'PanelObjLst', 'handle vector');
    % 23 25
    % 24 25
    m = schema.method(hThisClass, 'getPmSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','MATLAB array'};
    s.OutputTypes = {'bool','MATLAB array'};
    % 30 31
    m = schema.method(hThisClass, 'buildFromPmSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','MATLAB array'};
    s.OutputTypes = {'bool'};
end % function
