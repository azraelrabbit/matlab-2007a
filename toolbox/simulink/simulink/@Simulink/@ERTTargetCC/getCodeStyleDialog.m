function dlg = getCodeStyleDialog(hObj, schemaName)
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
    parenLevel_Name = 'Parentheses level:';
    parenLevel_ToolTip = 'Specify the level of parenthesization in the code.';
    % 21 22
    parenLevel_Entries = {'Minimum (C operator precedence)','Nominal (Optimized for readability)','Maximum (MISRA C compliance)'};
    % 23 26
    % 24 26
    % 25 26
    parenLevel_Values = [0.0 1.0 2.0];
    % 27 28
    preserveExprOrder_Name = 'Preserve operand order in expression';
    preserveExprOrder_ToolTip = sprintf('By default, Real-Time Workshop may reorder commutable operands\nso as to make an expression left recursive.  Selecting this\noption retains the expression order specified in the model.');
    % 30 33
    % 31 33
    % 32 33
    preserveIfCond_Name = 'Preserve condition expression in if statement';
    preserveIfCond_ToolTip = sprintf('By default, Real-Time Workshop will negate the condition expression\nin an "if" statement if the first logic branch is empty.  Selecting this\noption retains the condition expression specified in the model.');
    % 35 38
    % 36 38
    % 37 38
    pageName = 'Code Style';
    % 39 44
    % 40 44
    % 41 44
    % 42 44
    % 43 44
    tag = 'Tag_ConfigSet_RTW_CodeStyle_';
    hSrc = hObj;
    % 46 52
    % 47 52
    % 48 52
    % 49 52
    % 50 52
    % 51 52
    widgetLbl = [];
    ObjectProperty = 'ParenthesesLevel';
    widgetLbl.Name = parenLevel_Name;
    widgetLbl.Type = 'text';
    widgetLbl.Tag = horzcat(tag, ObjectProperty, 'Lbl');
    widgetLbl.WidgetId = horzcat('Simulink.ERTTargetCC.', ObjectProperty, 'Lbl');
    parenLevelLbl = widgetLbl;
    % 59 60
    widget = [];
    widget.Type = 'combobox';
    widget.Entries = parenLevel_Entries;
    widget.Values = parenLevel_Values;
    widget.ObjectProperty = ObjectProperty;
    widget.Enabled = not(hSrc.isReadonlyProperty(widget.ObjectProperty));
    widget.ToolTip = parenLevel_ToolTip;
    widget.Tag = horzcat(tag, widget.ObjectProperty);
    widget.UserData.Name = widgetLbl.Name;
    widget.Mode = 1.0;
    widget.WidgetId = horzcat('Simulink.ERTTargetCC.', widget.ObjectProperty);
    parenLevel = widget;
    % 72 74
    % 73 74
    widget = [];
    widget.Type = 'checkbox';
    widget.ObjectProperty = 'PreserveExpressionOrder';
    widget.Enabled = not(hSrc.isReadonlyProperty(widget.ObjectProperty));
    widget.ToolTip = preserveExprOrder_ToolTip;
    widget.Tag = horzcat(tag, widget.ObjectProperty);
    widget.Name = preserveExprOrder_Name;
    widget.Mode = 1.0;
    widget.WidgetId = horzcat('Simulink.ERTTargetCC.', widget.ObjectProperty);
    preserveExprOrder = widget;
    % 84 86
    % 85 86
    widget = [];
    widget.Type = 'checkbox';
    widget.ObjectProperty = 'PreserveIfCondition';
    widget.Enabled = not(hSrc.isReadonlyProperty(widget.ObjectProperty));
    widget.ToolTip = preserveIfCond_ToolTip;
    widget.Tag = horzcat(tag, widget.ObjectProperty);
    widget.Name = preserveIfCond_Name;
    widget.Mode = 1.0;
    widget.WidgetId = horzcat('Simulink.ERTTargetCC.', widget.ObjectProperty);
    preserveIfCond = widget;
    % 96 101
    % 97 101
    % 98 101
    % 99 101
    % 100 101
    parenLevelLbl.RowSpan = [1.0 1.0];
    parenLevelLbl.ColSpan = [1.0 1.0];
    parenLevel.RowSpan = [1.0 1.0];
    parenLevel.ColSpan = [2.0 2.0];
    preserveExprOrder.RowSpan = [2.0 2.0];
    preserveExprOrder.ColSpan = [1.0 2.0];
    preserveIfCond.RowSpan = [3.0 3.0];
    preserveIfCond.ColSpan = [1.0 2.0];
    % 109 110
    group = [];
    group.Name = pageName;
    group.Type = 'group';
    group.Items = cellhorzcat(parenLevelLbl, parenLevel, preserveExprOrder, preserveIfCond);
    group.LayoutGrid = [4.0 2.0];
    group.RowStretch = [0.0 0.0 0.0 1.0];
    group.ColStretch = [0.0 1.0];
    % 117 122
    % 118 122
    % 119 122
    % 120 122
    % 121 122
    dlg.Name = pageName;
    dlg.Items = cellhorzcat(group);
    dlg.LayoutGrid = [1.0 1.0];
    dlg.RowStretch = 1.0;
end % function
