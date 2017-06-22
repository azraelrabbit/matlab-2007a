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
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    % 16 17
    dlgStruct = this.dlgMain(name, vertcat(cellhorzcat(this.dlgContainer(vertcat(cellhorzcat(this.dlgWidget('ObjectType', 'RowSpan', [1.0 1.0], 'ColSpan', [1.0 1.0])), cellhorzcat(this.dlgWidget('RenderAs', 'RowSpan', [2.0 2.0], 'ColSpan', [1.0 1.0])), cellhorzcat(this.dlgWidget('isFullName', 'RowSpan', [3.0 3.0], 'ColSpan', [1.0 1.0]))), xlate('Properties'), 'LayoutGrid', [4.0 1.0], 'RowStretch', [0.0 0.0 0.0 1.0]))));
    % 18 31
    % 19 31
    % 20 31
    % 21 31
    % 22 31
    % 23 31
    % 24 31
    % 25 31
    % 26 31
    % 27 31
    % 28 31
    % 29 31
    % 30 31
end % function
