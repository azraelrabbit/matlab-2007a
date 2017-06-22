function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    mlock
    % 9 13
    % 10 13
    % 11 13
    hCreateInPackage = findpackage('Simulink');
    % 13 16
    % 14 16
    hThisClass = schema.class(hCreateInPackage, 'MemorySectionDefn');
    % 16 26
    % 17 26
    % 18 26
    % 19 26
    % 20 26
    % 21 26
    % 22 26
    % 23 26
    % 24 26
    hThisProp = schema.prop(hThisClass, 'Name', 'string');
    % 26 28
    hThisProp = schema.prop(hThisClass, 'OwnerPackage', 'string');
    % 28 30
    hThisProp = schema.prop(hThisClass, 'Comment', 'string');
    hThisProp.SetFunction = @setFcn_StringTrim;
    % 31 33
    hThisProp = schema.prop(hThisClass, 'PragmaPerVar', 'bool');
    hThisProp.AccessFlags.Init = 'on';
    hThisProp.FactoryValue = logical(0);
    % 35 37
    hThisProp = schema.prop(hThisClass, 'PrePragma', 'string');
    hThisProp.SetFunction = @setFcn_StringTrim;
    % 38 40
    hThisProp = schema.prop(hThisClass, 'PostPragma', 'string');
    hThisProp.SetFunction = @setFcn_StringTrim;
    % 41 43
    hThisProp = schema.prop(hThisClass, 'IsConst', 'bool');
    hThisProp.AccessFlags.Init = 'on';
    hThisProp.FactoryValue = logical(0);
    % 45 47
    hThisProp = schema.prop(hThisClass, 'IsVolatile', 'bool');
    hThisProp.AccessFlags.Init = 'on';
    hThisProp.FactoryValue = logical(0);
    % 49 51
    hThisProp = schema.prop(hThisClass, 'Qualifier', 'string');
    hThisProp.SetFunction = @setFcn_StringTrim;
end
function actVal = setFcn_StringTrim(hObj, newVal)
    % 54 63
    % 55 63
    % 56 63
    % 57 63
    % 58 63
    % 59 63
    % 60 63
    % 61 63
    actVal = strtrim(newVal);
end
