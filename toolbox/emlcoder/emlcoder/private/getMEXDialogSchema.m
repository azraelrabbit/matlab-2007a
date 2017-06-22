function dlg = getMEXDialogSchema(hSrc, schemaName)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    tag = 'Tag_ConfigSet_RTW_';
    widgetId = 'Simulink.RTWCC.';
    % 11 18
    % 12 18
    % 13 18
    % 14 18
    % 15 18
    % 16 18
    ObjectProperty = 'GenerateReport';
    report.Name = 'Generate HTML report';
    report.ToolTip = 'Document the generated C code in an HTML report.';
    report.Type = 'checkbox';
    report.Enabled = not(hSrc.isReadonlyProperty(ObjectProperty));
    report.ObjectProperty = ObjectProperty;
    report.Tag = horzcat(tag, ObjectProperty);
    report.WidgetId = horzcat(widgetId, ObjectProperty);
    report.Mode = 1.0;
    report.DialogRefresh = 1.0;
    report.UserData.ObjectProperty = ObjectProperty;
    % 28 31
    % 29 31
    ObjectProperty = 'LaunchReport';
    launchReport.Name = 'Launch report automatically';
    launchReport_ToolTip = 'Automatically open HTML report after code generation completes.';
    % 33 35
    launchReport.Type = 'checkbox';
    launchReport.ObjectProperty = ObjectProperty;
    launchReport.Enabled = not(hSrc.isReadonlyProperty(ObjectProperty)) && hSrc.GenerateReport;
    % 37 39
    launchReport.Tag = horzcat(tag, ObjectProperty);
    launchReport.WidgetId = horzcat(widgetId, ObjectProperty);
    launchReport.ToolTip = launchReport_ToolTip;
    launchReport.Mode = 1.0;
    % 42 49
    % 43 49
    % 44 49
    % 45 49
    % 46 49
    % 47 49
    doc.Type = 'group';
    doc.LayoutGrid = [3.0 1.0];
    doc.ColStretch = 1.0;
    % 51 53
    report.RowSpan = [1.0 1.0];
    report.ColSpan = [1.0 1.0];
    % 54 56
    launchReport.RowSpan = [2.0 2.0];
    launchReport.ColSpan = [1.0 1.0];
    % 57 59
    doc.Items = cellhorzcat(report, launchReport);
    % 59 67
    % 60 67
    % 61 67
    % 62 67
    % 63 67
    % 64 67
    % 65 67
    generalTab.Name = 'General';
    generalTab.LayoutGrid = [6.0 1.0];
    generalTab.RowStretch = [0.0 0.0 0.0 0.0 0.0 1.0];
    generalTab.Source = hSrc;
    generalTab.Items = cellhorzcat(doc);
    % 71 73
    customCodeTab = getRTWCustomCodeDialogSchema(hSrc);
    customCodeTab.Source = hSrc;
    % 74 77
    % 75 77
    items{1.0} = generalTab;
    items{2.0} = customCodeTab;
    % 78 81
    % 79 81
    tabs.Name = 'Tabs';
    tabs.Type = 'tab';
    tabs.Tag = horzcat(tag, 'tabs');
    tabs.WidgetId = horzcat(widgetId, 'tabs');
    tabs.Tabs = items;
    tabs.ActiveTab = get(hSrc, 'ActiveTab');
    % 86 90
    % 87 90
    % 88 90
    panel.Name = '';
    panel.Type = 'panel';
    panel.Items = cellhorzcat(tabs);
    % 92 94
    pageName = 'Automatic C-MEX Generation';
    dlg.DialogTitle = pageName;
    dlg.Items = cellhorzcat(panel);
    dlg.LayoutGrid = [2.0 1.0];
    dlg.RowStretch = [0.0 1.0];
    % 98 106
    % 99 106
    % 100 106
    % 101 106
    % 102 106
    % 103 106
    % 104 106
end
