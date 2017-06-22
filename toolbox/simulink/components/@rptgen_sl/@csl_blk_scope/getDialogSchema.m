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
    % 12 22
    % 13 22
    % 14 22
    % 15 22
    % 16 22
    % 17 22
    % 18 22
    % 19 22
    % 20 22
    % 21 22
    dlgStruct = this.dlgMain(name, vertcat(cellhorzcat(this.dlgContainer(vertcat(cellhorzcat(this.dlgWidget('isForceOpen', 'RowSpan', [1.0 1.0], 'ColSpan', [1.0 1.0])), cellhorzcat(this.dlgWidget('AutoscaleScope', 'RowSpan', [1.0 1.0], 'ColSpan', [2.0 2.0]))), xlate('Scope Options'), 'RowSpan', [1.0 1.0], 'ColSpan', [1.0 1.0], 'LayoutGrid', [1.0 2.0])), cellhorzcat(this.dlgContainerSimplePrint('RowSpan', [2.0 2.0], 'ColSpan', [1.0 1.0])), cellhorzcat(this.gr_dlgDisplayOptions(struct('none', xlate('No title'), 'blkname', xlate('blockname'), 'fullname', xlate('model/system/system/blockname'), 'manual', '-Title'), struct('manual', '-Caption', 'auto', xlate('From block "Description" property'), 'none', xlate('No caption')), 'RowSpan', [3.0 3.0], 'ColSpan', [1.0 1.0]))), 'LayoutGrid', [3.0 1.0], 'RowStretch', [0.0 0.0 1.0]);
    % 23 45
    % 24 45
    % 25 45
    % 26 45
    % 27 45
    % 28 45
    % 29 45
    % 30 45
    % 31 45
    % 32 45
    % 33 45
    % 34 45
    % 35 45
    % 36 45
    % 37 45
    % 38 45
    % 39 45
    % 40 45
    % 41 45
    % 42 45
    % 43 45
    % 44 45
end % function
