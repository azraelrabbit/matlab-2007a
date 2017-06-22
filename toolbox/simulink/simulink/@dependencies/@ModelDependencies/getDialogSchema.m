function dlgStruct = getDialogSchema(obj, schemaName)
    % 1 16
    % 2 16
    % 3 16
    % 4 16
    % 5 16
    % 6 16
    % 7 16
    % 8 16
    % 9 16
    % 10 16
    % 11 16
    % 12 16
    % 13 16
    % 14 16
    % 15 16
    switch schemaName
    case 'generate'
        dlgStruct = pDialogGenerate(obj, 'create');
    case 'compare'
        dlgStruct = pDialogCompare(obj, 'create');
    case 'choose'
        dlgStruct = pDialogChoose(obj, 'create');
    case 'edit'
        dlgStruct = pDialogEdit(obj, 'create');
    case 'export'
        dlgStruct = pDialogExport(obj, 'create');
    otherwise
        error('Unknown schema name');
    end % switch
end % function
