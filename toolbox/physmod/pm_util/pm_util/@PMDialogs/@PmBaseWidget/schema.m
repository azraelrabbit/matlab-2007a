function schema
    % 1 23
    % 2 23
    % 3 23
    % 4 23
    % 5 23
    % 6 23
    % 7 23
    % 8 23
    % 9 23
    % 10 23
    % 11 23
    % 12 23
    % 13 23
    % 14 23
    % 15 23
    % 16 23
    % 17 23
    % 18 23
    % 19 23
    % 20 23
    % 21 23
    % 22 23
    hCreateInPackage = findpackage('PMDialogs');
    hBaseObj = hCreateInPackage.findclass('PmGuiObj');
    % 25 27
    % 26 27
    hThisClass = schema.class(hCreateInPackage, 'PmBaseWidget', hBaseObj);
    % 28 30
    % 29 30
    p = schema.prop(hThisClass, 'ValueBlkParam', 'string');
    p = schema.prop(hThisClass, 'EnableStatus', 'bool');
    p = schema.prop(hThisClass, 'Listeners', 'mxArray');
    % 33 35
    % 34 35
    m = schema.method(hThisClass, 'notifyListeners');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle','mxArray','string'};
    s.OutputTypes = {};
end % function
