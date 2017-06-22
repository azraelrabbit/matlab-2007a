function dlg = getRTWCustomCodeDialogSchema(hSrc)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    srcCode_ToolTip = sprintf('Enter code to appear at the top of the generated <model>.c source file.');
    % 7 8
    srcCode_Name = 'Source file:';
    % 9 10
    headerCode_ToolTip = sprintf('Enter code to appear at the top of the generated <model>.h header file.');
    % 11 12
    headerCode_Name = 'Header file:';
    % 13 14
    includePath_ToolTip = sprintf('Enter a space-separated list of include directories to be added to\nthe include path when compiling the generated code.');
    % 15 17
    % 16 17
    includePath_Name = 'Include directories:';
    % 18 19
    sourceFile_ToolTip = sprintf('Enter a space-separated list of source files to be compiled and linked\nwith the generated code.');
    % 20 22
    % 21 22
    sourceFile_Name = 'Source files:';
    % 23 24
    library_ToolTip = sprintf('Enter a space-separated list of static library files to be linked\nwith the generated code.');
    % 25 27
    % 26 27
    library_Name = 'Libraries:';
    % 28 29
    customCode.Name = 'Include custom C code in generated:';
    % 30 31
    customInclude.Name = 'Include list of additional:';
    % 32 33
    customCodeTab.Name = 'Custom Code';
    % 34 39
    % 35 39
    % 36 39
    % 37 39
    % 38 39
    tag = 'Tag_ConfigSet_RTW_CustomCode_';
    widgetId = 'emlcoder.RTWConfig.';
    % 41 47
    % 42 47
    % 43 47
    % 44 47
    % 45 47
    % 46 47
    ObjectProperty = 'CustomSourceCode';
    srcCode.Name = srcCode_Name;
    srcCode.Type = 'editarea';
    srcCode.ObjectProperty = ObjectProperty;
    srcCode.Tag = horzcat(tag, ObjectProperty);
    srcCode.WidgetId = horzcat(widgetId, ObjectProperty);
    srcCode.Enabled = double(not(hSrc.isReadonlyProperty(ObjectProperty)));
    srcCode.ToolTip = srcCode_ToolTip;
    srcCode.Visible = eq(hSrc.CustomCodeList, 0.0);
    srcCode.Mode = 1.0;
    % 57 59
    % 58 59
    ObjectProperty = 'CustomHeaderCode';
    headerCode.Name = headerCode_Name;
    headerCode.Type = 'editarea';
    headerCode.ObjectProperty = ObjectProperty;
    headerCode.Tag = horzcat(tag, ObjectProperty);
    headerCode.WidgetId = horzcat(widgetId, ObjectProperty);
    headerCode.Enabled = double(not(hSrc.isReadonlyProperty(ObjectProperty)));
    headerCode.ToolTip = headerCode_ToolTip;
    headerCode.Visible = eq(hSrc.CustomCodeList, 1.0);
    headerCode.Mode = 1.0;
    % 69 71
    % 70 71
    ObjectProperty = 'CustomInclude';
    includePath.Name = includePath_Name;
    includePath.Type = 'editarea';
    includePath.ObjectProperty = ObjectProperty;
    includePath.Tag = horzcat(tag, ObjectProperty);
    includePath.WidgetId = horzcat(widgetId, ObjectProperty);
    includePath.Enabled = double(not(hSrc.isReadonlyProperty(ObjectProperty)));
    includePath.ToolTip = includePath_ToolTip;
    includePath.Visible = eq(hSrc.CustomIncludeList, 0.0);
    includePath.Mode = 1.0;
    % 81 83
    % 82 83
    ObjectProperty = 'CustomSource';
    sourceFile.Name = sourceFile_Name;
    sourceFile.Type = 'editarea';
    sourceFile.ObjectProperty = ObjectProperty;
    sourceFile.Tag = horzcat(tag, ObjectProperty);
    sourceFile.WidgetId = horzcat(widgetId, ObjectProperty);
    sourceFile.Enabled = double(not(hSrc.isReadonlyProperty(ObjectProperty)));
    sourceFile.ToolTip = sourceFile_ToolTip;
    sourceFile.Visible = eq(hSrc.CustomIncludeList, 1.0);
    sourceFile.Mode = 1.0;
    % 93 95
    % 94 95
    ObjectProperty = 'CustomLibrary';
    library.Name = library_Name;
    library.Type = 'editarea';
    library.ObjectProperty = ObjectProperty;
    library.Tag = horzcat(tag, ObjectProperty);
    library.WidgetId = horzcat(widgetId, ObjectProperty);
    library.Enabled = double(not(hSrc.isReadonlyProperty(ObjectProperty)));
    library.ToolTip = library_ToolTip;
    library.Visible = eq(hSrc.CustomIncludeList, 2.0);
    library.Mode = 1.0;
    % 105 107
    % 106 107
    ObjectProperty = 'CustomCodeList';
    customCodeList.Name = '';
    customCodeList.Type = 'listbox';
    customCodeList.Graphical = true;
    customCodeList.Entries = {'Source file','Header file'};
    customCodeList.Values = [0.0 1.0];
    customCodeList.Value = get(hSrc, ObjectProperty);
    customCodeList.MatlabMethod = 'set';
    customCodeList.MatlabArgs = cellhorzcat('%source', ObjectProperty, '%value');
    customCodeList.MultiSelect = 0.0;
    customCodeList.Tag = horzcat(tag, ObjectProperty);
    customCodeList.WidgetId = horzcat(widgetId, ObjectProperty);
    customCodeList.ToolTip = 'Select one of the item to be edited in the right panel.';
    customCodeList.Mode = 1.0;
    customCodeList.DialogRefresh = 1.0;
    % 122 124
    % 123 124
    ObjectProperty = 'CustomIncludeList';
    customIncludeList.Name = '';
    customIncludeList.Type = 'listbox';
    customIncludeList.Graphical = true;
    customIncludeList.Entries = {'Include directories','Source files','Libraries'};
    customIncludeList.Values = [0.0 1.0 2.0];
    customIncludeList.Value = get(hSrc, ObjectProperty);
    customIncludeList.MatlabMethod = 'set';
    customIncludeList.MatlabArgs = cellhorzcat('%source', ObjectProperty, '%value');
    customIncludeList.MultiSelect = 0.0;
    customIncludeList.Tag = horzcat(tag, ObjectProperty);
    customIncludeList.WidgetId = horzcat(widgetId, ObjectProperty);
    customIncludeList.ToolTip = 'Select one of the item to be edited in the right panel.';
    customIncludeList.Mode = 1.0;
    customIncludeList.DialogRefresh = 1.0;
    % 139 144
    % 140 144
    % 141 144
    % 142 144
    % 143 144
    customCodeEdit.Name = '';
    customCodeEdit.Type = 'panel';
    customCodeEdit.Items = cellhorzcat(srcCode, headerCode);
    % 147 149
    % 148 149
    customCodeList.RowSpan = [1.0 1.0];
    customCodeList.ColSpan = [1.0 1.0];
    customCodeEdit.RowSpan = [1.0 1.0];
    customCodeEdit.ColSpan = [2.0 2.0];
    customCode.Type = 'group';
    customCode.Items = cellhorzcat(customCodeList, customCodeEdit);
    customCode.LayoutGrid = [1.0 2.0];
    customCode.ColStretch = [0.0 1.0];
    % 157 159
    % 158 159
    customIncludeEdit.Name = '';
    customIncludeEdit.Type = 'panel';
    customIncludeEdit.Items = cellhorzcat(includePath, sourceFile, library);
    % 162 164
    % 163 164
    customIncludeList.RowSpan = [1.0 1.0];
    customIncludeList.ColSpan = [1.0 1.0];
    customIncludeEdit.RowSpan = [1.0 1.0];
    customIncludeEdit.ColSpan = [2.0 2.0];
    customInclude.Type = 'group';
    customInclude.Items = cellhorzcat(customIncludeList, customIncludeEdit);
    customInclude.LayoutGrid = [1.0 2.0];
    customInclude.ColStretch = [0.0 1.0];
    % 172 178
    % 173 178
    % 174 178
    % 175 178
    % 176 178
    % 177 178
    customCodeTab.Items = cellhorzcat(customCode, customInclude);
    % 179 180
    dlg = customCodeTab;
end % function
