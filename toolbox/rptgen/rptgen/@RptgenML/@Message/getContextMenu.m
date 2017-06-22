function cm = getContextMenu(this, selectedHandles)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    am = DAStudio.ActionManager;
    cm = am.createPopupMenu(getEditor(RptgenML.Root));
end % function
