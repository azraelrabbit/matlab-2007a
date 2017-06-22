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
    % 12 13
    if strcmp(this.ListTitleMode, 'auto')
        wTitle = this.dlgText(sprintf('Sorted List for "%s"', xlate('System Name')));
    else
        wTitle = this.dlgWidget('ListTitle');
    end % if
    % 18 19
    dlgStruct = this.dlgMain(name, vertcat(cellhorzcat(this.dlgContainer(vertcat(cellhorzcat(this.dlgWidget('ListTitleMode', 'DialogRefresh', true, 'ColSpan', [1.0 1.0], 'RowSpan', [1.0 1.0])), cellhorzcat(this.dlgSet(wTitle, 'ColSpan', [2.0 2.0], 'RowSpan', [1.0 1.0])), cellhorzcat(this.dlgWidget('isBlockType', 'ColSpan', [1.0 2.0], 'RowSpan', [2.0 2.0])), cellhorzcat(this.dlgWidget('FollowNonVirtual', 'ColSpan', [1.0 2.0], 'RowSpan', [3.0 3.0]))), xlate('Properties'), 'LayoutGrid', [4.0 2.0], 'ColStretch', [0.0 1.0], 'RowStretch', [0.0 0.0 0.0 1.0]))));
    % 20 38
    % 21 38
    % 22 38
    % 23 38
    % 24 38
    % 25 38
    % 26 38
    % 27 38
    % 28 38
    % 29 38
    % 30 38
    % 31 38
    % 32 38
    % 33 38
    % 34 38
    % 35 38
    % 36 38
    % 37 38
end % function
