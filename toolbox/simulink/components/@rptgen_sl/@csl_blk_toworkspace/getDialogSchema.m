function dlgStruct = getDialogSchema(this, name)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if not(builtin('license', 'checkout', 'SIMULINK_Report_Gen'))
        dlgStruct = this.buildErrorMessage(name, true);
        return;
        % 11 12
    end % if
    % 13 23
    % 14 23
    % 15 23
    % 16 23
    % 17 23
    % 18 23
    % 19 23
    % 20 23
    % 21 23
    % 22 23
    dlgStruct = this.dlgMain(name, vertcat(cellhorzcat(this.dlgContainerSimplePrint('RowSpan', [1.0 1.0], 'ColSpan', [1.0 1.0])), cellhorzcat(this.gr_dlgDisplayOptions(struct('none', xlate('No title'), 'varname', xlate('Use variable or file name'), 'blkname', xlate('blockname'), 'manual', '-Title'), struct('manual', '-Caption', 'auto', xlate('From block "Description" property'), 'none', xlate('No caption')), 'RowSpan', [2.0 2.0], 'ColSpan', [1.0 1.0]))), 'LayoutGrid', [2.0 1.0], 'RowStretch', [0.0 1.0]);
    % 24 35
    % 25 35
    % 26 35
    % 27 35
    % 28 35
    % 29 35
    % 30 35
    % 31 35
    % 32 35
    % 33 35
    % 34 35
end % function
