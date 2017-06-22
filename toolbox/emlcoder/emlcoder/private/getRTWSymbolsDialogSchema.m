function dlg = getRTWSymbolsDialogSchema(hSrc)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    maxId_Name = 'Maximum identifier length:';
    maxId_ToolTip = 'Maximum identifier length for variable, typedef, and function names.';
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    % 12 13
    tag = 'Tag_ConfigSet_RTW_Target_';
    widgetId = 'Simulink.GRTTargetCC.';
    symbolsPageName = sprintf('Real-Time Workshop/Symbols');
    % 16 22
    % 17 22
    % 18 22
    % 19 22
    % 20 22
    % 21 22
    [maxId, maxIdLbl] = getValidatingEditWidgetAndLabel(hSrc, 'MaxIdLength', true, true, false, maxId_Name, maxId_ToolTip, tag, widgetId, symbolsPageName);
    % 23 37
    % 24 37
    % 25 37
    % 26 37
    % 27 37
    % 28 37
    % 29 37
    % 30 37
    % 31 37
    % 32 37
    % 33 37
    % 34 37
    % 35 37
    % 36 37
    maxIdLbl.RowSpan = [1.0 1.0];
    maxIdLbl.ColSpan = [1.0 1.0];
    maxId.RowSpan = [1.0 1.0];
    maxId.ColSpan = [2.0 2.0];
    % 41 42
    autoId.Name = 'Auto-generated identifier naming rules';
    autoId.Items = cellhorzcat(maxIdLbl, maxId);
    autoId.Type = 'group';
    autoId.LayoutGrid = [3.0 2.0];
    autoId.ColStretch = [0.0 1.0];
    % 47 53
    % 48 53
    % 49 53
    % 50 53
    % 51 53
    % 52 53
    interfaceTab.Name = 'Symbols';
    interfaceTab.Items = cellhorzcat(autoId);
    interfaceTab.LayoutGrid = [3.0 2.0];
    interfaceTab.RowStretch = [0.0 0.0 1.0];
    % 57 58
    dlg = interfaceTab;
end % function
