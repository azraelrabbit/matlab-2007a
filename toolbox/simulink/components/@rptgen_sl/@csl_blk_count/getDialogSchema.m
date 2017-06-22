function dlgStruct = getDialogSchema(this, name)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if not(builtin('license', 'checkout', 'SIMULINK_Report_Gen'))
        dlgStruct = this.buildErrorMessage(name, true);
        return;
        % 9 11
    end % if
    % 11 13
    switch lower(getContextType(rptgen_sl.appdata_sl, this, false))
    case 'model'
        ctxtMsg = xlate('Count blocks in current model: ');
        enableIncludeBlocks = true;
    case 'system'
        ctxtMsg = xlate('Count blocks in current system');
        enableIncludeBlocks = false;
    case 'block'
        ctxtMsg = xlate('Can not count blocktypes inside block loop');
        enableIncludeBlocks = false;
    case 'signal'
        ctxtMsg = xlate('Can not count blocktypes inside signal loop');
        enableIncludeBlocks = false;
    case 'annotation'
        ctxtMsg = xlate('Can not count blocktypes inside annotation loop');
        enableIncludeBlocks = false;
    case 'configset'
        ctxtMsg = xlate('Can not count blocktypes inside configuration set loop');
        enableIncludeBlocks = false;
    otherwise
        ctxtMsg = xlate('Count blocks in all open models');
        enableIncludeBlocks = false;
    end % switch
    % 35 37
    dlgStruct = this.dlgMain(name, vertcat(cellhorzcat(this.dlgContainer(vertcat(cellhorzcat(this.dlgText(ctxtMsg, 'RowSpan', [1.0 1.0], 'ColSpan', [1.0 1.0])), cellhorzcat(this.dlgWidget('IncludeBlocks', 'Enabled', enableIncludeBlocks, 'RowSpan', [2.0 2.0], 'ColSpan', [1.0 1.0]))), xlate('Count Types'), 'LayoutGrid', [2.0 1.0], 'RowSpan', [1.0 1.0], 'ColSpan', [1.0 1.0])), cellhorzcat(this.dlgContainer(vertcat(cellhorzcat(this.dlgWidget('TableTitle', 'RowSpan', [1.0 1.0], 'ColSpan', [1.0 1.0])), cellhorzcat(this.dlgWidget('isBlockName', 'RowSpan', [2.0 2.0], 'ColSpan', [1.0 1.0])), cellhorzcat(this.dlgWidget('SortOrder', 'RowSpan', [3.0 3.0], 'ColSpan', [1.0 1.0])), cellhorzcat(this.dlgWidget('IncludeTotal', 'RowSpan', [4.0 4.0], 'ColSpan', [1.0 1.0]))), xlate('Table Content'), 'LayoutGrid', [4.0 1.0], 'RowSpan', [2.0 2.0], 'ColSpan', [1.0 1.0]))), 'LayoutGrid', [3.0 1.0], 'RowStretch', [0.0 0.0 1.0]);
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
end % function
