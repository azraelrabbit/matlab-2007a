function dlg = getDialogSchema(this, dummy)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    helpframe = getHelpFrame;
    helpframe.RowSpan = [1.0 1.0];
    helpframe.ColSpan = [1.0 1.0];
    % 11 14
    % 12 14
    editframe = getEditFrame(this);
    fixpt = getFixedPointTab(this);
    % 15 17
    tab.Type = 'tab';
    tab.Tabs = cellhorzcat(editframe, fixpt);
    tab.RowSpan = [2.0 2.0];
    tab.ColSpan = [1.0 1.0];
    tab.Tag = 'TabPanel';
    tab.ActiveTab = this.ActiveTab;
    tab.TabChangedCallback = 'FilterDesignDialog.TabChangedCallback';
    % 23 25
    dlg.DialogTitle = 'Coefficient Editor';
    dlg.Items = cellhorzcat(helpframe, tab);
    % 26 28
    dlg.PreApplyMethod = 'preApply';
    dlg.PreApplyArgs = {'%dialog'};
    dlg.PreApplyArgsDT = {'handle','handle'};
end % function
function editFrame = getEditFrame(this)
    % 32 35
    % 33 35
    Hd = get(this, 'FilterObject');
    % 35 39
    % 36 39
    % 37 39
    names = coefficientnames(Hd);
    % 39 41
    editFrame.Items = {};
    editFrame.LayoutGrid = horzcat(plus(length(names), 3.0), 2.0);
    % 42 44
    for indx=1.0:length(names)
        % 44 46
        propname = sprintf('CoefficientVector%d', indx);
        % 46 50
        % 47 50
        % 48 50
        editlabel.Type = 'text';
        editlabel.Name = sprintf('%s: ', interspace(names{indx}));
        editlabel.RowSpan = horzcat(indx, indx);
        editlabel.ColSpan = [1.0 1.0];
        editlabel.Tag = horzcat(propname, '_label');
        % 54 57
        % 55 57
        editbox.Type = 'edit';
        editbox.ObjectProperty = propname;
        editbox.RowSpan = horzcat(indx, indx);
        editbox.ColSpan = [2.0 2.0];
        editbox.Tag = propname;
        editbox.Source = this;
        editbox.Mode = true;
        % 63 65
        editFrame.Items = cellhorzcat(editFrame.Items{:}, editlabel, editbox);
    end % for
    % 66 68
    pMemory.Type = 'checkbox';
    pMemory.Name = 'Persistent memory';
    pMemory.RowSpan = horzcat(plus(length(names), 1.0), plus(length(names), 1.0));
    pMemory.ColSpan = [1.0 2.0];
    pMemory.ObjectProperty = 'PersistentMemory';
    pMemory.Tag = 'PersistentMemory';
    pMemory.Mode = true;
    pMemory.DialogRefresh = true;
    % 75 77
    stateslabel.Type = 'text';
    stateslabel.Name = 'States: ';
    stateslabel.RowSpan = horzcat(plus(length(names), 2.0), plus(length(names), 2.0));
    stateslabel.ColSpan = [1.0 1.0];
    % 80 82
    statesedit.Type = 'edit';
    statesedit.RowSpan = horzcat(plus(length(names), 2.0), plus(length(names), 2.0));
    statesedit.ColSpan = [2.0 2.0];
    statesedit.ObjectProperty = 'States';
    statesedit.Tag = 'States';
    statesedit.Mode = true;
    % 87 89
    stateslabel.Enabled = strcmpi(this.PersistentMemory, 'on');
    statesedit.Enabled = strcmpi(this.PersistentMemory, 'on');
    % 90 92
    editFrame.Items = cellhorzcat(editFrame.Items{:}, pMemory, stateslabel, statesedit);
    editFrame.Name = 'Coefficients';
    editFrame.RowStretch = horzcat(zeros(1.0, plus(length(names), 2.0)), 1.0);
end % function
function fixpt = getFixedPointTab(this)
    % 96 99
    % 97 99
    h = get(this, 'FixedPoint');
    % 99 101
    items = cellhorzcat(getDialogSchemaStruct(h));
    % 101 103
    fixpt.Name = 'Fixed-point';
    fixpt.Items = items;
    fixpt.Tag = 'FixedPointTab';
end % function
function helpFrame = getHelpFrame
    % 107 111
    % 108 111
    % 109 111
    helptext.Type = 'text';
    helptext.Name = 'We need to add help here';
    helptext.Tag = 'HelpText';
    % 113 115
    helpFrame.Type = 'group';
    helpFrame.Name = 'Coefficient Editor';
    helpFrame.Items = cellhorzcat(helptext);
    helpFrame.Tag = 'HelpFrame';
end % function
