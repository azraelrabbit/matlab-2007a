function dlgstruct = getDialogSchema(hSrc, schemaName)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    tag = 'Tag_ConfigSet_Target_RTWIN_';
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    widget.Name = 'Compiler optimizations';
    widget.Type = 'checkbox';
    widget.ObjectProperty = 'CCOptimize';
    widget.Tag = horzcat(tag, widget.ObjectProperty);
    widget.Enabled = double(not(hSrc.isReadonlyProperty(widget.ObjectProperty)));
    widget.ToolTip = horzcat('Instructs the C compiler to generate real-time', sprintf('\n'), 'code fully optimized for speed');
    % 17 20
    % 18 20
    ccOpt = widget;
    widget = [];
    % 21 23
    widget.Name = 'Generate assembly listings';
    widget.Type = 'checkbox';
    widget.ObjectProperty = 'CCListing';
    widget.Enabled = double(not(hSrc.isReadonlyProperty(widget.ObjectProperty)));
    widget.Tag = horzcat(tag, widget.ObjectProperty);
    widget.ToolTip = horzcat('Instructs the C compiler to generate assembly', sprintf('\n'), 'listing for the generated code');
    % 28 31
    % 29 31
    ccList = widget;
    widget = [];
    % 32 34
    widget.Name = 'Rebuild all';
    widget.Type = 'checkbox';
    widget.ObjectProperty = 'RebuildAll';
    widget.Enabled = double(not(hSrc.isReadonlyProperty(widget.ObjectProperty)));
    widget.Tag = horzcat(tag, widget.ObjectProperty);
    widget.ToolTip = horzcat('Forces all the object files to be always rebuilt', sprintf('\n'), 'regardless of their time stamps');
    % 39 42
    % 40 42
    rebuildAll = widget;
    widget = [];
    % 43 50
    % 44 50
    % 45 50
    % 46 50
    % 47 50
    % 48 50
    sfEnv = hSrc.getCommonOptionDialog('group');
    % 50 53
    % 51 53
    group.Name = 'Target options';
    group.Type = 'group';
    group.Items = cellhorzcat(ccOpt, ccList, rebuildAll);
    target = group;
    group = [];
    % 57 60
    % 58 60
    extModeGroup = getExtModeOptionDialog(hSrc, 'group');
    % 60 62
    sfEnv.RowSpan = [1.0 1.0];
    target.RowSpan = [2.0 2.0];
    extModeGroup.RowSpan = [3.0 3.0];
    panel.Name = '';
    panel.Type = 'panel';
    panel.Items = cellhorzcat(sfEnv, target, extModeGroup);
    panel.LayoutGrid = [4.0 1.0];
    panel.RowStretch = [0.0 0.0 0.0 1.0];
    % 69 71
    title = 'Real-Time Windows Target';
    % 71 74
    % 72 74
    if strcmp(schemaName, 'tab')
        dlgstruct.Name = title;
    else
        dlgstruct.DialogTitle = title;
    end % if
    dlgstruct.Items = cellhorzcat(panel);
end % function
