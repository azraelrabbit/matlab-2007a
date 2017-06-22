function dlgstruct = getDialogSchema(hSrc, schemaName)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    tag = 'Tag_ConfigSet_Target_Tornado_';
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    widget.Name = 'MAT-file logging';
    widget.Type = 'checkbox';
    widget.ObjectProperty = 'MatFileLogging';
    widget.Tag = horzcat(tag, widget.ObjectProperty);
    widget.ToolTip = sprintf('Generate code to log data to a MATLAB .mat file.');
    matFile = widget;
    widget = [];
    % 18 20
    widget.Name = 'MAT-file variable name modifier:';
    widget.Type = 'combobox';
    widget.ObjectProperty = 'LogVarNameModifier';
    type = findtype(get(findprop(hSrc, widget.ObjectProperty), 'DataType'));
    widget.Entries = ctranspose(type.Strings);
    widget.Values = type.Values;
    widget.Enabled = double(not(hSrc.isReadonlyProperty(widget.ObjectProperty)));
    widget.Tag = horzcat(tag, widget.ObjectProperty);
    widget.ToolTip = sprintf('prefix rt_ to variable name,\nappend _rt to variable name,\nor no modification');
    varNameModifier = widget;
    widget = [];
    % 30 32
    widget.Name = 'Code Format';
    widget.Type = 'combobox';
    widget.ObjectProperty = 'CodeFormat';
    type = findtype(get(findprop(hSrc, widget.ObjectProperty), 'DataType'));
    widget.Entries = ctranspose(type.Strings);
    widget.Values = type.Values;
    widget.Enabled = double(not(hSrc.isReadonlyProperty(widget.ObjectProperty)));
    widget.Tag = horzcat(tag, widget.ObjectProperty);
    widget.ToolTip = sprintf('RealTime uses static memory allocation,\nRealTimeMalloc uses dynamic memory allocation.');
    codeFormat = widget;
    widget = [];
    % 42 44
    widget.Name = 'StethoScope';
    widget.Type = 'checkbox';
    widget.ObjectProperty = 'StethoScope';
    widget.Enabled = double(not(hSrc.isReadonlyProperty(widget.ObjectProperty)));
    widget.Tag = horzcat(tag, widget.ObjectProperty);
    widget.ObjectMethod = 'dialogCallback';
    widget.MethodArgs = cellhorzcat('%dialog', widget.Tag, '');
    widget.ArgDataTypes = {'handle','string','string'};
    widget.Mode = 1.0;
    widget.DialogRefresh = 1.0;
    widget.ToolTip = sprintf('Adds support for StethoScope monitoring\n(can not be used with external mode)');
    sScope = widget;
    widget = [];
    % 56 58
    widget.Name = 'Download to VxWorks target';
    widget.Type = 'checkbox';
    widget.ObjectProperty = 'DownloadToVxWorks';
    widget.Enabled = double(not(hSrc.isReadonlyProperty(widget.ObjectProperty)));
    widget.Tag = horzcat(tag, widget.ObjectProperty);
    widget.ToolTip = 'Download the model executable to VxWorks';
    downloadToVx = widget;
    widget = [];
    % 65 67
    widget.Name = 'Base task priority';
    widget.Type = 'edit';
    widget.ObjectProperty = 'BasePriority';
    widget.Enabled = double(not(hSrc.isReadonlyProperty(widget.ObjectProperty)));
    widget.Tag = horzcat(tag, widget.ObjectProperty);
    widget.ToolTip = sprintf('The base rate task priority, sub rate tasks will use an incremented\n(lower priority) value. VxWorks defines the range 0-255, 0 being highest.');
    baseTaskPri = widget;
    widget = [];
    % 74 76
    widget.Name = 'Task stack size';
    widget.Type = 'edit';
    widget.ObjectProperty = 'TaskStackSize';
    widget.Enabled = double(not(hSrc.isReadonlyProperty(widget.ObjectProperty)));
    widget.Tag = horzcat(tag, widget.ObjectProperty);
    widget.ToolTip = 'The stack size in bytes for each task that executes the model.';
    taskStackSize = widget;
    widget = [];
    % 83 89
    % 84 89
    % 85 89
    % 86 89
    % 87 89
    sfEnv = hSrc.getCommonOptionDialog('group');
    % 89 92
    % 90 92
    group.Name = 'Tornado';
    group.Type = 'group';
    group.Items = cellhorzcat(matFile, varNameModifier, codeFormat, sScope, downloadToVx);
    tornado = group;
    group = [];
    % 96 99
    % 97 99
    group.Name = 'VxWorks';
    group.Type = 'group';
    group.Items = cellhorzcat(baseTaskPri, taskStackSize);
    vxWorks = group;
    group = [];
    % 103 106
    % 104 106
    extModeGroup = getExtModeOptionDialog(hSrc, 'group');
    % 106 108
    extModeGroup.Items{1.0}.ObjectMethod = 'dialogCallback';
    extModeGroup.Items{1.0}.MethodArgs = cellhorzcat('%dialog', extModeGroup.Items{1.0}.Tag, '');
    extModeGroup.Items{1.0}.ArgDataTypes = {'handle','string','string'};
    % 110 112
    sfEnv.RowSpan = [1.0 1.0];
    tornado.RowSpan = [2.0 2.0];
    vxWorks.RowSpan = [3.0 3.0];
    extModeGroup.RowSpan = [4.0 4.0];
    panel.Name = '';
    panel.Type = 'panel';
    panel.Items = cellhorzcat(sfEnv, tornado, vxWorks, extModeGroup);
    panel.LayoutGrid = [5.0 1.0];
    panel.RowStretch = [0.0 0.0 0.0 0.0 1.0];
    % 120 122
    title = 'Tornado Target';
    % 122 125
    % 123 125
    if strcmp(schemaName, 'tab')
        dlgstruct.Name = title;
    else
        dlgstruct.DialogTitle = title;
    end % if
    dlgstruct.Items = cellhorzcat(panel);
end % function
