function dlgStruct = getRootSchemaStruct(this, items, fixptBlurb)
    % 1 29
    % 2 29
    % 3 29
    % 4 29
    % 5 29
    % 6 29
    % 7 29
    % 8 29
    % 9 29
    % 10 29
    % 11 29
    % 12 29
    % 13 29
    % 14 29
    % 15 29
    % 16 29
    % 17 29
    % 18 29
    % 19 29
    % 20 29
    % 21 29
    % 22 29
    % 23 29
    % 24 29
    % 25 29
    % 26 29
    % 27 29
    % 28 29
    if lt(nargin, 3.0)
        fixptBlurb = 1.0;
    end % if
    % 32 34
    % 33 34
    if isempty(items)
        % 35 36
        noParamsString = 'There are no main parameters to specify for this block.';
        noParamsStruct = dspGetLeafWidgetBase('text', noParamsString, 'noMainParamsTag', 0.0);
        % 38 39
        items = cellhorzcat(noParamsStruct);
    end % if
    rows = length(items);
    for ind=1.0:rows
        items{ind}.RowSpan = horzcat(ind, ind);
        items{ind}.ColSpan = [1.0 1.0];
    end % for
    % 46 47
    parameterPane = dspGetContainerWidgetBase('group', 'Parameters', 'parameterPane');
    % 48 49
    parameterPane.Items = items;
    parameterPane.Tag = 'parameterPane';
    parameterPane.LayoutGrid = horzcat(rows, 1.0);
    parameterPane.RowSpan = [1.0 1.0];
    % 53 54
    generalPane = dspGetContainerWidgetBase('panel', '', 'generalPane');
    generalPane.Items = cellhorzcat(parameterPane);
    generalPane.Tag = 'generalPane';
    generalPane.LayoutGrid = [2.0 1.0];
    generalPane.RowStretch = [0.0 1.0];
    % 59 60
    generalTab.Name = 'Main';
    generalTab.Items = cellhorzcat(generalPane);
    fixptTab.Name = 'Fixed-point';
    fixptTab.Items = cellhorzcat(this.FixptDialog.getDialogSchemaStruct(fixptBlurb));
    % 64 65
    tabbedPane = dspGetContainerWidgetBase('tab', '', 'tabPane');
    tabbedPane.Tabs = cellhorzcat(generalTab, fixptTab);
    tabbedPane.RowSpan = [2.0 2.0];
    tabbedPane.ColSpan = [1.0 1.0];
    % 69 70
    dlgStruct = this.getBaseSchemaStruct(tabbedPane, this.Block.MaskDescription);
end % function
