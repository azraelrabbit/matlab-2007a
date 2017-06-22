function group = getTargetSoftwareDialogGroup(h, schemaName)
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
    mathTarget_Name = 'Target floating-point math environment:';
    mathTarget_ToolTip = sprintf('Specify math library extension available to your target.\nC89/C90 refers to the ANSI/ISO 9899:1990 C standard.\nC99 refers to the ISO/IEC 9899:1999 C standard.\nGNU99 refers to GNU extensions to C99.');
    % 17 23
    % 18 23
    % 19 23
    % 20 23
    % 21 23
    utilityFuncGeneration_Name = 'Utility function generation';
    utilityFuncGeneration_ToolTip = sprintf('Specify where utility functions are generated.');
    % 24 27
    % 25 27
    group.Name = 'Software environment';
    utility_entries = {'Auto','Shared location'};
    % 28 34
    % 29 34
    % 30 34
    % 31 34
    % 32 34
    tag = 'Tag_ConfigSet_RTW_Target_';
    widgetId = 'Simulink.GRTTargetCC.';
    % 35 37
    hSrc = h.getSourceObject;
    % 37 39
    persistent environmentTable;
    if isempty(environmentTable)
        environmentTable = getSoftwareEnvironments('');
    end
    curEnvironment = getSoftwareEnvironments('Type', hSrc.GenFloatMathFcnCalls);
    % 43 49
    % 44 49
    % 45 49
    % 46 49
    % 47 49
    widget = [];
    ObjectProperty = 'GenFloatMathFcnCalls';
    widgetLbl = [];
    widgetLbl.Name = mathTarget_Name;
    widgetLbl.Type = 'text';
    % 53 55
    widgetLbl.Tag = horzcat(tag, ObjectProperty, 'Lbl');
    widgetLbl.WidgetId = horzcat(widgetId, ObjectProperty);
    mathTargetLbl = widgetLbl;
    % 57 59
    widget.Type = 'combobox';
    widget.Entries = cellhorzcat(environmentTable.Name);
    widget.Value = curEnvironment.Name;
    widget.Enabled = double(not(hSrc.isReadonlyProperty(ObjectProperty)));
    widget.ToolTip = mathTarget_ToolTip;
    widget.Tag = horzcat(tag, ObjectProperty);
    widget.WidgetId = horzcat(widgetId, ObjectProperty);
    widget.Source = h;
    widget.Mode = 1.0;
    widget.DialogRefresh = 1.0;
    widget.ObjectMethod = 'dialogCallback';
    widget.MethodArgs = cellhorzcat('%dialog', widget.Tag, '');
    widget.ArgDataTypes = {'handle','string','string'};
    widget.UserData.ObjectProperty = ObjectProperty;
    widget.UserData.Name = widgetLbl.Name;
    mathTarget = widget;
    % 74 76
    widget = [];
    ObjectProperty = 'UtilityFuncGeneration';
    widgetLbl = [];
    widgetLbl.Name = utilityFuncGeneration_Name;
    widgetLbl.Type = 'text';
    % 80 82
    widgetLbl.Tag = horzcat(tag, ObjectProperty, 'Lbl');
    widgetLbl.WidgetId = horzcat(widgetId, ObjectProperty);
    utilityFuncGenerationLbl = widgetLbl;
    % 84 86
    widget.Type = 'combobox';
    widget.Entries = utility_entries;
    widget.Values = [0.0 1.0];
    widget.Value = get(hSrc, ObjectProperty);
    widget.Enabled = double(not(hSrc.isReadonlyProperty(ObjectProperty)));
    widget.ToolTip = utilityFuncGeneration_ToolTip;
    widget.Tag = horzcat(tag, ObjectProperty);
    widget.WidgetId = horzcat(widgetId, ObjectProperty);
    widget.ObjectProperty = ObjectProperty;
    widget.Mode = 1.0;
    widget.DialogRefresh = 1.0;
    widget.UserData.ObjectProperty = ObjectProperty;
    widget.UserData.Name = widgetLbl.Name;
    utilityFuncGeneration = widget;
    widget = [];
    % 100 105
    % 101 105
    % 102 105
    % 103 105
    mathTargetLbl.RowSpan = [1.0 1.0];
    mathTargetLbl.ColSpan = [1.0 1.0];
    mathTarget.RowSpan = [1.0 1.0];
    mathTarget.ColSpan = [2.0 2.0];
    utilityFuncGenerationLbl.RowSpan = [2.0 2.0];
    utilityFuncGenerationLbl.ColSpan = [1.0 1.0];
    utilityFuncGeneration.RowSpan = [2.0 2.0];
    utilityFuncGeneration.ColSpan = [2.0 2.0];
    group.Items = cellhorzcat(mathTargetLbl, mathTarget, utilityFuncGenerationLbl, utilityFuncGeneration);
    group.LayoutGrid = [2.0 2.0];
    group.ColStretch = [0.0 1.0];
    % 115 117
    if strcmp(schemaName, 'panel')
        group.Type = 'panel';
    else
        if strcmp(schemaName, 'group')
            group.Type = 'group';
        else
            group = [];
        end
    end
end
