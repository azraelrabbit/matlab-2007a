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
    cm.addMenuItem(am.createAction(e, 'Text', xlate('Select XML source file'), 'Callback', 'cbkSelectFile(getCurrentTreeNode(RptgenML.Root));', 'Icon', fullfile(matlabroot, 'toolbox', 'rptgen', 'resources', 'open.png'), 'StatusTip', xlate('')));
    % 20 25
    % 21 25
    % 22 25
    % 23 25
    % 24 25
    if exist(this.SrcFileName, 'file')
        convertEnable = 'on';
    else
        convertEnable = 'off';
    end % if
    % 30 31
    cm.addMenuItem(am.createAction(e, 'Text', xlate('Convert report'), 'Callback', 'cbkConvert(getCurrentTreeNode(RptgenML.Root));', 'Icon', fullfile(matlabroot, 'toolbox', 'rptgen', 'resources', 'Convert.png'), 'Enable', convertEnable, 'StatusTip', xlate('')));
    % 32 38
    % 33 38
    % 34 38
    % 35 38
    % 36 38
    % 37 38
    cm.addMenuItem(am.createAction(e, 'Text', xlate('Edit stylesheet'), 'Callback', 'addStylesheetEditor(RptgenML.Root,getCurrentTreeNode(RptgenML.Root));', 'Icon', fullfile(matlabroot, 'toolbox', 'rptgen', 'resources', 'Stylesheet.png'), 'Visible', r.Actions.EditStylesheet.Visible, 'StatusTip', xlate('Edit currently assigned stylesheet')));
    % 39 45
    % 40 45
    % 41 45
    % 42 45
    % 43 45
    % 44 45
    cm.addMenuItem(r.actions.Close)
    % 46 47
    cm.addSeparator;
    % 48 49
    cm.addMenuItem(am.createDefaultAction(e, 'CONTEXT_TREE_TO_WS'));
end % function
