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
    % 12 16
    % 13 16
    % 14 16
    % 15 16
    cm.addMenuItem(am.createAction(e, 'Text', xlate('Send to File Converter'), 'Callback', 'exploreAction(getSelectedListNodes(RptgenML.Root,1));', 'Icon', fullfile(matlabroot, 'toolbox', 'rptgen', 'resources', 'Convert.png'), 'StatusTip', xlate('')));
    % 17 22
    % 18 22
    % 19 22
    % 20 22
    % 21 22
    cm.addMenuItem(am.createAction(e, 'Text', xlate('Edit as text'), 'Callback', sprintf('edit(''%s'');', fullfile(this.PathName, this.FileName)), 'Icon', fullfile(matlabroot, 'toolbox', 'rptgen', 'resources', 'open.png'), 'StatusTip', xlate('Open this file in the MATLAB text editor')));
    % 23 26
    % 24 26
    % 25 26
end % function
