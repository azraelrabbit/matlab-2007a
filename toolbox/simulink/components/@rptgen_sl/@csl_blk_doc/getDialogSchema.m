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
    dlgStruct = this.dlgMain(name, vertcat(cellhorzcat(this.dlgWidget('ImportType', 'RowSpan', [1.0 1.0], 'ColSpan', [1.0 1.0])), cellhorzcat(this.dlgWidget('LinkingAnchor', 'RowSpan', [2.0 2.0], 'ColSpan', [1.0 1.0]))), 'LayoutGrid', [3.0 1.0], 'RowStretch', [0.0 0.0 1.0]);
    % 14 20
    % 15 20
    % 16 20
    % 17 20
    % 18 20
    % 19 20
end % function
