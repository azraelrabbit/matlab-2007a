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
    % 12 14
    % 13 14
    cm.addMenuItem(r.actions.Save)
    cm.addMenuItem(r.actions.SaveAs)
    cm.addMenuItem(r.actions.Close)
    cm.addMenuItem(r.actions.Script)
    % 18 19
    cm.addSeparator;
    % 20 21
    cm.addMenuItem(r.actions.Report)
    cm.addMenuItem(r.actions.Log)
    % 23 24
    cm.addSeparator;
    % 25 26
    cm.addMenuItem(r.actions.AssociateSimulink)
    cm.addMenuItem(r.actions.UnAssociateSimulink)
    % 28 29
    cm.addMenuItem(am.createAction(e, 'Text', xlate('Edit stylesheet'), 'Callback', 'addStylesheetEditor(RptgenML.Root,getCurrentTreeNode(RptgenML.Root));', 'Icon', fullfile(matlabroot, 'toolbox', 'rptgen', 'resources', 'Stylesheet.png'), 'Visible', r.Actions.EditStylesheet.Visible, 'StatusTip', xlate('Edit currently assigned stylesheet')));
    % 30 36
    % 31 36
    % 32 36
    % 33 36
    % 34 36
    % 35 36
    cm.addSeparator;
    % 37 38
    cm.addMenuItem(r.actions.MoveUp)
    cm.addMenuItem(r.actions.MoveDown)
    % 40 41
    cm.addSeparator;
    % 42 43
    cm.addMenuItem(am.createDefaultAction(e, 'CONTEXT_TREE_TO_WS'));
end % function
