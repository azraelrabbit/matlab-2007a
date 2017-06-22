function dlg = getRTWCustomCodeDialogSchema(hObj, schemaName)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    dlg = [];
    % 8 19
    % 9 19
    % 10 19
    % 11 19
    % 12 19
    % 13 19
    % 14 19
    % 15 19
    % 16 19
    % 17 19
    % 18 19
    srcCode_ToolTip = sprintf('Enter code to appear at the top of the generated <model>.c source file.');
    % 20 21
    srcCode_Name = 'Source file:';
    % 22 23
    headerCode_ToolTip = sprintf('Enter code to appear at the top of the generated <model>.h header file.');
    % 24 25
    headerCode_Name = 'Header file:';
    % 26 27
    includePath_ToolTip = sprintf('Enter a space-separated list of include directories to be added to\nthe include path when compiling the generated code.');
    % 28 30
    % 29 30
    includePath_Name = 'Include directories:';
    % 31 32
    sourceFile_ToolTip = sprintf('Enter a space-separated list of source files to be compiled and linked\nwith the generated code.');
    % 33 35
    % 34 35
    sourceFile_Name = 'Source files:';
    % 36 37
    library_ToolTip = sprintf('Enter a space-separated list of static library files to be linked\nwith the generated code.');
    % 38 40
    % 39 40
    library_Name = 'Libraries:';
    % 41 42
    initializer_ToolTip = sprintf('Enter code to appear in the generated model initialize function.');
    % 43 45
    % 44 45
    initializer_Name = 'Initialize function:';
    % 46 47
    terminator_ToolTip = sprintf('Enter code to appear in the generated model terminate function.');
    % 48 49
    terminator_Name = 'Terminate function:';
    % 50 51
    customCodeList_Name = '';
    customCodeList_Entries = {'Source file','Header file','Initialize function','Terminate function'};
    customCodeList_ToolTip = 'Select one of the item to be edited in the right panel.';
    % 54 55
    customIncludeList_Name = '';
    customIncludeList_Entries = {'Include directories','Source files','Libraries'};
    customIncludeList_ToolTip = 'Select one of the item to be edited in the right panel.';
    % 58 59
    customCode.Name = 'Include custom c-code in generated:';
    % 60 61
    customInclude.Name = 'Include list of additional:';
    % 62 63
    customCodeTab.Name = 'Custom Code';
    % 64 68
    % 65 68
    % 66 68
    % 67 68
    hSrc = hObj.getSourceObject;
    % 69 70
    tag = 'Tag_ConfigSet_RTW_CustomCode_';
    widgetId = 'Simulink.RTWCC.';
    % 72 73
    hConfigSet = hSrc.getConfigSet;
    hCodeApp = hSrc.getComponent('Code Appearance');
    % 75 76
    isERT = strcmp(get(hSrc.getComponent('Target'), 'isERTTarget'), 'on');
    % 77 83
    % 78 83
    % 79 83
    % 80 83
    % 81 83
    % 82 83
    ObjectProperty = 'CustomSourceCode';
    widget = [];
    widget.Name = srcCode_Name;
    widget.Type = 'editarea';
    widget.ObjectProperty = ObjectProperty;
    widget.Tag = horzcat(tag, ObjectProperty);
    widget.WidgetId = horzcat(widgetId, ObjectProperty);
    widget.Enabled = double(not(hSrc.isReadonlyProperty(ObjectProperty)));
    widget.ToolTip = srcCode_ToolTip;
    widget.Visible = eq(hObj.CustomCodeList, 0.0);
    widget.Mode = 1.0;
    srcCode = widget;
    % 95 97
    % 96 97
    ObjectProperty = 'CustomHeaderCode';
    widget = [];
    widget.Name = headerCode_Name;
    widget.Type = 'editarea';
    widget.ObjectProperty = ObjectProperty;
    widget.Tag = horzcat(tag, ObjectProperty);
    widget.WidgetId = horzcat(widgetId, ObjectProperty);
    widget.Enabled = double(not(hSrc.isReadonlyProperty(ObjectProperty)));
    widget.ToolTip = headerCode_ToolTip;
    widget.Visible = eq(hObj.CustomCodeList, 1.0);
    widget.Mode = 1.0;
    headerCode = widget;
    % 109 111
    % 110 111
    ObjectProperty = 'CustomInclude';
    widget = [];
    widget.Name = includePath_Name;
    widget.Type = 'editarea';
    widget.ObjectProperty = ObjectProperty;
    widget.Tag = horzcat(tag, ObjectProperty);
    widget.WidgetId = horzcat(widgetId, ObjectProperty);
    widget.Enabled = double(not(hSrc.isReadonlyProperty(ObjectProperty)));
    widget.ToolTip = includePath_ToolTip;
    widget.Visible = eq(hObj.CustomIncludeList, 0.0);
    widget.Mode = 1.0;
    includePath = widget;
    % 123 125
    % 124 125
    ObjectProperty = 'CustomSource';
    widget = [];
    widget.Name = sourceFile_Name;
    widget.Type = 'editarea';
    widget.ObjectProperty = ObjectProperty;
    widget.Tag = horzcat(tag, ObjectProperty);
    widget.WidgetId = horzcat(widgetId, ObjectProperty);
    widget.Enabled = double(not(hSrc.isReadonlyProperty(ObjectProperty)));
    widget.ToolTip = sourceFile_ToolTip;
    widget.Visible = eq(hObj.CustomIncludeList, 1.0);
    widget.Mode = 1.0;
    sourceFile = widget;
    % 137 139
    % 138 139
    ObjectProperty = 'CustomLibrary';
    widget = [];
    widget.Name = library_Name;
    widget.Type = 'editarea';
    widget.ObjectProperty = ObjectProperty;
    widget.Tag = horzcat(tag, ObjectProperty);
    widget.WidgetId = horzcat(widgetId, ObjectProperty);
    widget.Enabled = double(not(hSrc.isReadonlyProperty(ObjectProperty)));
    widget.ToolTip = library_ToolTip;
    widget.Visible = eq(hObj.CustomIncludeList, 2.0);
    widget.Mode = 1.0;
    library = widget;
    % 151 153
    % 152 153
    ObjectProperty = 'CustomInitializer';
    widget = [];
    widget.Name = initializer_Name;
    widget.Type = 'editarea';
    widget.ObjectProperty = ObjectProperty;
    widget.Tag = horzcat(tag, ObjectProperty);
    widget.WidgetId = horzcat(widgetId, ObjectProperty);
    widget.Enabled = double(not(hSrc.isReadonlyProperty(ObjectProperty)));
    widget.ToolTip = initializer_ToolTip;
    widget.Visible = eq(hObj.CustomCodeList, 2.0);
    widget.Mode = 1.0;
    initializer = widget;
    % 165 167
    % 166 167
    ObjectProperty = 'CustomTerminator';
    widget = [];
    widget.Name = terminator_Name;
    widget.Type = 'editarea';
    widget.ObjectProperty = ObjectProperty;
    widget.Tag = horzcat(tag, ObjectProperty);
    widget.WidgetId = horzcat(widgetId, ObjectProperty);
    widget.Enabled = double(not(hSrc.isReadonlyProperty(ObjectProperty)));
    widget.ToolTip = terminator_ToolTip;
    widget.Visible = eq(hObj.CustomCodeList, 3.0);
    widget.Mode = 1.0;
    terminator = widget;
    % 179 181
    % 180 181
    ObjectProperty = 'CustomCodeList';
    widget = [];
    widget.Name = customCodeList_Name;
    widget.Type = 'listbox';
    widget.Graphical = true;
    widget.Entries = customCodeList_Entries;
    widget.MultiSelect = 0.0;
    widget.Source = hObj;
    widget.ObjectProperty = ObjectProperty;
    widget.Tag = horzcat(tag, ObjectProperty);
    widget.WidgetId = horzcat(widgetId, ObjectProperty);
    widget.ToolTip = customCodeList_ToolTip;
    widget.Mode = 1.0;
    widget.DialogRefresh = 1.0;
    customCodeList = widget;
    % 196 198
    % 197 198
    ObjectProperty = 'CustomIncludeList';
    widget = [];
    widget.Name = customIncludeList_Name;
    widget.Type = 'listbox';
    widget.Graphical = true;
    widget.Entries = customIncludeList_Entries;
    widget.MultiSelect = 0.0;
    widget.Source = hObj;
    widget.ObjectProperty = ObjectProperty;
    widget.Tag = horzcat(tag, ObjectProperty);
    widget.WidgetId = horzcat(widgetId, ObjectProperty);
    widget.ToolTip = customIncludeList_ToolTip;
    widget.Mode = 1.0;
    widget.DialogRefresh = 1.0;
    customIncludeList = widget;
    % 213 218
    % 214 218
    % 215 218
    % 216 218
    % 217 218
    customCodeEdit.Name = '';
    customCodeEdit.Type = 'panel';
    customCodeEdit.Items = cellhorzcat(srcCode, headerCode, initializer, terminator);
    % 221 223
    % 222 223
    customCodeList.RowSpan = [1.0 1.0];
    customCodeList.ColSpan = [1.0 1.0];
    customCodeEdit.RowSpan = [1.0 1.0];
    customCodeEdit.ColSpan = [2.0 2.0];
    customCode.Type = 'group';
    customCode.Items = cellhorzcat(customCodeList, customCodeEdit);
    customCode.LayoutGrid = [1.0 2.0];
    customCode.ColStretch = [0.0 1.0];
    % 231 233
    % 232 233
    customIncludeEdit.Name = '';
    customIncludeEdit.Type = 'panel';
    customIncludeEdit.Items = cellhorzcat(includePath, sourceFile, library);
    % 236 238
    % 237 238
    customIncludeList.RowSpan = [1.0 1.0];
    customIncludeList.ColSpan = [1.0 1.0];
    customIncludeEdit.RowSpan = [1.0 1.0];
    customIncludeEdit.ColSpan = [2.0 2.0];
    customInclude.Type = 'group';
    customInclude.Items = cellhorzcat(customIncludeList, customIncludeEdit);
    customInclude.LayoutGrid = [1.0 2.0];
    customInclude.ColStretch = [0.0 1.0];
    % 246 252
    % 247 252
    % 248 252
    % 249 252
    % 250 252
    % 251 252
    customCodeTab.Items = cellhorzcat(customCode, customInclude);
    % 253 254
    dlg = customCodeTab;
end % function
