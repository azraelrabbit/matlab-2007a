function saveGrp = getSchema_saveGrp(hUI)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    filepath = hUI.RegFileInfo{1.0};
    filename = hUI.RegFileInfo{2.0};
    fileext = hUI.RegFileInfo{3.0};
    filelong = horzcat(filepath, filesep, filename, fileext);
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    % 14 15
    tmpLoc = LocalPathBrief(filepath, 50.0);
    fileLoc.Name = horzcat('Location: ', tmpLoc);
    fileLoc.ToolTip = sprintf('Path of the file to save to:\n%s', filelong);
    fileLoc.Type = 'text';
    fileLoc.Tag = 'tLocationText';
    fileLoc.Mode = 1.0;
    fileLoc.DialogRefresh = 1.0;
    % 22 27
    % 23 27
    % 24 27
    % 25 27
    % 26 27
    saveButton.Name = 'Save';
    saveButton.Type = 'pushbutton';
    saveButton.Tag = 'tSaveButton';
    saveButton.ObjectMethod = 'saveCurrPackage';
    saveButton.Mode = 1.0;
    saveButton.DialogRefresh = 1.0;
    % 33 38
    % 34 38
    % 35 38
    % 36 38
    % 37 38
    saveGrp.Name = sprintf('Filename: %s%s ', filename, fileext);
    saveGrp.Type = 'group';
    saveGrp.Tag = 'tSaveGroup';
    saveGrp.LayoutGrid = [1.0 3.0];
    % 42 43
    fileLoc.RowSpan = [1.0 1.0];
    fileLoc.ColSpan = [1.0 2.0];
    saveButton.RowSpan = [1.0 1.0];
    saveButton.ColSpan = [3.0 3.0];
    % 47 48
    saveGrp.Items = cellhorzcat(fileLoc, saveButton);
    saveGrp.ColStretch = [0.0 1.0 0.0];
end % function
function rtn = LocalPathBrief(orig_path, brief_len)
    % 52 56
    % 53 56
    % 54 56
    % 55 56
    if le(length(orig_path), brief_len)
        rtn = orig_path;
    else
        keep_len = minus(brief_len, 3.0);
        rtn = horzcat(orig_path(1.0:keep_len), '...');
    end % if
end % function
