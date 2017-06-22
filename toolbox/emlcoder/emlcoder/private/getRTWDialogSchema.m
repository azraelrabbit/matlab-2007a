function dlg = getRTWDialogSchema(hSrc, schemaName)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    dlg = [];
    % 6 8
    makeComm_Name = 'Make command:';
    makeComm.ToolTip = 'Make command with optional arguments.';
    % 9 11
    GenMakefile.Name = 'Generate makefile';
    GenMakefile.ToolTip = 'Enables generation of makefile for compiling generated code.';
    % 12 14
    tempMake_Name = 'Template makefile:';
    tempMake.ToolTip = 'Current template makefile for building Real-Time Workshop target.';
    % 15 17
    genCode.Name = 'Generate code only';
    genCode.ToolTip = 'Do not execute makefile when generating code.';
    % 18 20
    verbose.Name = 'Verbose build';
    verbose.ToolTip = 'Show code generation stages and compiler output.';
    % 21 23
    buildPro.Name = 'Build process';
    MakefileConfig.Name = 'Makefile configuration';
    doc.Name = 'Documentation';
    rtwDebug.Name = 'Build process';
    % 26 32
    % 27 32
    % 28 32
    % 29 32
    % 30 32
    tag = 'Tag_ConfigSet_RTW_';
    widgetId = 'Simulink.RTWCC.';
    % 33 40
    % 34 40
    % 35 40
    % 36 40
    % 37 40
    % 38 40
    ObjectProperty = 'GenerateMakefile';
    GenMakefile.Type = 'checkbox';
    GenMakefile.ObjectProperty = ObjectProperty;
    GenMakefile.Enabled = not(hSrc.isReadonlyProperty('GenerateMakefile'));
    GenMakefile.Tag = horzcat(tag, ObjectProperty);
    GenMakefile.WidgetId = horzcat(widgetId, ObjectProperty);
    GenMakefile.Mode = 1.0;
    GenMakefile.DialogRefresh = 1.0;
    % 47 50
    % 48 50
    ObjectProperty = 'MakeCommand';
    isVisible = hSrc.GenerateMakefile;
    isEnabled = isVisible && not(hSrc.isReadonlyProperty(ObjectProperty));
    makeCommLbl.Name = makeComm_Name;
    makeCommLbl.Visible = true;
    makeCommLbl.Type = 'text';
    makeCommLbl.Tag = horzcat(tag, ObjectProperty, 'Lbl');
    makeCommLbl.WidgetId = horzcat(widgetId, ObjectProperty);
    % 57 59
    makeComm.Type = 'edit';
    makeComm.ObjectProperty = ObjectProperty;
    makeComm.Enabled = isEnabled;
    makeComm.Visible = isVisible;
    makeComm.Tag = horzcat(tag, ObjectProperty);
    makeComm.WidgetId = horzcat(widgetId, ObjectProperty);
    makeComm.UserData.Name = makeCommLbl.Name;
    makeComm.Mode = 1.0;
    % 66 71
    % 67 71
    % 68 71
    % 69 71
    makeCommNA.Type = 'edit';
    makeCommNA.Enabled = false;
    makeCommNA.Visible = not(makeComm.Visible);
    makeCommNA.Mode = 1.0;
    % 74 77
    % 75 77
    ObjectProperty = 'TemplateMakefile';
    tempMakeLbl.Name = tempMake_Name;
    tempMakeLbl.Type = 'text';
    tempMakeLbl.Visible = true;
    tempMakeLbl.Tag = horzcat(tag, ObjectProperty, 'Lbl');
    tempMakeLbl.WidgetId = horzcat(widgetId, ObjectProperty);
    % 82 84
    isVisible = hSrc.GenerateMakefile;
    isEnabled = isVisible && not(hSrc.isReadonlyProperty(ObjectProperty));
    tempMake.Type = 'edit';
    tempMake.ObjectProperty = ObjectProperty;
    tempMake.Enabled = isEnabled;
    tempMake.Visible = isVisible;
    tempMake.UserData.Name = tempMakeLbl.Name;
    tempMake.Tag = horzcat(tag, tempMake.ObjectProperty);
    tempMake.WidgetId = horzcat(widgetId, tempMake.ObjectProperty);
    tempMake.Mode = 1.0;
    % 93 98
    % 94 98
    % 95 98
    % 96 98
    tempMakeNA.Type = 'edit';
    tempMakeNA.Enabled = false;
    tempMakeNA.Visible = not(tempMake.Visible);
    tempMakeNA.Mode = 1.0;
    % 101 104
    % 102 104
    genCode.Type = 'checkbox';
    genCode.ObjectProperty = 'GenCodeOnly';
    genCode.Mode = 1.0;
    genCode.DialogRefresh = 1.0;
    genCode.Enabled = not(hSrc.isReadonlyProperty('GenCodeOnly'));
    genCode.Tag = horzcat(tag, genCode.ObjectProperty);
    genCode.WidgetId = horzcat(widgetId, genCode.ObjectProperty);
    % 110 113
    % 111 113
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
    % 123 126
    % 124 126
    ObjectProperty = 'LaunchReport';
    launchReport.Name = 'Launch report automatically';
    launchReport_ToolTip = 'Automatically open HTML report after code generation completes.';
    % 128 130
    launchReport.Type = 'checkbox';
    launchReport.ObjectProperty = ObjectProperty;
    launchReport.Enabled = not(hSrc.isReadonlyProperty(ObjectProperty)) && hSrc.GenerateReport;
    % 132 134
    launchReport.Tag = horzcat(tag, ObjectProperty);
    launchReport.WidgetId = horzcat(widgetId, ObjectProperty);
    launchReport.ToolTip = launchReport_ToolTip;
    launchReport.Mode = 1.0;
    % 137 140
    % 138 140
    verbose.Type = 'checkbox';
    verbose.ObjectProperty = 'RTWVerbose';
    verbose.Enabled = not(hSrc.isReadonlyProperty('RTWVerbose'));
    verbose.Tag = horzcat(tag, verbose.ObjectProperty);
    verbose.WidgetId = horzcat(widgetId, verbose.ObjectProperty);
    verbose.Mode = 1.0;
    % 145 152
    % 146 152
    % 147 152
    % 148 152
    % 149 152
    % 150 152
    GenMakefile.RowSpan = [1.0 1.0];
    GenMakefile.ColSpan = [1.0 2.0];
    % 153 155
    makeCommLbl.RowSpan = [2.0 2.0];
    makeCommLbl.ColSpan = [1.0 2.0];
    % 156 158
    makeComm.RowSpan = [2.0 2.0];
    makeComm.ColSpan = [3.0 4.0];
    % 159 163
    % 160 163
    % 161 163
    makeCommNA.RowSpan = makeComm.RowSpan;
    makeCommNA.ColSpan = makeComm.ColSpan;
    % 164 166
    tempMakeLbl.RowSpan = [3.0 3.0];
    tempMakeLbl.ColSpan = [1.0 2.0];
    tempMakeLbl.WidgetId = 'Simulink.RTWCC.TemplateMakeFile';
    % 168 170
    tempMake.RowSpan = [3.0 3.0];
    tempMake.ColSpan = [3.0 4.0];
    tempMake.WidgetId = 'Simulink.RTWCC.TemplateMakeFile';
    % 172 176
    % 173 176
    % 174 176
    tempMakeNA.RowSpan = tempMake.RowSpan;
    tempMakeNA.ColSpan = tempMake.ColSpan;
    % 177 179
    MakefileConfig.Type = 'group';
    MakefileConfig.RowSpan = [2.0 3.0];
    MakefileConfig.ColSpan = [1.0 3.0];
    % 181 183
    MakefileConfig.LayoutGrid = [3.0 4.0];
    MakefileConfig.ColStretch = [0.0 0.0 1.0 1.0];
    % 184 186
    MakefileConfig.Items = cellhorzcat(GenMakefile, makeCommLbl, makeComm, makeCommNA, tempMakeLbl, tempMake, tempMakeNA);
    % 186 190
    % 187 190
    % 188 190
    buildPro.Type = 'group';
    buildPro.LayoutGrid = [3.0 3.0];
    buildPro.Items = cellhorzcat(MakefileConfig);
    buildPro.ColStretch = [0.0 0.0 1.0];
    buildPro.WidgetId = 'Simulink.RTWCC.BuildProcessGroup';
    % 194 198
    % 195 198
    % 196 198
    doc.Type = 'group';
    doc.LayoutGrid = [3.0 1.0];
    doc.ColStretch = 1.0;
    % 200 202
    report.RowSpan = [1.0 1.0];
    report.ColSpan = [1.0 1.0];
    report.WidgetId = 'Simulink.RTWCC.GenerateHTMLReport';
    % 204 206
    launchReport.RowSpan = [2.0 2.0];
    launchReport.ColSpan = [1.0 1.0];
    % 207 209
    doc.Items = cellhorzcat(report, launchReport);
    doc.WidgetId = 'Simulink.RTWCC.DocumentationGroup';
    % 210 213
    % 211 213
    rtwDebug.Type = 'group';
    rtwDebug.Items = cellhorzcat(verbose);
    % 214 217
    % 215 217
    genCode.RowSpan = [1.0 1.0];
    genCode.ColSpan = [1.0 3.0];
    bottom.Name = 'Build Group';
    bottom.Type = 'panel';
    bottom.Items = cellhorzcat(genCode);
    bottom.LayoutGrid = [2.0 4.0];
    bottom.ColStretch = [1.0 1.0 1.0 0.0];
    % 223 230
    % 224 230
    % 225 230
    % 226 230
    % 227 230
    % 228 230
    doc.RowSpan = [3.0 3.0];
    buildPro.RowSpan = [4.0 4.0];
    % 231 233
    generalTab.Name = 'General';
    generalTab.LayoutGrid = [6.0 1.0];
    generalTab.RowStretch = [0.0 0.0 0.0 0.0 0.0 1.0];
    generalTab.Source = hSrc;
    generalTab.Items = cellhorzcat(doc, buildPro);
    % 237 240
    % 238 240
    rtwDebug.RowSpan = [1.0 1.0];
    debugTab.Name = 'Debug';
    debugTab.LayoutGrid = [3.0 1.0];
    debugTab.RowStretch = [0.0 0.0 1.0];
    debugTab.Source = hSrc;
    debugTab.Items = cellhorzcat(rtwDebug);
    % 245 248
    % 246 248
    customCodeTab = getRTWCustomCodeDialogSchema(hSrc);
    customCodeTab.Source = hSrc;
    % 249 252
    % 250 252
    symbolsTab = getRTWSymbolsDialogSchema(hSrc);
    symbolsTab.Source = hSrc;
    % 253 256
    % 254 256
    interfaceTab = getRTWInterfaceDialogSchema(hSrc);
    interfaceTab.Source = hSrc;
    % 257 260
    % 258 260
    items{1.0} = generalTab;
    items{2.0} = symbolsTab;
    items{3.0} = customCodeTab;
    items{4.0} = debugTab;
    items{5.0} = interfaceTab;
    % 264 267
    % 265 267
    tabs.Name = 'Tabs';
    tabs.Type = 'tab';
    tabs.Tag = horzcat(tag, 'tabs');
    tabs.WidgetId = horzcat(widgetId, 'tabs');
    tabs.Tabs = items;
    tabs.ActiveTab = get(hSrc, 'ActiveTab');
    % 272 276
    % 273 276
    % 274 276
    panel.Name = '';
    panel.Type = 'panel';
    panel.Items = cellhorzcat(tabs, bottom);
    % 278 280
    pageName = 'Real-Time Workshop';
    dlg.DialogTitle = pageName;
    dlg.Items = cellhorzcat(panel);
    dlg.LayoutGrid = [2.0 1.0];
    dlg.RowStretch = [0.0 1.0];
    % 284 286
    dlg.HelpMethod = horzcat('web ', matlabroot, '/toolbox/emlcoder/emlcoder/private/betahelp.html');
end
