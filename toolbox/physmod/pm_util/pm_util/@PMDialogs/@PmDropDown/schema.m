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
    hThisClass = schema.class(hCreateInPackage, 'PmDropDown', hBaseObj);
    % 15 17
    % 16 17
    schema.prop(hThisClass, 'Label', 'string');
    schema.prop(hThisClass, 'LabelAttrb', 'int');
    schema.prop(hThisClass, 'Value', 'string');
    schema.prop(hThisClass, 'Choices', 'string vector');
    schema.prop(hThisClass, 'ChoiceVals', 'mxArray');
    schema.prop(hThisClass, 'MapVals', 'mxArray');
    % 23 25
    % 24 25
    m = schema.method(hThisClass, 'Realize');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'bool'};
end % function
