function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    hCreateInPackage = findpackage('PMDialogs');
    hBaseObj = hCreateInPackage.findclass('PmGuiObj');
    % 11 13
    % 12 13
    hThisClass = schema.class(hCreateInPackage, 'DynButtonBar', hBaseObj);
    % 14 16
    % 15 16
    p = schema.prop(hThisClass, 'NumButtons', 'integer');
    p = schema.prop(hThisClass, 'BtnLabels', 'string vector');
    p = schema.prop(hThisClass, 'BtnImages', 'string vector');
    p = schema.prop(hThisClass, 'BtnCallbacks', 'string vector');
    % 20 22
    % 21 22
    m = schema.method(hThisClass, 'Render');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','mxArray'};
    s.OutputTypes = {'bool','mxArray'};
end % function
