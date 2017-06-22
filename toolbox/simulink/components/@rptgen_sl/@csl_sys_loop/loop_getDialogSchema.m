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
    end % if
    % 11 12
    if strcmp(this.LoopType, 'list')
        wObjectList = this.dlgWidget('ObjectList', 'ForegroundColor', [1.0 1.0 255.0]);
        % 14 15
        ltRowStretch = [0.0 1.0 0.0];
    else
        wObjectList = this.dlgText(this.loop_getContextString);
        ltRowStretch = [0.0 0.0 1.0];
    end % if
    % 20 22
    % 21 22
    dlgStruct = vertcat(cellhorzcat(this.dlgContainer(vertcat(cellhorzcat(this.dlgWidget('LoopType', 'DialogRefresh', true, 'RowSpan', [1.0 1.0], 'ColSpan', [1.0 1.0])), cellhorzcat(this.dlgSet(wObjectList, 'RowSpan', [2.0 2.0], 'ColSpan', [1.0 1.0]))), xlate('Report On'), 'LayoutGrid', [3.0 1.0], 'RowStretch', ltRowStretch)), cellhorzcat(this.dlgContainer(vertcat(cellhorzcat(this.dlgWidget('SortBy', 'RowSpan', [1.0 1.0], 'ColSpan', [1.0 1.0])), cellhorzcat(RptgenML.twoColumnTable(this, 'FilterTerms', 'isFilterList', 'RowSpan', [2.0 2.0], 'ColSpan', [1.0 1.0]))), xlate('Loop Options'), 'LayoutGrid', [2.0 1.0], 'RowStretch', [0.0 1.0])));
    % 23 44
    % 24 44
    % 25 44
    % 26 44
    % 27 44
    % 28 44
    % 29 44
    % 30 44
    % 31 44
    % 32 44
    % 33 44
    % 34 44
    % 35 44
    % 36 44
    % 37 44
    % 38 44
    % 39 44
    % 40 44
    % 41 44
    % 42 44
    % 43 44
end % function
