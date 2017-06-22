function cm = getContextMenu(this, selectedHandles)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    e = this.getEditor;
    % 8 9
    am = DAStudio.ActionManager;
    cm = am.createPopupMenu(e);
    % 11 12
    cm.addMenuItem(this.actions.New);
    cm.addMenuItem(this.actions.Open);
    % 14 15
    cm.addSeparator;
    % 16 17
    cm.addMenuItem(this.actions.ConvertFile);
    cm.addMenuItem(this.actions.CreateComponent);
    cm.addMenuItem(this.actions.EditStylesheet);
end % function
