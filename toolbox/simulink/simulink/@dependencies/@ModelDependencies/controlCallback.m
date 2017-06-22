function controlCallback(obj, action, dlg)
    % 1 23
    % 2 23
    % 3 23
    % 4 23
    % 5 23
    % 6 23
    % 7 23
    % 8 23
    % 9 23
    % 10 23
    % 11 23
    % 12 23
    % 13 23
    % 14 23
    % 15 23
    % 16 23
    % 17 23
    % 18 23
    % 19 23
    % 20 23
    % 21 23
    % 22 23
    [type, key] = strtok(action, ':');
    switch type
    case 'generate'
        applyFcn = @pDialogGenerate;
    case 'export'
        applyFcn = @pDialogExport;
    case 'choose'
        applyFcn = @pDialogChoose;
    case 'edit'
        applyFcn = @pDialogEdit;
    case 'compare'
        applyFcn = @pDialogCompare;
    end % switch
    % 36 37
    applyFcn(obj, 'callback', strtok(key, ':'), dlg);
end % function
