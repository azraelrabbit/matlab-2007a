function cm = getContextMenu(this, selectedHandles)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    r = RptgenML.Root;
    e = r.getEditor;
    % 9 10
    am = DAStudio.ActionManager;
    cm = am.createPopupMenu(e);
    % 12 19
    % 13 19
    % 14 19
    % 15 19
    % 16 19
    % 17 19
    % 18 19
    cm.addMenuItem(am.createAction(e, 'Text', xlate('Open report'), 'Callback', 'cbkOpen(subsref(getSelectedListNodes(DAStudio.imExplorer(getEditor(RptgenML.Root))),substruct(''()'',{1})));', 'Icon', fullfile(matlabroot, 'toolbox', 'rptgen', 'resources', 'open.png'), 'StatusTip', xlate('')));
    % 20 25
    % 21 25
    % 22 25
    % 23 25
    % 24 25
    cm.addMenuItem(am.createAction(e, 'Text', xlate('Generate report'), 'Callback', 'cbkReport(subsref(getSelectedListNodes(DAStudio.imExplorer(getEditor(RptgenML.Root))),substruct(''()'',{1})));', 'Icon', fullfile(matlabroot, 'toolbox', 'rptgen', 'resources', 'Report.png'), 'StatusTip', xlate('')));
    % 26 31
    % 27 31
    % 28 31
    % 29 31
    % 30 31
    currSys = '';
    if rptgen.isSimulinkLoaded
        % 33 35
        % 34 35
        try
            currSys = gcs;
        end % try
    end % if
    % 39 40
    if not(isempty(currSys))
        cm.addSeparator();
        % 42 43
        cm.addMenuItem(am.createAction(e, 'Text', xlate('Associate report with current Simulink system'), 'Callback', 'cbkSimulink(subsref(getSelectedListNodes(DAStudio.imExplorer(getEditor(RptgenML.Root))),substruct(''()'',{1})));', 'Icon', fullfile(matlabroot, 'toolbox', 'rptgen', 'resources', 'simulink_associate.png'), 'StatusTip', xlate('')));
        % 44 49
        % 45 49
        % 46 49
        % 47 49
        % 48 49
        cm.addMenuItem(r.actions.UnAssociateSimulink);
    end % if
end % function
