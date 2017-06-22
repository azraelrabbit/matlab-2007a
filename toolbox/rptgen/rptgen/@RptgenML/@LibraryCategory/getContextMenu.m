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
    % 12 18
    % 13 18
    % 14 18
    % 15 18
    % 16 18
    % 17 18
    cm.addMenuItem(am.createAction(e, 'Text', xlate('Hide/show category'), 'Callback', 'exploreAction(subsref(getSelectedListNodes(DAStudio.imExplorer(getEditor(RptgenML.Root))),substruct(''()'',{1})));', 'StatusTip', xlate('')));
    % 19 21
    % 20 21
end % function
