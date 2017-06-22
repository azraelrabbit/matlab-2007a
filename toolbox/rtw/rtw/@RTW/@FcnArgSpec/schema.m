function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    hCreateInPackage = findpackage('RTW');
    % 8 10
    % 9 10
    hThisClass = schema.class(hCreateInPackage, 'FcnArgSpec');
    % 11 12
    schema.EnumType('CategoryType', {'Value','Pointer'});
    % 13 14
    schema.EnumType('QualifierType', {'none','const','const *','const * const'});
    % 15 17
    % 16 17
    schema.EnumType('SLType', {'Inport','Outport'});
    % 18 20
    % 19 20
    hThisProp = schema.prop(hThisClass, 'SLObjectName', 'string');
    hThisProp.FactoryValue = '';
    % 22 23
    hThisProp = schema.prop(hThisClass, 'SLObjectType', 'SLType');
    hThisProp.FactoryValue = 'Inport';
    % 25 26
    hThisProp = schema.prop(hThisClass, 'Category', 'CategoryType');
    hThisProp.FactoryValue = 'Value';
    % 28 29
    hThisProp = schema.prop(hThisClass, 'ArgName', 'string');
    hThisProp.FactoryValue = '';
    % 31 32
    hThisProp = schema.prop(hThisClass, 'Position', 'int32');
    % 33 34
    hThisProp = schema.prop(hThisClass, 'Qualifier', 'QualifierType');
    hThisProp.FactoryValue = 'none';
    % 36 37
    hThisProp = schema.prop(hThisClass, 'PortNum', 'int32');
    % 38 39
    hThisProp = schema.prop(hThisClass, 'RowID', 'int32');
    hThisProp.AccessFlags.Serialize = 'off';
    % 41 43
    % 42 43
    m = schema.method(hThisClass, 'isValidIdentifier');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'bool'};
end % function
