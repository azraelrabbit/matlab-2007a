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
    hThisClass = schema.class(package, 'SATableRowObj', parent);
    % 12 16
    % 13 16
    % 14 16
    % 15 16
    if isempty(findtype('DESAttributeFrom'))
        schema.EnumType('DESAttributeFrom', {'Dialog','Signal port'});
    end % if
    % 19 23
    % 20 23
    % 21 23
    % 22 23
    if isempty(findtype('DESAttributeTreatAsVector'))
        schema.EnumType('DESAttributeTreatAsVector', {'Double','Int'});
    end % if
    % 26 33
    % 27 33
    % 28 33
    % 29 33
    % 30 33
    % 31 33
    % 32 33
    schema.prop(hThisClass, 'SrcAttributeName', 'string');
    % 34 35
    schema.prop(hThisClass, 'SrcAttributeFrom', 'DESAttributeFrom');
    % 36 37
    schema.prop(hThisClass, 'SrcAttributeValue', 'string');
    % 38 39
    schema.prop(hThisClass, 'SrcAttributeTreatAsVector', 'bool');
    % 40 41
    schema.prop(hThisClass, 'SrcBlockObj', 'handle');
end % function
