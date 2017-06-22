function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    mlock
    % 9 11
    hDeriveFromPackage = findpackage('Simulink');
    hDeriveFromClass = findclass(hDeriveFromPackage, 'CustomStorageClassAttributes');
    hCreateInPackage = findpackage('mpt');
    % 13 16
    % 14 16
    hThisClass = schema.class(hCreateInPackage, 'CSCTypeAttributes_Unstructed', hDeriveFromClass);
    % 16 19
    % 17 19
    hThisProp = schema.prop(hThisClass, 'Owner', 'string');
    % 19 21
    hThisProp = schema.prop(hThisClass, 'IsOwnerInstanceSpecific', 'bool');
    hThisProp.AccessFlags.Init = 'on';
    hThisProp.FactoryValue = logical(0);
    % 23 25
    hThisProp = schema.prop(hThisClass, 'DefinitionFile', 'string');
    hThisProp.SetFunction = @setFcn_DefnFile;
    % 26 28
    hThisProp = schema.prop(hThisClass, 'IsDefinitionFileInstanceSpecific', 'bool');
    hThisProp.AccessFlags.Init = 'off';
    hThisProp.FactoryValue = logical(0);
    % 30 32
    hThisProp = schema.prop(hThisClass, 'ExportedMacroFile', 'string');
    hThisProp.SetFunction = @setFcn_ExpFile;
    hThisProp.Visible = 'off';
    % 34 36
    hThisProp = schema.prop(hThisClass, 'IsExportedMacroFileInstanceSpecific', 'bool');
    hThisProp.AccessFlags.Init = 'on';
    hThisProp.FactoryValue = logical(0);
    % 38 40
    hThisProp = schema.prop(hThisClass, 'ExportedMacroName', 'string');
    hThisProp.Visible = 'off';
    % 41 43
    hThisProp = schema.prop(hThisClass, 'IsExportedMacroNameInstanceSpecific', 'bool');
    hThisProp.AccessFlags.Init = 'on';
    hThisProp.FactoryValue = logical(0);
    % 45 47
    hThisProp = schema.prop(hThisClass, 'PersistenceLevel', 'int32');
    hThisProp.AccessFlags.Init = 'on';
    hThisProp.FactoryValue = 1.0;
    % 49 51
    hThisProp = schema.prop(hThisClass, 'IsPersistenceLevelInstanceSpecific', 'bool');
    hThisProp.AccessFlags.Init = 'on';
    hThisProp.FactoryValue = logical(0);
    % 53 58
    % 54 58
    % 55 58
    % 56 58
    m = schema.method(hThisClass, 'getInstanceSpecificProps');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'mxArray'};
end
function actVal = setFcn_DefnFile(hObj, newVal)
    % 64 69
    % 65 69
    % 66 69
    % 67 69
    try
        newVal = strtrim(newVal);
        [errTxt, hasDelimiters] = slprivate('check_generated_filename', newVal, '.c');
        if hasDelimiters
            errTxt = horzcat('Delimiters are not allowed in file name. ', errTxt);
        end
        if not(isempty(errTxt)) && not(isequal(errTxt, 'File name empty.'))
            error(errTxt);
        end
    catch
        error(lasterr);
    end % try
    % 80 82
    actVal = newVal;
end
function actVal = setFcn_ExpFile(hObj, newVal)
    % 84 91
    % 85 91
    % 86 91
    % 87 91
    % 88 91
    % 89 91
    try
        newVal = strtrim(newVal);
        [errTxt, hasDelimiters] = slprivate('check_generated_filename', newVal, '.h');
        if hasDelimiters
            errTxt = horzcat('Delimiters are not allowed in file name. ', errTxt);
        end
        if not(isempty(errTxt)) && not(isequal(errTxt, 'File name empty.'))
            error(errTxt);
        end
    catch
        error(lasterr);
    end % try
    % 102 104
    actVal = newVal;
end
