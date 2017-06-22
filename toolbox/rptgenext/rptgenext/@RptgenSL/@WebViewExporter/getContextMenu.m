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
    % 12 13
    cm.addMenuItem(r.actions.Cut);
    cm.addMenuItem(r.actions.Copy);
    cm.addMenuItem(r.actions.Paste);
    cm.addMenuItem(r.actions.Delete);
    % 17 19
    % 18 19
    cm.addSeparator;
    % 20 21
    cm.addMenuItem(r.actions.MoveUp);
    cm.addMenuItem(r.actions.MoveDown);
    % 23 24
    cm.addSeparator;
    % 25 26
    cm.addMenuItem(am.createDefaultAction(e, 'CONTEXT_TREE_TO_WS'));
end % function
