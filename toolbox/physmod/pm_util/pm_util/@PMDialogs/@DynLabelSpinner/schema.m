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
    hBaseObj = hCreateInPackage.findclass('PmLabelSpinner');
    % 11 13
    % 12 13
    hThisClass = schema.class(hCreateInPackage, 'DynLabelSpinner', hBaseObj);
    % 14 17
    % 15 17
    % 16 17
    p = schema.prop(hThisClass, 'ComboTag', 'string');
    p.FactoryValue = '';
    schema.prop(hThisClass, 'ValueTxt', 'string');
    % 20 24
    % 21 24
    % 22 24
    % 23 24
    m = schema.method(hThisClass, 'Render');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','mxArray'};
    s.OutputTypes = {'bool','mxArray'};
    % 29 31
    % 30 31
    m = schema.method(hThisClass, 'OnUpButton');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle','string','string'};
    s.OutputTypes = {};
    % 36 37
    m = schema.method(hThisClass, 'OnDownButton');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle','string','string'};
    s.OutputTypes = {};
    % 42 43
    m = schema.method(hThisClass, 'OnEditChange');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle','string','string'};
    s.OutputTypes = {};
end % function
