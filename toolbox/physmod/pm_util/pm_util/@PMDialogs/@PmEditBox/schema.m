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
    hBaseObj = hCreateInPackage.findclass('PmBaseWidget');
    % 12 14
    % 13 14
    hThisClass = schema.class(hCreateInPackage, 'PmEditBox', hBaseObj);
    % 15 17
    % 16 17
    p = schema.prop(hThisClass, 'Label', 'string');
    p = schema.prop(hThisClass, 'LabelAttrb', 'int');
    p = schema.prop(hThisClass, 'Value', 'string');
    % 20 22
    % 21 22
    m = schema.method(hThisClass, 'Realize');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'bool'};
end % function
