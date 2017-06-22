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
    hThisClass = schema.class(package, 'GATableRowObj', parent);
    % 12 16
    % 13 16
    % 14 16
    % 15 16
    if isempty(findtype('DESAttributeSendTiming'))
        schema.EnumType('DESAttributeSendTiming', {'Before entity departure','After entity departure'});
    end % if
    % 19 23
    % 20 23
    % 21 23
    % 22 23
    if isempty(findtype('DESAttributeMissing'))
        schema.EnumType('DESAttributeMissing', {'Error','Default value','Warn'});
    end % if
    % 26 30
    % 27 30
    % 28 30
    % 29 30
    schema.prop(hThisClass, 'SrcAttributeName', 'string');
    % 31 32
    schema.prop(hThisClass, 'SrcAttributeTreatAsVector', 'bool');
    % 33 34
    schema.prop(hThisClass, 'SrcAttributeMissing', 'DESAttributeMissing');
    % 35 36
    schema.prop(hThisClass, 'SrcAttributeDefaultValue', 'string');
    % 37 38
    schema.prop(hThisClass, 'SrcAttributeSendTiming', 'DESAttributeSendTiming');
    % 39 40
    schema.prop(hThisClass, 'SrcBlockObj', 'handle');
end % function
