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
    hThisClass = schema.class(package, 'SetAttribute', parent);
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
    if isempty(findtype('DESAttributeFrom'))
        schema.EnumType('DESAttributeFrom', {'Dialog','Signal port'});
    end % if
    % 53 56
    % 54 56
    % 55 56
    if isempty(findtype('DESAttributeTreatAsVector'))
        schema.EnumType('DESAttributeTreatAsVector', {'Double','Int'});
    end % if
    % 59 63
    % 60 63
    % 61 63
    % 62 63
    if isempty(findtype('DESStat'))
        schema.EnumType('DESStat', {'Off','On','Upon stop or pause'});
    end % if
    % 66 72
    % 67 72
    % 68 72
    % 69 72
    % 70 72
    % 71 72
    schema.prop(hThisClass, 'AttributeName', 'string');
    % 73 74
    schema.prop(hThisClass, 'AttributeFrom', 'string');
    % 75 76
    schema.prop(hThisClass, 'AttributeValue', 'string');
    % 77 78
    schema.prop(hThisClass, 'AttributeTreatAsVector', 'string');
    % 79 80
    schema.prop(hThisClass, 'AttributeDataDimensions', 'string');
    % 81 82
    schema.prop(hThisClass, 'AttributeCreate', 'bool');
    % 83 85
    % 84 85
    schema.prop(hThisClass, 'StatNumberDeparted', 'DESStat');
    % 86 88
    % 87 88
    schema.prop(hThisClass, 'TableRowSrcObj', 'handle vector');
    % 89 90
    schema.prop(hThisClass, 'SelectedTableRow', 'double');
end % function
