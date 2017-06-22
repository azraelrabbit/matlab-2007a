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
    % 12 15
    % 13 15
    % 14 15
    cm.addMenuItem(am.createAction(e, 'Text', xlate('&Add component to current report'), 'Icon', fullfile(matlabroot, 'toolbox/rptgen/resources/Component_unparentable.png'), 'Callback', 'acceptDrop(getCurrentComponent(RptgenML.Root),getSelectedListNodes(RptgenML.Root));', 'StatusTip', xlate('')));
    % 16 22
    % 17 22
    % 18 22
    % 19 22
    % 20 22
    % 21 22
    cm.addMenuItem(am.createAction(e, 'Text', xlate('&Help'), 'Callback', 'viewHelp(getSelectedListNodes(RptgenML.Root));', 'StatusTip', sprintf('Get help for component')));
    % 23 27
    % 24 27
    % 25 27
    % 26 27
    cm.addSeparator;
    % 28 29
    cm.addMenuItem(am.createAction(e, 'Text', xlate('Send to &Workspace'), 'Callback', 'ans = makeComponent(getSelectedListNodes(RptgenML.Root,true))', 'StatusTip', xlate('Send component to workspace')));
    % 30 32
    % 31 32
end % function
