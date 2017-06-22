function dlg = getTemplateDialog(hObj, schemaName)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    dlg = [];
    % 6 18
    % 7 18
    % 8 18
    % 9 18
    % 10 18
    % 11 18
    % 12 18
    % 13 18
    % 14 18
    % 15 18
    % 16 18
    cCodeTemplate_Name = 'Source file (*.c) template:';
    cCodeTemplate_ToolTip = 'Specify template that organizes the generated code .c source files. ';
    % 19 21
    Browse_Name = 'Browse...';
    % 21 23
    Edit_Name = 'Edit...';
    % 23 25
    hCodeTemplate_Name = 'Header file (*.h) template:';
    hCodeTemplate_ToolTip = 'Specify template that organizes the generated code .h header files. ';
    % 26 28
    cDataTemplate_Name = 'Source file (*.c) template:';
    cDataTemplate_ToolTip = 'Specify template that organizes the generated data .c source files. ';
    % 29 31
    hDataTemplate_Name = 'Header file (*.h) template:';
    hDataTemplate_ToolTip = 'Specify template that organizes the generated data .h header files. ';
    % 32 34
    genSMain_Name = 'Generate an example main program';
    genSMain_ToolTip = sprintf('Generate an example main program demonstrating\nhow to deploy the generated code.  The program is\ngenerated into ert_main.c.');
    % 35 40
    % 36 40
    % 37 40
    % 38 40
    targetOS_Name = 'Target operating system:';
    targetOS_ToolTip = sprintf('Specify the target operating system for the example main ert_main.c.\nBareBoardExample is a generic example that assumes no operating system.\nVxWorksExample is tailored to the VxWorks real-time operating system.');
    % 41 46
    % 42 46
    % 43 46
    % 44 46
    fileProcessTemplate_Name = 'File customization template:';
    fileProcessTemplate_ToolTip = 'TLC callback script for customizing the generated code.';
    % 47 49
    codeTemplateGroup.Name = 'Code templates';
    customTemplateGroup.Name = 'Custom templates';
    dataTemplateGroup.Name = 'Data templates';
    % 51 53
    pageName = 'Templates';
    % 53 58
    % 54 58
    % 55 58
    % 56 58
    tag = 'Tag_ConfigSet_RTW_Templates_';
    % 58 60
    hSrc = hObj;
    % 60 66
    % 61 66
    % 62 66
    % 63 66
    % 64 66
    ObjectProperty = 'ERTSrcFileBannerTemplate';
    widgetLbl = [];
    widgetLbl.Name = cCodeTemplate_Name;
    widgetLbl.Type = 'text';
    % 69 71
    widgetLbl.Tag = horzcat(tag, ObjectProperty, 'Lbl');
    cCodeTemplateLbl = widgetLbl;
    % 72 74
    widget = [];
    widget.Type = 'edit';
    widget.ToolTip = cCodeTemplate_ToolTip;
    widget.ObjectProperty = ObjectProperty;
    widget.Enabled = not(hSrc.isReadonlyProperty(widget.ObjectProperty));
    widget.Tag = horzcat(tag, widget.ObjectProperty);
    widget.UserData.Name = widgetLbl.Name;
    widget.Mode = 1.0;
    widget.DialogRefresh = 1.0;
    cCodeTemplate = widget;
    % 83 86
    % 84 86
    widget = [];
    widget.Name = Browse_Name;
    widget.Type = 'pushbutton';
    widget.Source = hObj;
    widget.ObjectMethod = 'dialogCallback';
    widget.Tag = horzcat(tag, 'ERTSrcFileBannerTemplate_Browse');
    widget.MethodArgs = cellhorzcat('%dialog', widget.Tag, cCodeTemplate_Name);
    widget.ArgDataTypes = {'handle','string','string'};
    widget.Enabled = cCodeTemplate.Enabled;
    widget.Mode = 1.0;
    widget.DialogRefresh = 1.0;
    cCodeTemplateBrowse = widget;
    % 97 100
    % 98 100
    widget = [];
    widget.Name = Edit_Name;
    widget.Type = 'pushbutton';
    widget.Source = hObj;
    widget.ObjectMethod = 'dialogCallback';
    widget.Tag = horzcat(tag, 'ERTSrcFileBannerTemplate_Edit');
    widget.MethodArgs = cellhorzcat('%dialog', widget.Tag, '');
    widget.ArgDataTypes = {'handle','string','string'};
    widget.Enabled = and(cCodeTemplate.Enabled, not(isempty(hSrc.ERTSrcFileBannerTemplate)));
    widget.Mode = 1.0;
    cCodeTemplateEdit = widget;
    % 110 113
    % 111 113
    ObjectProperty = 'ERTHdrFileBannerTemplate';
    widgetLbl = [];
    widgetLbl.Name = hCodeTemplate_Name;
    widgetLbl.Type = 'text';
    % 116 118
    widgetLbl.Tag = horzcat(tag, ObjectProperty, 'Lbl');
    hCodeTemplateLbl = widgetLbl;
    % 119 121
    widget = [];
    widget.Type = 'edit';
    widget.ToolTip = hCodeTemplate_ToolTip;
    widget.ObjectProperty = ObjectProperty;
    widget.Enabled = not(hSrc.isReadonlyProperty(widget.ObjectProperty));
    widget.Tag = horzcat(tag, widget.ObjectProperty);
    widget.UserData.Name = widgetLbl.Name;
    widget.Mode = 1.0;
    widget.DialogRefresh = 1.0;
    hCodeTemplate = widget;
    % 130 133
    % 131 133
    widget = [];
    widget.Name = Browse_Name;
    widget.Type = 'pushbutton';
    widget.Source = hObj;
    widget.ObjectMethod = 'dialogCallback';
    widget.Tag = horzcat(tag, 'ERTHdrFileBannerTemplate_Browse');
    widget.MethodArgs = cellhorzcat('%dialog', widget.Tag, hCodeTemplate_Name);
    widget.ArgDataTypes = {'handle','string','string'};
    widget.Enabled = hCodeTemplate.Enabled;
    widget.Mode = 1.0;
    widget.DialogRefresh = 1.0;
    hCodeTemplateBrowse = widget;
    % 144 147
    % 145 147
    widget = [];
    widget.Name = Edit_Name;
    widget.Type = 'pushbutton';
    widget.Type = 'pushbutton';
    widget.Source = hObj;
    widget.ObjectMethod = 'dialogCallback';
    widget.Tag = horzcat(tag, 'ERTHdrFileBannerTemplate_Edit');
    widget.MethodArgs = cellhorzcat('%dialog', widget.Tag, '');
    widget.ArgDataTypes = {'handle','string','string'};
    widget.Enabled = and(hCodeTemplate.Enabled, not(isempty(hSrc.ERTHdrFileBannerTemplate)));
    widget.Mode = 1.0;
    hCodeTemplateEdit = widget;
    % 158 161
    % 159 161
    ObjectProperty = 'ERTDataSrcFileTemplate';
    widgetLbl = [];
    widgetLbl.Name = cDataTemplate_Name;
    widgetLbl.Type = 'text';
    % 164 166
    widgetLbl.Tag = horzcat(tag, ObjectProperty, 'Lbl');
    cDataTemplateLbl = widgetLbl;
    % 167 169
    widget = [];
    widget.Type = 'edit';
    widget.ToolTip = cDataTemplate_ToolTip;
    widget.ObjectProperty = ObjectProperty;
    widget.Enabled = not(hSrc.isReadonlyProperty(widget.ObjectProperty));
    widget.Tag = horzcat(tag, widget.ObjectProperty);
    widget.UserData.Name = widgetLbl.Name;
    widget.Mode = 1.0;
    widget.DialogRefresh = 1.0;
    cDataTemplate = widget;
    % 178 181
    % 179 181
    widget = [];
    widget.Name = Browse_Name;
    widget.Type = 'pushbutton';
    widget.Source = hObj;
    widget.ObjectMethod = 'dialogCallback';
    widget.Tag = horzcat(tag, 'ERTDataSrcFileTemplate_Browse');
    widget.MethodArgs = cellhorzcat('%dialog', widget.Tag, cDataTemplate_Name);
    widget.ArgDataTypes = {'handle','string','string'};
    widget.Enabled = cDataTemplate.Enabled;
    widget.DialogRefresh = 1.0;
    cDataTemplateBrowse = widget;
    % 191 194
    % 192 194
    widget = [];
    widget.Name = Edit_Name;
    widget.Type = 'pushbutton';
    widget.Source = hObj;
    widget.ObjectMethod = 'dialogCallback';
    widget.Tag = horzcat(tag, 'ERTDataSrcFileTemplate_Edit');
    widget.MethodArgs = cellhorzcat('%dialog', widget.Tag, '');
    widget.ArgDataTypes = {'handle','string','string'};
    widget.Enabled = and(cDataTemplate.Enabled, not(isempty(hSrc.ERTDataSrcFileTemplate)));
    cDataTemplateEdit = widget;
    % 203 206
    % 204 206
    ObjectProperty = 'ERTDataHdrFileTemplate';
    widgetLbl = [];
    widgetLbl.Name = hDataTemplate_Name;
    widgetLbl.Type = 'text';
    % 209 211
    widgetLbl.Tag = horzcat(tag, ObjectProperty, 'Lbl');
    hDataTemplateLbl = widgetLbl;
    % 212 214
    widget = [];
    widget.Type = 'edit';
    widget.ToolTip = hDataTemplate_ToolTip;
    widget.ObjectProperty = ObjectProperty;
    widget.Enabled = not(hSrc.isReadonlyProperty(widget.ObjectProperty));
    widget.Tag = horzcat(tag, widget.ObjectProperty);
    widget.Mode = 1.0;
    widget.DialogRefresh = 1.0;
    widget.UserData.Name = widgetLbl.Name;
    hDataTemplate = widget;
    % 223 226
    % 224 226
    widget = [];
    widget.Name = Browse_Name;
    widget.Type = 'pushbutton';
    widget.Source = hObj;
    widget.ObjectMethod = 'dialogCallback';
    widget.Tag = horzcat(tag, 'ERTDataHdrFileTemplate_Browse');
    widget.MethodArgs = cellhorzcat('%dialog', widget.Tag, hDataTemplate_Name);
    widget.ArgDataTypes = {'handle','string','string'};
    widget.Enabled = hDataTemplate.Enabled;
    widget.DialogRefresh = 1.0;
    hDataTemplateBrowse = widget;
    % 236 239
    % 237 239
    widget = [];
    widget.Name = Edit_Name;
    widget.Type = 'pushbutton';
    widget.Source = hObj;
    widget.ObjectMethod = 'dialogCallback';
    widget.Tag = horzcat(tag, 'ERTDataHdrFileTemplate_Edit');
    widget.MethodArgs = cellhorzcat('%dialog', widget.Tag, '');
    widget.ArgDataTypes = {'handle','string','string'};
    widget.Enabled = and(hDataTemplate.Enabled, not(isempty(hSrc.ERTDataHdrFileTemplate)));
    hDataTemplateEdit = widget;
    % 248 251
    % 249 251
    widget = [];
    widget.Name = genSMain_Name;
    widget.Type = 'checkbox';
    widget.ObjectProperty = 'GenerateSampleERTMain';
    widget.Enabled = double(not(hSrc.isReadonlyProperty(widget.ObjectProperty)));
    widget.ToolTip = genSMain_ToolTip;
    widget.Mode = 1.0;
    widget.DialogRefresh = 1.0;
    widget.Tag = horzcat(tag, widget.ObjectProperty);
    genSMain = widget;
    % 260 263
    % 261 263
    ObjectProperty = 'TargetOS';
    widgetLbl = [];
    widgetLbl.Name = targetOS_Name;
    widgetLbl.Type = 'text';
    % 266 268
    widgetLbl.Tag = horzcat(tag, ObjectProperty, 'Lbl');
    widgetLbl.Visible = isequal(hSrc.GenerateSampleERTMain, 'on');
    targetOSLbl = widgetLbl;
    % 270 272
    widget = [];
    widget.Type = 'combobox';
    widget.ObjectProperty = ObjectProperty;
    type = findtype(get(findprop(hSrc, widget.ObjectProperty), 'DataType'));
    widget.Entries = ctranspose(type.Strings);
    widget.Values = type.Values;
    widget.Enabled = double(not(hSrc.isReadonlyProperty(widget.ObjectProperty)));
    widget.ToolTip = targetOS_ToolTip;
    widget.Visible = widgetLbl.Visible;
    widget.Tag = horzcat(tag, widget.ObjectProperty);
    widget.Mode = 1.0;
    widget.DialogRefresh = 1.0;
    widget.UserData.Name = widgetLbl.Name;
    targetOS = widget;
    % 285 288
    % 286 288
    ObjectProperty = 'ERTCustomFileTemplate';
    widgetLbl = [];
    widgetLbl.Name = fileProcessTemplate_Name;
    widgetLbl.Type = 'text';
    % 291 293
    widgetLbl.Tag = horzcat(tag, ObjectProperty, 'Lbl');
    fileProcessTemplateLbl = widgetLbl;
    % 294 296
    widget = [];
    widget.Type = 'edit';
    widget.ObjectProperty = ObjectProperty;
    widget.Enabled = not(hSrc.isReadonlyProperty(widget.ObjectProperty));
    widget.ToolTip = fileProcessTemplate_ToolTip;
    widget.Tag = horzcat(tag, widget.ObjectProperty);
    widget.UserData.Name = widgetLbl.Name;
    widget.Mode = 1.0;
    widget.DialogRefresh = 1.0;
    fileProcessTemplate = widget;
    % 305 309
    % 306 309
    % 307 309
    widget = [];
    widget.Name = Browse_Name;
    widget.Type = 'pushbutton';
    widget.Source = hObj;
    widget.ObjectMethod = 'dialogCallback';
    widget.Tag = horzcat(tag, 'ERTCustomFileTemplate_Browse');
    widget.MethodArgs = cellhorzcat('%dialog', widget.Tag, fileProcessTemplate_Name);
    widget.ArgDataTypes = {'handle','string','string'};
    widget.Enabled = fileProcessTemplate.Enabled;
    widget.Mode = 1.0;
    widget.DialogRefresh = 1.0;
    fileProcessTemplateBrowse = widget;
    % 320 323
    % 321 323
    widget = [];
    widget.Name = Edit_Name;
    widget.Type = 'pushbutton';
    widget.Source = hObj;
    widget.ObjectMethod = 'dialogCallback';
    widget.Tag = horzcat(tag, 'ERTCustomFileTemplate_Edit');
    widget.MethodArgs = cellhorzcat('%dialog', widget.Tag, '');
    widget.ArgDataTypes = {'handle','string','string'};
    widget.Enabled = and(fileProcessTemplate.Enabled, not(isempty(hSrc.ERTCustomFileTemplate)));
    fileProcessTemplateEdit = widget;
    % 332 339
    % 333 339
    % 334 339
    % 335 339
    % 336 339
    % 337 339
    cCodeTemplateLbl.RowSpan = [1.0 1.0];
    cCodeTemplateLbl.ColSpan = [1.0 1.0];
    cCodeTemplate.RowSpan = [1.0 1.0];
    cCodeTemplate.ColSpan = [2.0 2.0];
    cCodeTemplateBrowse.RowSpan = [1.0 1.0];
    cCodeTemplateBrowse.ColSpan = [3.0 3.0];
    cCodeTemplateBrowse.MaximumSize = [70.0 50.0];
    cCodeTemplateEdit.RowSpan = [1.0 1.0];
    cCodeTemplateEdit.ColSpan = [4.0 4.0];
    cCodeTemplateEdit.MaximumSize = [70.0 50.0];
    hCodeTemplateLbl.RowSpan = [2.0 2.0];
    hCodeTemplateLbl.ColSpan = [1.0 1.0];
    hCodeTemplate.RowSpan = [2.0 2.0];
    hCodeTemplate.ColSpan = [2.0 2.0];
    hCodeTemplateBrowse.RowSpan = [2.0 2.0];
    hCodeTemplateBrowse.ColSpan = [3.0 3.0];
    hCodeTemplateBrowse.MaximumSize = [70.0 50.0];
    hCodeTemplateEdit.RowSpan = [2.0 2.0];
    hCodeTemplateEdit.ColSpan = [4.0 4.0];
    hCodeTemplateEdit.MaximumSize = [70.0 50.0];
    codeTemplateGroup.Type = 'group';
    codeTemplateGroup.Items = cellhorzcat(cCodeTemplateLbl, cCodeTemplate, cCodeTemplateBrowse, cCodeTemplateEdit, hCodeTemplateLbl, hCodeTemplate, hCodeTemplateBrowse, hCodeTemplateEdit);
    % 360 362
    codeTemplateGroup.LayoutGrid = [2.0 4.0];
    codeTemplateGroup.ColStretch = [0.0 1.0 0.0 0.0];
    % 363 366
    % 364 366
    cDataTemplateLbl.RowSpan = [1.0 1.0];
    cDataTemplateLbl.ColSpan = [1.0 1.0];
    cDataTemplate.RowSpan = [1.0 1.0];
    cDataTemplate.ColSpan = [2.0 2.0];
    cDataTemplateBrowse.RowSpan = [1.0 1.0];
    cDataTemplateBrowse.ColSpan = [3.0 3.0];
    cDataTemplateBrowse.MaximumSize = [70.0 50.0];
    cDataTemplateEdit.RowSpan = [1.0 1.0];
    cDataTemplateEdit.ColSpan = [4.0 4.0];
    cDataTemplateEdit.MaximumSize = [70.0 50.0];
    hDataTemplateLbl.RowSpan = [2.0 2.0];
    hDataTemplateLbl.ColSpan = [1.0 1.0];
    hDataTemplate.RowSpan = [2.0 2.0];
    hDataTemplate.ColSpan = [2.0 2.0];
    hDataTemplateBrowse.RowSpan = [2.0 2.0];
    hDataTemplateBrowse.ColSpan = [3.0 3.0];
    hDataTemplateBrowse.MaximumSize = [70.0 50.0];
    hDataTemplateEdit.RowSpan = [2.0 2.0];
    hDataTemplateEdit.ColSpan = [4.0 4.0];
    hDataTemplateEdit.MaximumSize = [70.0 50.0];
    dataTemplateGroup.Type = 'group';
    dataTemplateGroup.Items = cellhorzcat(cDataTemplateLbl, cDataTemplate, cDataTemplateBrowse, cDataTemplateEdit, hDataTemplateLbl, hDataTemplate, hDataTemplateBrowse, hDataTemplateEdit);
    % 387 389
    dataTemplateGroup.LayoutGrid = [2.0 4.0];
    dataTemplateGroup.ColStretch = [0.0 1.0 0.0 0.0];
    % 390 393
    % 391 393
    fileProcessTemplateLbl.RowSpan = [1.0 1.0];
    fileProcessTemplateLbl.ColSpan = [1.0 1.0];
    fileProcessTemplate.RowSpan = [1.0 1.0];
    fileProcessTemplate.ColSpan = [2.0 2.0];
    fileProcessTemplateBrowse.RowSpan = [1.0 1.0];
    fileProcessTemplateBrowse.ColSpan = [3.0 3.0];
    fileProcessTemplateBrowse.MaximumSize = [70.0 50.0];
    fileProcessTemplateEdit.RowSpan = [1.0 1.0];
    fileProcessTemplateEdit.ColSpan = [4.0 4.0];
    fileProcessTemplateEdit.MaximumSize = [70.0 50.0];
    genSMain.RowSpan = [2.0 2.0];
    genSMain.ColSpan = [1.0 4.0];
    targetOSLbl.RowSpan = [3.0 3.0];
    targetOSLbl.ColSpan = [1.0 1.0];
    targetOS.RowSpan = [3.0 3.0];
    targetOS.ColSpan = [2.0 4.0];
    customTemplateGroup.Type = 'group';
    customTemplateGroup.Items = cellhorzcat(fileProcessTemplateLbl, fileProcessTemplate, fileProcessTemplateBrowse, fileProcessTemplateEdit, genSMain, targetOSLbl, targetOS);
    % 410 415
    % 411 415
    % 412 415
    % 413 415
    customTemplateGroup.LayoutGrid = [3.0 4.0];
    customTemplateGroup.ColStretch = [0.0 1.0 0.0 0.0];
    % 416 422
    % 417 422
    % 418 422
    % 419 422
    % 420 422
    codeTemplateGroup.RowSpan = [1.0 1.0];
    dataTemplateGroup.RowSpan = [2.0 2.0];
    customTemplateGroup.RowSpan = [3.0 3.0];
    dlg.Name = pageName;
    dlg.Items = cellhorzcat(codeTemplateGroup, dataTemplateGroup, customTemplateGroup);
    dlg.LayoutGrid = [4.0 1.0];
    dlg.RowStretch = [0.0 0.0 0.0 1.0];
end % function
