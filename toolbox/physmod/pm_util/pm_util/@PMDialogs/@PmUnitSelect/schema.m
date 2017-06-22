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
    hBaseObj = hCreateInPackage.findclass('PmBaseWidget');
    % 11 13
    % 12 13
    hThisClass = schema.class(hCreateInPackage, 'PmUnitSelect', hBaseObj);
    % 14 16
    % 15 16
    p = schema.prop(hThisClass, 'Label', 'string');
    p.Description = 'Widget label text';
    p.FactoryValue = '';
    % 19 21
    % 20 21
    p = schema.prop(hThisClass, 'LabelAttrb', 'int');
    p.Description = 'Label position and vis. 0 = hide, 1 = left, 2 = top';
    % 23 24
    p = schema.prop(hThisClass, 'Value', 'string');
    p.Description = 'Selected unit value.';
    % 26 27
    p = schema.prop(hThisClass, 'EnableStatus', 'bool');
    p.Description = 'Enable status of the widget.';
    % 29 30
    p = schema.prop(hThisClass, 'Choices', 'mxArray');
    p.Description = 'Available unit choices (strings).';
    % 32 33
    p = schema.prop(hThisClass, 'HideName', 'bool');
    p.Description = 'Hide unit prompt. Default is true.';
    % 35 36
    p = schema.prop(hThisClass, 'UnitDefault', 'string');
    p.Description = 'Default unit. Default is ''none''';
    % 38 47
    % 39 47
    % 40 47
    % 41 47
    % 42 47
    % 43 47
    % 44 47
    % 45 47
    % 46 47
    m = schema.method(hThisClass, 'Realize');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'bool'};
end % function
