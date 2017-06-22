function dlgstruct = getSFSimDialogSchema(hObj, schemName)
    % 1 19
    % 2 19
    % 3 19
    % 4 19
    % 5 19
    % 6 19
    % 7 19
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
    debug_Name = 'Enable debugging/animation';
    debug_ToolTip = 'Enable debugging/animation';
    % 20 22
    overflow_Name = 'Enable overflow detection (with debugging)';
    overflow_ToolTip = 'Enable overflow detection (with debugging)';
    % 23 25
    echo_Name = 'Echo expressions without semicolons';
    echo_ToolTip = 'Echo expressions without semicolons';
    % 26 28
    targetOptions_Name = 'Custom code:';
    targetOptions_Entries = {'Include Code','Initialization Code','Termination Code','Include Paths','Source Files','Libraries','Generated Code Directory','Reserved Names'};
    % 29 33
    % 30 33
    % 31 33
    targetOptions_ToolTip = 'Custom code';
    % 33 35
    includeCode_Name = 'Custom code included at the top of generated code (e.g. #include''s):';
    includeCode_ToolTip = 'Custom code included at the top of generated code (e.g. #include''s)';
    % 36 38
    includePaths_Name = 'Space-separated list of custom include directories:';
    includePaths_ToolTip = 'Space-separated list of custom include directories';
    % 39 41
    srcFiles_Name = 'Custom source files:';
    srcFiles_ToolTip = 'Custom source files';
    % 42 44
    libraries_Name = 'Custom libraries:';
    libraries_ToolTip = 'Custom libraries';
    % 45 47
    codegenDir_Name = 'Code generation directory:';
    codegenDir_ToolTip = 'Code generation directory';
    % 48 50
    init_Name = 'Custom initialization code (called from mdlInitialize):';
    init_ToolTip = 'Custom initialization code (called from mdlInitialize)';
    % 51 53
    term_Name = 'Custom termination code (called from mdlTerminate):';
    term_ToolTip = 'Custom termination code (called from mdlTerminate)';
    % 54 56
    reserved_Name = 'Reserved names:';
    reserved_ToolTip = 'Reserved names';
    % 57 59
    applyToAll_Name = 'Use settings for all libraries';
    applyToAll_ToolTip = 'Use settings for all libraries';
    % 60 62
    description_Name = 'Description:';
    description_ToolTip = 'Description';
    % 63 65
    document_Name = 'Document Link:';
    document_ToolTip = 'Document Link';
    % 66 68
    buildMode_Name = 'Build mode:';
    buildMode_Entries = {'Stateflow target (incremental)','Rebuild all (including libraries)','Make without generating code','Clean all (delete generated code/executables','Clean objects (delete executables only)'};
    % 69 74
    % 70 74
    % 71 74
    % 72 74
    buildMode_ToolTip = 'Build mode';
    % 74 76
    build_Name1 = 'Build';
    build_Name2 = 'Rebuild All';
    build_Name3 = 'Make';
    build_Name4 = 'Clean All';
    build_Name5 = 'Clean Objects';
    build_ToolTip = 'Build';
    % 81 83
    codeOptions.Name = 'Coder Options';
    % 83 85
    pageName = 'Stateflow Simulation';
    % 85 91
    % 86 91
    % 87 91
    % 88 91
    % 89 91
    hSrc = hObj.getSourceObject;
    % 91 93
    tag = 'Tag_ConfigSet_SFSim_';
    % 93 95
    currTargetOption = targetOptions_Entries{plus(hObj.SFSimTargetOptions, 1.0)};
    % 95 97
    hasSF = false;
    hModel = hSrc.getModel;
    if not(isempty(hModel))
        hModel = get_param(hModel, 'Object');
        hasSF = not(isempty(find(hModel, '-isa', 'Stateflow.Machine')));
    end % if
    % 102 108
    % 103 108
    % 104 108
    % 105 108
    % 106 108
    widget = [];
    widget.Name = debug_Name;
    widget.Type = 'checkbox';
    widget.ObjectProperty = 'SFSimEnableDebug';
    widget.Tag = horzcat(tag, widget.ObjectProperty);
    widget.Enabled = not(hSrc.isReadonlyProperty(widget.ObjectProperty));
    widget.ToolTip = debug_ToolTip;
    debug = widget;
    % 115 118
    % 116 118
    widget = [];
    widget.Name = overflow_Name;
    widget.Type = 'checkbox';
    widget.ObjectProperty = 'SFSimOverflowDetection';
    widget.Tag = horzcat(tag, widget.ObjectProperty);
    widget.Enabled = not(hSrc.isReadonlyProperty(widget.ObjectProperty));
    widget.ToolTip = overflow_ToolTip;
    overflow = widget;
    % 125 128
    % 126 128
    widget = [];
    widget.Name = echo_Name;
    widget.Type = 'checkbox';
    widget.ObjectProperty = 'SFSimEcho';
    widget.Tag = horzcat(tag, widget.ObjectProperty);
    widget.Enabled = not(hSrc.isReadonlyProperty(widget.ObjectProperty));
    widget.ToolTip = echo_ToolTip;
    echo = widget;
    % 135 139
    % 136 139
    % 137 139
    widget = [];
    ObjectProperty = 'SFSimTargetOptions';
    widget.Name = targetOptions_Name;
    widget.Type = 'listbox';
    widget.Entries = targetOptions_Entries;
    widget.MultiSelect = 0.0;
    widget.Source = hObj;
    widget.ObjectProperty = ObjectProperty;
    widget.Tag = horzcat(tag, ObjectProperty);
    widget.ToolTip = targetOptions_ToolTip;
    widget.Mode = 1.0;
    widget.DialogRefresh = 1.0;
    targetOptions = widget;
    % 151 154
    % 152 154
    widget = [];
    widget.Name = includeCode_Name;
    widget.Type = 'editarea';
    widget.ObjectProperty = 'SFSimCustomCode';
    widget.Tag = horzcat(tag, widget.ObjectProperty);
    widget.Enabled = not(hSrc.isReadonlyProperty(widget.ObjectProperty));
    widget.Visible = isequal(currTargetOption, 'Include Code');
    widget.ToolTip = includeCode_ToolTip;
    widget.MinimumSize = [50.0 50.0];
    includeCode = widget;
    % 163 166
    % 164 166
    widget = [];
    widget.Name = includePaths_Name;
    widget.Type = 'editarea';
    widget.ObjectProperty = 'SFSimUserIncludeDirs';
    widget.Tag = horzcat(tag, widget.ObjectProperty);
    widget.Enabled = not(hSrc.isReadonlyProperty(widget.ObjectProperty));
    widget.Visible = isequal(currTargetOption, 'Include Paths');
    widget.ToolTip = includePaths_ToolTip;
    includePaths = widget;
    % 174 177
    % 175 177
    widget = [];
    widget.Name = srcFiles_Name;
    widget.Type = 'editarea';
    widget.ObjectProperty = 'SFSimUserSources';
    widget.Tag = horzcat(tag, widget.ObjectProperty);
    widget.Enabled = not(hSrc.isReadonlyProperty(widget.ObjectProperty));
    widget.Visible = isequal(currTargetOption, 'Source Files');
    widget.ToolTip = srcFiles_ToolTip;
    srcFiles = widget;
    % 185 188
    % 186 188
    widget = [];
    widget.Name = libraries_Name;
    widget.Type = 'editarea';
    widget.ObjectProperty = 'SFSimUserLibraries';
    widget.Tag = horzcat(tag, widget.ObjectProperty);
    widget.Enabled = not(hSrc.isReadonlyProperty(widget.ObjectProperty));
    widget.Visible = isequal(currTargetOption, 'Libraries');
    widget.ToolTip = libraries_ToolTip;
    libraries = widget;
    % 196 199
    % 197 199
    widget = [];
    widget.Name = codegenDir_Name;
    widget.Type = 'editarea';
    widget.ObjectProperty = 'SFSimCodeGenDirectory';
    widget.Tag = horzcat(tag, widget.ObjectProperty);
    widget.Enabled = not(hSrc.isReadonlyProperty(widget.ObjectProperty));
    widget.Visible = isequal(currTargetOption, 'Generated Code Directory');
    widget.ToolTip = codegenDir_ToolTip;
    codegenDir = widget;
    % 207 210
    % 208 210
    widget = [];
    widget.Name = init_Name;
    widget.Type = 'editarea';
    widget.ObjectProperty = 'SFSimCustomInitializer';
    widget.Tag = horzcat(tag, widget.ObjectProperty);
    widget.Enabled = not(hSrc.isReadonlyProperty(widget.ObjectProperty));
    widget.Visible = isequal(currTargetOption, 'Initialization Code');
    widget.ToolTip = init_ToolTip;
    init = widget;
    % 218 221
    % 219 221
    widget = [];
    widget.Name = term_Name;
    widget.Type = 'editarea';
    widget.ObjectProperty = 'SFSimCustomTerminator';
    widget.Tag = horzcat(tag, widget.ObjectProperty);
    widget.Enabled = not(hSrc.isReadonlyProperty(widget.ObjectProperty));
    widget.Visible = isequal(currTargetOption, 'Termination Code');
    widget.ToolTip = term_ToolTip;
    term = widget;
    % 229 232
    % 230 232
    widget = [];
    widget.Name = reserved_Name;
    widget.Type = 'editarea';
    widget.ObjectProperty = 'SFSimReservedNames';
    widget.Tag = horzcat(tag, widget.ObjectProperty);
    widget.Enabled = not(hSrc.isReadonlyProperty(widget.ObjectProperty));
    widget.Visible = isequal(currTargetOption, 'Reserved Names');
    widget.ToolTip = reserved_ToolTip;
    reserved = widget;
    % 240 243
    % 241 243
    widget = [];
    widget.Name = applyToAll_Name;
    widget.Type = 'checkbox';
    widget.ObjectProperty = 'SFSimApplyToAllLibs';
    widget.Tag = horzcat(tag, widget.ObjectProperty);
    widget.Enabled = not(hSrc.isReadonlyProperty(widget.ObjectProperty));
    widget.ToolTip = applyToAll_ToolTip;
    applyToAll = widget;
    % 250 253
    % 251 253
    widget = [];
    widget.Name = buildMode_Name;
    widget.Type = 'combobox';
    widget.ObjectProperty = 'SFSimBuildMode';
    widget.Tag = horzcat(tag, widget.ObjectProperty);
    widget.Entries = buildMode_Entries;
    widget.Values = [0.0 1.0 2.0 3.0 4.0];
    widget.Enabled = not(hSrc.isReadonlyProperty(widget.ObjectProperty));
    widget.ToolTip = buildMode_ToolTip;
    widget.Mode = 1.0;
    widget.DialogRefresh = 1.0;
    buildMode = widget;
    % 264 267
    % 265 267
    widget = [];
    if isequal(hSrc.SFSimBuildMode, 'Incremental')
        widget.Name = build_Name1;
    else
        if isequal(hSrc.SFSimBuildMode, 'BuildAll')
            widget.Name = build_Name2;
        else
            if isequal(hSrc.SFSimBuildMode, 'CleanAll')
                widget.Name = build_Name4;
            else
                if isequal(hSrc.SFSimBuildMode, 'CleanObjects')
                    widget.Name = build_Name5;
                else
                    widget.Name = build_Name3;
                end % if
            end % if
        end % if
    end % if
    widget.Type = 'pushbutton';
    widget.Tag = horzcat(tag, 'Build');
    widget.Enabled = and(not(hSrc.isReadonlyProperty('SFSimBuildMode')), not(isempty(hSrc.getModel)));
    widget.ToolTip = build_ToolTip;
    widget.Mode = 1.0;
    widget.DialogRefresh = 1.0;
    widget.Source = hObj;
    widget.ObjectMethod = 'dialogCallback';
    widget.MethodArgs = cellhorzcat('%dialog', widget.Tag, '');
    widget.ArgDataTypes = {'handle','string','string'};
    build = widget;
    widget = [];
    widget.Name = description_Name;
    widget.Type = 'editarea';
    widget.ObjectProperty = 'Description';
    widget.Tag = horzcat(tag, widget.ObjectProperty);
    widget.Enabled = not(hSrc.isReadonlyProperty(widget.ObjectProperty));
    widget.ToolTip = description_ToolTip;
    widget.Visible = 0.0;
    description = widget;
    widget = [];
    widget.Name = document_Name;
    widget.Type = 'edit';
    widget.ObjectProperty = 'SFSimDocument';
    widget.Tag = horzcat(tag, widget.ObjectProperty);
    widget.Enabled = not(hSrc.isReadonlyProperty(widget.ObjectProperty));
    widget.ToolTip = document_ToolTip;
    document = widget;
    % 312 318
    % 313 318
    % 314 318
    % 315 318
    % 316 318
    targetOptionsEdit.Name = '';
    targetOptionsEdit.Type = 'panel';
    targetOptionsEdit.Items = cellhorzcat(includeCode, init, term, includePaths, srcFiles, libraries, codegenDir, reserved);
    % 320 324
    % 321 324
    % 322 324
    targetOptions.RowSpan = [1.0 1.0];
    targetOptions.ColSpan = [1.0 1.0];
    targetOptionsEdit.RowSpan = [1.0 1.0];
    targetOptionsEdit.ColSpan = [2.0 2.0];
    targetOptionsGroup.Name = 'Include custom c-code in generated:';
    targetOptionsGroup.Type = 'panel';
    targetOptionsGroup.Items = cellhorzcat(targetOptions, targetOptionsEdit);
    targetOptionsGroup.LayoutGrid = [1.0 2.0];
    targetOptionsGroup.ColStretch = [0.0 1.0];
    % 332 335
    % 333 335
    debug.RowSpan = [1.0 1.0];
    debug.ColSpan = [1.0 1.0];
    overflow.RowSpan = [2.0 2.0];
    overflow.ColSpan = [1.0 2.0];
    echo.RowSpan = [1.0 1.0];
    echo.ColSpan = [2.0 2.0];
    codeOptions.Type = 'group';
    codeOptions.Items = cellhorzcat(debug, overflow, echo);
    codeOptions.LayoutGrid = [2.0 2.0];
    % 343 346
    % 344 346
    buildMode.RowSpan = [1.0 1.0];
    buildMode.ColSpan = [1.0 1.0];
    build.RowSpan = [1.0 1.0];
    build.ColSpan = [2.0 2.0];
    buildGroup.Name = '';
    buildGroup.Type = 'panel';
    buildGroup.Items = cellhorzcat(buildMode, build);
    buildGroup.LayoutGrid = [1.0 2.0];
    % 353 356
    % 354 356
    targetOptionsGroup.RowSpan = [1.0 1.0];
    targetOptionsGroup.ColSpan = [1.0 1.0];
    codeOptions.RowSpan = [2.0 2.0];
    codeOptions.ColSpan = [1.0 1.0];
    buildGroup.RowSpan = [3.0 3.0];
    buildGroup.ColSpan = [1.0 1.0];
    applyToAll.RowSpan = [4.0 4.0];
    applyToAll.ColSpan = [1.0 1.0];
    document.RowSpan = [5.0 5.0];
    document.ColSpan = [1.0 1.0];
    panel.Name = '';
    panel.Type = 'panel';
    panel.Tag = horzcat(tag, 'Panel');
    panel.Items = cellhorzcat(targetOptionsGroup, codeOptions, buildGroup, applyToAll, document);
    % 369 371
    panel.LayoutGrid = [5.0 1.0];
    panel.RowStretch = [1.0 0.0 0.0 0.0 0.0];
    % 372 379
    % 373 379
    % 374 379
    % 375 379
    % 376 379
    % 377 379
    if strcmp(schemName, 'list')
        if hasSF
            dlgstruct.List = cellhorzcat(pageName);
            dlgstruct.Item = panel;
        else
            dlgstruct = [];
        end % if
    else
        if strcmp(schemName, 'tab')
            if hasSF
                panel.RowSpan = [1.0 1.0];
                dlgstruct.Name = pageName;
                dlgstruct.Items = cellhorzcat(panel);
                dlgstruct.LayoutGrid = [1.0 1.0];
                dlgstruct.RowStretch = 1.0;
            else
                dlgstruct = [];
            end % if
        else
            if strcmp(schemName, 'stack')
                panel.Source = hSrc;
                if hasSF
                    dlgstruct.List = cellhorzcat(pageName);
                    dlgstruct.Items = cellhorzcat(panel);
                    dlgstruct.Ids = {[0.0]};
                else
                    dlgstruct = [];
                end % if
            else
                dlgstruct.DialogTitle = pageName;
                dlgstruct.Items = cellhorzcat(panel);
                dlgstruct.HelpMethod = 'slprivate';
                dlgstruct.HelpArgs = cellhorzcat('configHelp', '%dialog', hObj, schemName, pageName);
            end % if
        end % if
    end % if
end % function
