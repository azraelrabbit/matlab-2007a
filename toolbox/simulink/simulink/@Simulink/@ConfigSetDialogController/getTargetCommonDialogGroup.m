function dlg = getTargetCommonDialogGroup(h, schemaName)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    hSrc = h.getSourceObject;
    tag = 'Tag_ConfigSet_RTW_General_';
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    stf.Name = 'RTW system target file:';
    stf.Type = 'edit';
    stf.ObjectProperty = 'SystemTargetFile';
    stf.Enabled = double(~(hSrc.isReadonlyProperty('SystemTargetFile')));
    stf.Tag = horzcat(tag, stf.ObjectProperty);
    stf.ToolTip = sprintf('Current system target file. To select a different target\nplease use the Browse button to the right.');
    % 20 23
    % 21 23
    stf.Mode = 1.0;
    % 23 26
    % 24 26
    browseSTF.Name = 'Browse ...';
    browseSTF.Type = 'pushbutton';
    browseSTF.Tag = horzcat(tag, 'Browse');
    browseSTF.Source = h;
    browseSTF.ObjectMethod = 'dialogCallback';
    browseSTF.MethodArgs = cellhorzcat('%dialog', browseSTF.Tag, '');
    browseSTF.ArgDataTypes = {'handle','string','string'};
    browseSTF.Enabled = double(~(hSrc.isObjectLocked));
    browseSTF.ToolTip = 'Launch system target file browser.';
    % 34 37
    % 35 37
    widget.ObjectProperty = 'Description';
    widget.Name = horzcat('Description: ', get(hSrc, widget.ObjectProperty));
    widget.Type = 'text';
    widget.Tag = horzcat(tag, widget.ObjectProperty);
    description = widget;
    widget = [];
    % 42 45
    % 43 45
    widget.Name = 'TLC options:';
    widget.Type = 'edit';
    widget.ObjectProperty = 'TLCOptions';
    widget.Tag = horzcat(tag, widget.ObjectProperty);
    widget.Enabled = double(~(hSrc.isReadonlyProperty(widget.ObjectProperty)));
    widget.ToolTip = 'no tool tip';
    widget.Mode = 1.0;
    tlcOptions = widget;
    widget = [];
    % 53 56
    % 54 56
    makeComm.Name = 'Make command:';
    makeComm.Type = 'edit';
    makeComm.ObjectProperty = 'MakeCommand';
    makeComm.Enabled = double(~(hSrc.isReadonlyProperty('MakeCommand')));
    makeComm.Tag = horzcat(tag, makeComm.ObjectProperty);
    makeComm.ToolTip = 'Make command and optional arguments.';
    makeComm.Mode = 1.0;
    % 62 65
    % 63 65
    tempMake.Name = 'Template makefile:';
    tempMake.Type = 'edit';
    tempMake.ObjectProperty = 'TemplateMakefile';
    tempMake.Enabled = double(~(hSrc.isReadonlyProperty('TemplateMakefile')));
    tempMake.Tag = horzcat(tag, tempMake.ObjectProperty);
    tempMake.ToolTip = 'Current template makefile for building RTW target.';
    tempMake.Mode = 1.0;
    % 71 74
    % 72 74
    codeGenDir.Name = 'Code generation directory:';
    codeGenDir.Type = 'edit';
    codeGenDir.ObjectProperty = 'CodeGenDirectory';
    codeGenDir.Enabled = double(~(hSrc.isReadonlyProperty('CodeGenDirectory')));
    codeGenDir.Tag = horzcat(tag, codeGenDir.ObjectProperty);
    codeGenDir.ToolTip = 'Path to build directory (default is model directory).';
    codeGenDir.Mode = 1.0;
    % 80 83
    % 81 83
    genCode.Name = 'Generate code only';
    genCode.Type = 'checkbox';
    genCode.ObjectProperty = 'GenCodeOnly';
    genCode.Mode = 1.0;
    genCode.DialogRefresh = 1.0;
    genCode.Enabled = double(~(hSrc.isReadonlyProperty('GenCodeOnly')));
    genCode.Tag = horzcat(tag, genCode.ObjectProperty);
    genCode.ToolTip = 'When building, generate code but do not create executable.';
    % 90 93
    % 91 93
    if strcmp(hSrc.GenCodeOnly, 'on')
        build.Name = 'Generate code';
    else
        build.Name = 'Build';
    end
    build.Type = 'pushbutton';
    build.MatlabMethod = 'simprm';
    % 99 101
    if ((isempty(hSrc.getConfigSet)) | (isempty(hSrc.getConfigSet.up))) | (~(isa(hSrc.getConfigSet.up, 'Simulink.BlockDiagram')))
        model = [];
        build.Enabled = 0.0;
    else
        model = hSrc.getConfigSet.up.name;
        if strcmp(get_param(model, 'SimulationStatus'), 'stopped')
            build.Enabled = 1.0;
        else
            build.Enabled = 0.0;
        end
    end
    if isObjectLocked(hSrc)
        build.Enabled = 0.0;
    end
    build.MatlabArgs = cellhorzcat('RTWPage', 'Build', model);
    build.DialogRefresh = 1.0;
    build.Tag = horzcat(tag, 'Build');
    build.ToolTip = 'Generate Real-Time Workshop code for current target.';
    % 118 121
    % 119 121
    report.Name = 'Generate HTML report';
    report.Type = 'checkbox';
    report.ObjectProperty = 'GenerateReport';
    report.Enabled = double(~(hSrc.isReadonlyProperty('GenerateReport')));
    report.ToolTip = sprintf('Create a report in the Help Browser for the generated C code.\nThe report summarizes the generated code and describes how to\ncompile and interface the code with hand-written (legacy) code.\nIt also includes hyperlinks to model blocks and documentation.');
    % 125 130
    % 126 130
    % 127 130
    % 128 130
    report.Tag = horzcat(tag, report.ObjectProperty);
    % 130 133
    % 131 133
    widget.Name = 'Save build log';
    widget.Type = 'checkbox';
    widget.ObjectProperty = 'SaveLog';
    widget.Mode = 1.0;
    savelog = widget;
    widget = [];
    % 138 143
    % 139 143
    % 140 143
    % 141 143
    stf.RowSpan = [1.0 1.0];
    stf.ColSpan = [1.0 4.0];
    browseSTF.RowSpan = [1.0 1.0];
    browseSTF.ColSpan = [5.0 5.0];
    description.RowSpan = [2.0 2.0];
    description.ColSpan = [1.0 5.0];
    % 148 151
    % 149 151
    targetSel.Name = 'Target selection';
    targetSel.Type = 'group';
    targetSel.Items = cellhorzcat(stf, browseSTF, description);
    targetSel.LayoutGrid = [2.0 5.0];
    % 154 157
    % 155 157
    tlcOptions.RowSpan = [1.0 1.0];
    tlcOptions.ColSpan = [1.0 5.0];
    makeComm.RowSpan = [2.0 2.0];
    makeComm.ColSpan = [1.0 5.0];
    tempMake.RowSpan = [3.0 3.0];
    tempMake.ColSpan = [1.0 5.0];
    genCode.RowSpan = [4.0 4.0];
    genCode.ColSpan = [1.0 4.0];
    build.RowSpan = [4.0 4.0];
    build.ColSpan = [5.0 5.0];
    buildPro.Name = 'Build process';
    buildPro.Type = 'group';
    buildPro.LayoutGrid = [4.0 5.0];
    buildPro.Items = cellhorzcat(tlcOptions, makeComm, tempMake, genCode, build);
    % 170 173
    % 171 173
    doc.Name = 'Documentation';
    doc.Type = 'group';
    doc.Items = cellhorzcat(report, savelog);
    % 175 179
    % 176 179
    % 177 179
    dlg.Name = 'General';
    dlg.Items = cellhorzcat(targetSel, doc, buildPro);
end
