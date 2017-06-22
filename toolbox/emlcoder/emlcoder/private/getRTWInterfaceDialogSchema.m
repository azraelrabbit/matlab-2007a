function dlg = getRTWInterfaceDialogSchema(hSrc)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    mathTarget_Name = 'Target floating-point math environment:';
    mathTarget_ToolTip = sprintf('Specify math library extension available to your target.\nC89/C90 refers to the ANSI/ISO 9899:1990 C standard.\nC99 refers to the ISO/IEC 9899:1999 C standard.\nGNU99 refers to GNU extensions to C99.');
    % 8 17
    % 9 17
    % 10 17
    % 11 17
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    % 16 17
    tag = 'Tag_ConfigSet_RTW_Target_';
    widgetId = 'Simulink.GRTTargetCC.';
    % 19 24
    % 20 24
    % 21 24
    % 22 24
    % 23 24
    ObjectProperty = 'GenFloatMathFcnCalls';
    mathTargetLbl.Name = mathTarget_Name;
    mathTargetLbl.Type = 'text';
    mathTargetLbl.Tag = horzcat(tag, ObjectProperty, 'Lbl');
    mathTargetLbl.WidgetId = horzcat(widgetId, ObjectProperty);
    % 29 30
    mathTargetList.Type = 'combobox';
    mathTargetList.ObjectProperty = ObjectProperty;
    mathTargetList.Entries = {'C89/C90 (ANSI)','C99 (ISO)','GNU99 (GNU)'};
    mathTargetList.Values = [0.0 1.0 2.0];
    mathTargetList.Enabled = double(not(hSrc.isReadonlyProperty(ObjectProperty)));
    mathTargetList.ToolTip = mathTarget_ToolTip;
    mathTargetList.Tag = horzcat(tag, ObjectProperty);
    mathTargetList.WidgetId = horzcat(widgetId, ObjectProperty);
    mathTargetList.Mode = 1.0;
    mathTargetList.DialogRefresh = 1.0;
    % 40 44
    % 41 44
    % 42 44
    % 43 44
    mathTargetLbl.RowSpan = [1.0 1.0];
    mathTargetLbl.ColSpan = [1.0 1.0];
    mathTargetList.RowSpan = [1.0 1.0];
    mathTargetList.ColSpan = [2.0 2.0];
    % 48 49
    mathTarget.Name = 'Software environment';
    mathTarget.Items = cellhorzcat(mathTargetLbl, mathTargetList);
    mathTarget.Type = 'group';
    mathTarget.LayoutGrid = [3.0 2.0];
    mathTarget.ColStretch = [0.0 1.0];
    % 54 60
    % 55 60
    % 56 60
    % 57 60
    % 58 60
    % 59 60
    interfaceTab.Name = 'Interface';
    interfaceTab.Items = cellhorzcat(mathTarget);
    interfaceTab.LayoutGrid = [3.0 2.0];
    interfaceTab.RowStretch = [0.0 0.0 1.0];
    % 64 65
    dlg = interfaceTab;
end % function
