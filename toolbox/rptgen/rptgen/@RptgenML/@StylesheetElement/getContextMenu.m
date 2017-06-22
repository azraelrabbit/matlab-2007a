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
    if isLibrary(this)
        % 14 19
        % 15 19
        % 16 19
        % 17 19
        % 18 19
        cm.addMenuItem(am.createAction(e, 'Text', xlate('Add data'), 'Callback', 'exploreAction(getSelectedListNodes(RptgenML.Root));', 'StatusTip', xlate('')));
    else
        % 21 23
        % 22 23
        % 23 25
        % 24 25
        cm.addMenuItem(r.actions.Cut);
        cm.addMenuItem(r.actions.Copy);
        cm.addMenuItem(r.actions.Paste);
        cm.addMenuItem(r.actions.Delete);
        % 29 30
        cm.addSeparator;
        % 31 32
        cm.addMenuItem(r.actions.MoveUp);
        cm.addMenuItem(r.actions.MoveDown);
        % 34 35
        cm.addSeparator;
        % 36 37
        cm.addMenuItem(am.createDefaultAction(e, 'CONTEXT_TREE_TO_WS'));
        % 38 39
    end % if
end % function
