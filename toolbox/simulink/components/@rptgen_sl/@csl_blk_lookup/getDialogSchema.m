function dlgStruct = getDialogSchema(this, name)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if not(builtin('license', 'checkout', 'SIMULINK_Report_Gen'))
        dlgStruct = this.buildErrorMessage(name, true);
        return;
        % 10 11
    end % if
    % 12 16
    % 13 16
    % 14 16
    % 15 16
    dlgStruct = this.dlgMain(name, vertcat(cellhorzcat(this.dlgContainer(vertcat(cellhorzcat(this.dlgWidget('isSinglePlot', 'DialogRefresh', true, 'RowSpan', [1.0 1.0], 'ColSpan', [1.0 1.0])), cellhorzcat(this.dlgWidget('SinglePlotType', 'Enabled', this.isSinglePlot, 'RowSpan', [1.0 1.0], 'ColSpan', [2.0 2.0])), cellhorzcat(this.dlgWidget('isSingleTable', 'RowSpan', [2.0 2.0], 'ColSpan', [1.0 2.0])), cellhorzcat(this.dlgWidget('isDoublePlot', 'DialogRefresh', true, 'RowSpan', [3.0 3.0], 'ColSpan', [1.0 1.0])), cellhorzcat(this.dlgWidget('DoublePlotType', 'Enabled', this.isDoublePlot, 'RowSpan', [3.0 3.0], 'ColSpan', [2.0 2.0])), cellhorzcat(this.dlgWidget('isDoubleTable', 'RowSpan', [4.0 4.0], 'ColSpan', [1.0 2.0])), cellhorzcat(this.dlgWidget('isMultiTable', 'RowSpan', [5.0 5.0], 'ColSpan', [1.0 2.0]))), xlate('Look-Up Table Options'), 'LayoutGrid', [5.0 2.0], 'RowSpan', [1.0 1.0], 'ColSpan', [1.0 1.0], 'ColStretch', [0.0 1.0])), cellhorzcat(this.dlgContainerSimplePrint('RowSpan', [2.0 2.0], 'ColSpan', [1.0 1.0])), cellhorzcat(this.gr_dlgDisplayOptions(struct('none', xlate('No title'), 'auto', xlate('blockname'), 'manual', '-Title'), struct('manual', '-Caption', 'auto', xlate('From block "Description" property'), 'none', xlate('No caption')), 'RowSpan', [3.0 3.0], 'ColSpan', [1.0 1.0]))), 'LayoutGrid', [3.0 1.0], 'RowStretch', [0.0 0.0 1.0]);
    % 17 59
    % 18 59
    % 19 59
    % 20 59
    % 21 59
    % 22 59
    % 23 59
    % 24 59
    % 25 59
    % 26 59
    % 27 59
    % 28 59
    % 29 59
    % 30 59
    % 31 59
    % 32 59
    % 33 59
    % 34 59
    % 35 59
    % 36 59
    % 37 59
    % 38 59
    % 39 59
    % 40 59
    % 41 59
    % 42 59
    % 43 59
    % 44 59
    % 45 59
    % 46 59
    % 47 59
    % 48 59
    % 49 59
    % 50 59
    % 51 59
    % 52 59
    % 53 59
    % 54 59
    % 55 59
    % 56 59
    % 57 59
    % 58 59
end % function
