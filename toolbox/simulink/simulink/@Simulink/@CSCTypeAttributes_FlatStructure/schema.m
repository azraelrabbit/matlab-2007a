function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    mlock
    % 9 12
    % 10 12
    hCreateInPackage = findpackage('Simulink');
    % 12 15
    % 13 15
    hDeriveFromPackage = findpackage('Simulink');
    hDeriveFromClass = findclass(hDeriveFromPackage, 'CustomStorageClassAttributes');
    % 16 19
    % 17 19
    hThisClass = schema.class(hCreateInPackage, 'CSCTypeAttributes_FlatStructure', hDeriveFromClass);
    % 19 28
    % 20 28
    % 21 28
    % 22 28
    % 23 28
    % 24 28
    % 25 28
    % 26 28
    hThisProp = schema.prop(hThisClass, 'StructName', 'string');
    hThisProp.SetFunction = @setFcn_StructName;
    % 29 31
    hThisProp = schema.prop(hThisClass, 'IsStructNameInstanceSpecific', 'bool');
    hThisProp.AccessFlags.Init = 'on';
    hThisProp.FactoryValue = logical(0);
    % 33 35
    hThisProp = schema.prop(hThisClass, 'BitPackBoolean', 'bool');
    hThisProp.AccessFlags.Init = 'on';
    hThisProp.FactoryValue = logical(0);
    % 37 47
    % 38 47
    % 39 47
    % 40 47
    % 41 47
    % 42 47
    % 43 47
    % 44 47
    % 45 47
    hThisProp = schema.prop(hThisClass, 'IsTypeDef', 'bool');
    hThisProp.AccessFlags.Init = 'on';
    hThisProp.FactoryValue = logical(1);
    % 49 51
    hThisProp = schema.prop(hThisClass, 'TypeName', 'string');
    % 51 53
    hThisProp = schema.prop(hThisClass, 'TypeToken', 'string');
    % 53 55
    hThisProp = schema.prop(hThisClass, 'TypeTag', 'string');
    % 55 61
    % 56 61
    % 57 61
    % 58 61
    % 59 61
    m = schema.method(hThisClass, 'instanceComboFcn');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','mxArray','mxArray','mxArray'};
    s.OutputTypes = {};
end
function actVal = setFcn_StructName(hObj, newVal)
    % 67 81
    % 68 81
    % 69 81
    % 70 81
    % 71 81
    % 72 81
    % 73 81
    % 74 81
    % 75 81
    % 76 81
    % 77 81
    % 78 81
    % 79 81
    newVal = strtrim(newVal);
    % 81 83
    if isempty(newVal) || iscvar(newVal)
        actVal = newVal;
    else
        error('Structure name must be a valid c identifier or empty');
        % 86 88
    end
end
