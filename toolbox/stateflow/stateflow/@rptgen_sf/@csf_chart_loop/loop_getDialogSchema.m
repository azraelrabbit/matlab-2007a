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
    % 12 15
    % 13 15
    % 14 15
    if strcmp(this.LoopType, 'list')
        wObjectList = this.dlgWidget('ObjectList');
    else
        wObjectList = this.dlgText(this.loop_getContextString);
    end % if
    % 20 21
    dlgStruct = vertcat(cellhorzcat(this.dlgContainer(vertcat(cellhorzcat(this.dlgWidget('LoopType', 'DialogRefresh', true)), cellhorzcat(wObjectList)), xlate('Report On'))), cellhorzcat(this.dlgContainer(vertcat(cellhorzcat(this.dlgWidget('SortBy', 'RowSpan', [1.0 1.0], 'ColSpan', [1.0 1.0])), cellhorzcat(RptgenML.twoColumnTable(this, 'FilterTerms', 'isFilterList', 'RowSpan', [2.0 2.0], 'ColSpan', [1.0 1.0])), cellhorzcat(RptgenML.twoColumnTable(this, 'SFFilterTerms', 'isSFFilterList', 'RowSpan', [3.0 3.0], 'ColSpan', [1.0 1.0]))), xlate('Loop Options'), 'LayoutGrid', [3.0 1.0], 'RowStretch', [0.0 1.0 1.0])));
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
