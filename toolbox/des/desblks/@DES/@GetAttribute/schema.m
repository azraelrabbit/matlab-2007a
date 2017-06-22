function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    package = findpackage('DES');
    parent = findclass(package, 'DESDDGBase');
    hThisClass = schema.class(package, 'GetAttribute', parent);
    % 12 16
    % 13 16
    % 14 16
    % 15 16
    p = schema.prop(hThisClass, 'Block', 'handle');
    % 17 26
    % 18 26
    % 19 26
    % 20 26
    % 21 26
    % 22 26
    % 23 26
    % 24 26
    % 25 26
    m = schema.method(hThisClass, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 31 34
    % 32 34
    % 33 34
    m = schema.method(hThisClass, 'buttonCallback');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle','string'};
    s.OutputTypes = {};
    % 39 50
    % 40 50
    % 41 50
    % 42 50
    % 43 50
    % 44 50
    % 45 50
    % 46 50
    % 47 50
    % 48 50
    % 49 50
    if isempty(findtype('DESStat'))
        schema.EnumType('DESStat', {'Off','On','Upon stop or pause'});
    end % if
    % 53 58
    % 54 58
    % 55 58
    % 56 58
    % 57 58
    schema.prop(hThisClass, 'AttributeName', 'string');
    % 59 60
    schema.prop(hThisClass, 'AttributeMissing', 'string');
    % 61 62
    schema.prop(hThisClass, 'AttributeDefaultValue', 'string');
    % 63 64
    schema.prop(hThisClass, 'AttributeTreatAsVector', 'string');
    % 65 66
    schema.prop(hThisClass, 'AttributeSendTiming', 'string');
    % 67 69
    % 68 69
    schema.prop(hThisClass, 'StatNumberDeparted', 'DESStat');
    % 70 72
    % 71 72
    schema.prop(hThisClass, 'TableRowSrcObj', 'handle vector');
    % 73 74
    schema.prop(hThisClass, 'SelectedTableRow', 'double');
end % function
