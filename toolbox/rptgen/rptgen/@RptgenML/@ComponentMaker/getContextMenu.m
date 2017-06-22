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
    cm.addMenuItem(am.createAction(e, 'Text', xlate('Add new property'), 'Icon', fullfile(matlabroot, 'toolbox', 'rptgen', 'resources', 'ComponentMakerData.png'), 'Callback', 'addProperty(getCurrentTreeNode(RptgenML.Root),''PropertyName'',''NewProperty'',''DataTypeString'',''String'',''FactoryValueString'',''''''default value'''''');', 'StatusTip', xlate('Add a new property with datatype "String"')));
    % 20 28
    % 21 28
    % 22 28
    % 23 28
    % 24 28
    % 25 28
    % 26 28
    % 27 28
    cm.addSeparator;
    % 29 30
    cm.addMenuItem(am.createAction(e, 'Text', xlate('Build component'), 'Callback', 'build(getCurrentTreeNode(RptgenML.Root));', 'StatusTip', xlate('Create all framework code files')));
    % 31 35
    % 32 35
    % 33 35
    % 34 35
    cm.addMenuItem(am.createAction(e, 'Text', xlate('Edit files'), 'Enabled', locOnOff(viewAllFiles(this, -1.0)), 'Callback', 'viewAllFiles(getCurrentTreeNode(RptgenML.Root));', 'StatusTip', xlate('Edit all framework code files')));
    % 36 41
    % 37 41
    % 38 41
    % 39 41
    % 40 41
    cm.addMenuItem(r.actions.Close);
    % 42 43
    cm.addSeparator;
    % 44 45
    cm.addMenuItem(am.createDefaultAction(e, 'CONTEXT_TREE_TO_WS'));
end % function
function strVal = locOnOff(logVal)
    % 48 50
    % 49 50
    if logVal
        strVal = 'on';
    else
        strVal = 'off';
    end % if
end % function
