function cscdefn_enumtypes
    % 1 5
    % 2 5
    % 3 5
    mlock
    persistent isLoaded;
    % 6 8
    if isempty(isLoaded)
        isLoaded = true;
    else
        return
    end
    % 12 14
    if isempty(findtype('CSC_Enum_CSCType'))
        schema.EnumType('CSC_Enum_CSCType', {'Unstructured';'FlatStructure';'Other'});
    else
        % 16 19
        % 17 19
        % 18 20
        warning('A type named ''CSC_Enum_CSCType'' already exists.');
    end
    % 21 34
    % 22 34
    % 23 34
    % 24 34
    % 25 34
    % 26 34
    % 27 34
    % 28 34
    % 29 34
    % 30 34
    % 31 34
    % 32 34
    if isempty(findtype('CSC_Enum_DataInit'))
        schema.EnumType('CSC_Enum_DataInit', {'Auto';'None';'Static';'Dynamic';'Macro'});
    else
        % 36 41
        % 37 41
        % 38 41
        % 39 41
        % 40 42
        warning('A type named ''CSC_Enum_DataInit'' already exists.');
    end
    % 43 45
    if isempty(findtype('CSC_Enum_DataAccess'))
        schema.EnumType('CSC_Enum_DataAccess', {'Direct';'Pointer'});
    else
        % 47 49
        % 48 50
        warning('A type named ''CSC_Enum_DataAccess'' already exists.');
    end
    % 51 53
    if isempty(findtype('CSC_Enum_DataScope'))
        schema.EnumType('CSC_Enum_DataScope', {'Auto';'File';'Exported';'Imported'});
    else
        % 55 59
        % 56 59
        % 57 59
        % 58 60
        warning('A type named ''CSC_Enum_DataScope'' already exists.');
    end
    % 61 63
    if isempty(findtype('CSC_Enum_CommentSource'))
        schema.EnumType('CSC_Enum_CommentSource', {'Default';'Specify'});
    else
        % 65 67
        % 66 68
        warning('A type named ''CSC_Enum_CommentSource'' already exists.');
    end
end
