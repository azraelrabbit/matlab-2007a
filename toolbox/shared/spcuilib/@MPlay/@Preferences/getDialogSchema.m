function dlgstruct = getDialogSchema(this, arg)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    srcmode.Name = 'Display the full source path in the title bar';
    srcmode.Type = 'checkbox';
    srcmode.ObjectProperty = 'DisplayFullSourceName';
    srcmode.RowSpan = [1.0 1.0];
    srcmode.ColSpan = [1.0 2.0];
    srcmode.Mode = true;
    % 13 14
    pbmode.Name = 'Keyboard commands respect playback mode';
    pbmode.Type = 'checkbox';
    pbmode.ObjectProperty = 'PlaybackCmdMode';
    pbmode.RowSpan = [2.0 2.0];
    pbmode.ColSpan = [1.0 2.0];
    pbmode.Mode = true;
    % 20 21
    fwmode.Name = 'Turn on "Maintain fit to window" when opening new viewer';
    fwmode.Type = 'checkbox';
    fwmode.ObjectProperty = 'MaintainFitToWindow';
    fwmode.RowSpan = [3.0 3.0];
    fwmode.ColSpan = [1.0 2.0];
    fwmode.Mode = true;
    % 27 28
    imtool_exp.Name = 'Open new Image Tool window for each export';
    imtool_exp.Type = 'checkbox';
    imtool_exp.ObjectProperty = 'ImtoolReuse';
    imtool_exp.RowSpan = [4.0 4.0];
    imtool_exp.ColSpan = [1.0 2.0];
    imtool_exp.Mode = true;
    % 34 35
    slmodel.Name = 'Load Simulink model if not open';
    slmodel.Type = 'checkbox';
    slmodel.ObjectProperty = 'OpenSimulinkModel';
    slmodel.RowSpan = [5.0 5.0];
    slmodel.ColSpan = [1.0 2.0];
    slmodel.Mode = true;
    % 41 42
    listLen1.Name = 'Recently used sources list:';
    listLen1.Type = 'edit';
    listLen1.ObjectProperty = 'RecentSourcesListLength';
    listLen1.Tag = 'RecentSourcesListLength';
    listLen1.RowSpan = [6.0 6.0];
    listLen1.ColSpan = [1.0 1.0];
    listLen1.Mode = false;
    % 49 50
    listLen2.Name = 'entries';
    listLen2.Type = 'text';
    listLen2.RowSpan = [6.0 6.0];
    listLen2.ColSpan = [2.0 2.0];
    % 54 55
    connectFile.Name = 'Recently opened file path:';
    connectFile.Type = 'edit';
    connectFile.ObjectProperty = 'LastConnectFileOpened';
    connectFile.RowSpan = [7.0 7.0];
    connectFile.ColSpan = [1.0 2.0];
    connectFile.Mode = true;
    % 61 62
    vspace.Name = '';
    vspace.Type = 'text';
    vspace.RowSpan = [8.0 8.0];
    vspace.ColSpan = [1.0 2.0];
    % 66 67
    reset.Name = 'Reset to Factory Defaults';
    reset.Type = 'pushbutton';
    reset.RowSpan = [9.0 9.0];
    reset.ColSpan = [1.0 1.0];
    reset.ObjectMethod = 'reset';
    % 72 75
    % 73 75
    % 74 75
    pref_cont.Type = 'panel';
    pref_cont.LayoutGrid = [9.0 2.0];
    pref_cont.RowStretch = [0.0 0.0 0.0 0.0 0.0 0.0 0.0 1.0 0.0];
    pref_cont.ColStretch = [0.0 1.0];
    pref_cont.RowSpan = [1.0 1.0];
    pref_cont.ColSpan = [1.0 1.0];
    pref_cont.Items = cellhorzcat(srcmode, pbmode, fwmode, imtool_exp, slmodel, listLen1, listLen2, connectFile, vspace, reset);
    % 82 88
    % 83 88
    % 84 88
    % 85 88
    % 86 88
    % 87 88
    dlgstruct = this.StdDlgProps;
    dlgstruct.Items = cellhorzcat(pref_cont);
    dlgstruct.PreApplyMethod = 'validate';
    dlgstruct.StandaloneButtonSet = {'Help','OK'};
end % function
