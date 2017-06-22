function dlgStruct = loop_getDialogSchema(this, name)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if not(builtin('license', 'checkout', 'SIMULINK_Report_Gen'))
        dlgStruct = this.buildErrorMessage('panel', true);
        return;
        % 10 11
    end % if
    % 12 13
    dlgStruct = vertcat(cellhorzcat(this.dlgContainer(vertcat(cellhorzcat(RptgenML.twoColumnTable(this, 'SFFilterTerms', 'isSFFilterList', 'RowSpan', [1.0 1.0], 'ColSpan', [1.0 1.0]))), xlate('Loop Options'), 'LayoutGrid', [1.0 1.0], 'RowStretch', 1.0)));
    % 14 19
    % 15 19
    % 16 19
    % 17 19
    % 18 19
end % function
