function dlgstruct = getDialogSchema(h, name)
    % 1 31
    % 2 31
    % 3 31
    % 4 31
    % 5 31
    % 6 31
    % 7 31
    % 8 31
    % 9 31
    % 10 31
    % 11 31
    % 12 31
    % 13 31
    % 14 31
    % 15 31
    % 16 31
    % 17 31
    % 18 31
    % 19 31
    % 20 31
    % 21 31
    % 22 31
    % 23 31
    % 24 31
    % 25 31
    % 26 31
    % 27 31
    % 28 31
    % 29 31
    % 30 31
    rIdx = 1.0;
    % 32 37
    % 33 37
    % 34 37
    % 35 37
    % 36 37
    stringValueEditArea.Name = DAStudio.message('Simulink:dialog:EnumTypeStringValuePrompt');
    stringValueEditArea.RowSpan = horzcat(rIdx, rIdx);
    stringValueEditArea.ColSpan = [1.0 2.0];
    stringValueEditArea.Type = 'editarea';
    stringValueEditArea.Tag = 'stringValueEditArea_tag';
    stringValueEditArea.ObjectProperty = 'StringValueDialogText';
    stringValueEditArea.ToolTip = DAStudio.message('Simulink:dialog:EnumTypeStringValueTooltip');
    stringValueEditArea.Mode = 1.0;
    stringValueEditArea.DialogRefresh = true;
    % 46 51
    % 47 51
    % 48 51
    % 49 51
    % 50 51
    rIdx = plus(rIdx, 1.0);
    defaultStringLbl.Name = DAStudio.message('Simulink:dialog:EnumTypeDefaultStringPrompt');
    defaultStringLbl.Type = 'text';
    defaultStringLbl.RowSpan = horzcat(rIdx, rIdx);
    defaultStringLbl.ColSpan = [1.0 1.0];
    defaultStringLbl.Tag = 'defaultStringLbl_tag';
    % 57 58
    defaultString.Name = '';
    defaultString.RowSpan = horzcat(rIdx, rIdx);
    defaultString.ColSpan = [2.0 2.0];
    defaultString.Type = 'combobox';
    defaultString.Entries = h.Strings;
    defaultString.Enabled = not(isempty(defaultString.Entries));
    defaultString.Tag = 'defaultString_tag';
    defaultString.ObjectProperty = 'DefaultString';
    defaultString.ToolTip = DAStudio.message('Simulink:dialog:EnumTypeDefaultStringTooltip');
    defaultString.Mode = 1.0;
    % 68 73
    % 69 73
    % 70 73
    % 71 73
    % 72 73
    rIdx = plus(rIdx, 1.0);
    headerFileLbl.Name = DAStudio.message('Simulink:dialog:DataTypeHeaderFilePrompt');
    headerFileLbl.Type = 'text';
    headerFileLbl.RowSpan = horzcat(rIdx, rIdx);
    headerFileLbl.ColSpan = [1.0 1.0];
    headerFileLbl.Tag = 'HeaderFileLbl';
    % 79 80
    headerFile.Name = '';
    headerFile.RowSpan = horzcat(rIdx, rIdx);
    headerFile.ColSpan = [2.0 2.0];
    headerFile.Type = 'edit';
    headerFile.Tag = 'headerFile_tag';
    headerFile.ObjectProperty = 'HeaderFile';
    % 86 91
    % 87 91
    % 88 91
    % 89 91
    % 90 91
    rIdx = plus(rIdx, 1.0);
    description.Name = DAStudio.message('Simulink:dialog:ObjectDescriptionPrompt');
    description.Type = 'editarea';
    description.Tag = 'description_tag';
    description.RowSpan = horzcat(rIdx, rIdx);
    description.ColSpan = [1.0 2.0];
    description.ObjectProperty = 'Description';
    % 98 102
    % 99 102
    % 100 102
    % 101 102
    dlgstruct.DialogTitle = horzcat(class(h), ': ', name);
    dlgstruct.Items = cellhorzcat(stringValueEditArea, defaultStringLbl, defaultString, headerFileLbl, headerFile, description);
    % 104 107
    % 105 107
    % 106 107
    dlgstruct.LayoutGrid = horzcat(rIdx, 2.0);
    dlgstruct.HelpMethod = 'helpview';
    dlgstruct.HelpArgs = cellhorzcat(horzcat(docroot, '/mapfiles/simulink.map'), 'simulink_enum_type');
    dlgstruct.RowStretch = [1.0 0.0 0.0 1.0];
    dlgstruct.ColStretch = [0.0 1.0];
end % function
