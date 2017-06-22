function cm = getContextMenu(this, selectedHandles)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    r = RptgenML.Root;
    % 8 9
    am = DAStudio.ActionManager;
    cm = am.createPopupMenu(r.Editor);
    % 11 12
    cm.addMenuItem(r.actions.Save)
    cm.addMenuItem(r.actions.Close)
    % 14 15
    cm.addSeparator;
    % 16 17
    cm.addMenuItem(r.actions.MoveUp);
    cm.addMenuItem(r.actions.MoveDown);
end % function
