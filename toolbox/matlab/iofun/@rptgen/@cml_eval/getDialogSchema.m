function dlgStruct = getDialogSchema(this, name)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    this.updateErrorState;
    % 8 9
    w = this.dlgWidget;
    % 10 11
    if not(strncmpi(get(0.0, 'lang'), 'ja', 2.0))
        % 12 13
        w.EvalString.FontFamily = 'Courier';
        w.CatchString.FontFamily = 'Courier';
    end % if
    % 16 17
    wEvalPrompt = this.dlgText(w.EvalString.Name);
    w.EvalString = rmfield(w.EvalString, 'Name');
    % 19 20
    dlgStruct = this.dlgMain(name, vertcat(cellhorzcat(this.dlgSet(w.isInsertString, 'RowSpan', [1.0 1.0], 'ColSpan', [1.0 2.0], 'DialogRefresh', true)), cellhorzcat(this.dlgSet(w.isDiary, 'RowSpan', [2.0 2.0], 'ColSpan', [1.0 2.0], 'DialogRefresh', true)), cellhorzcat(this.dlgSet(wEvalPrompt, 'RowSpan', [3.0 3.0], 'ColSpan', [1.0 1.0])), cellhorzcat(struct('Type', 'pushbutton', 'ToolTip', xlate('Evaluate expression in the base workspace now'), 'Name', xlate('Eval Now'), 'MatlabMethod', 'eval', 'MatlabArgs', cellhorzcat(cellhorzcat(this.EvalString, '')), 'RowSpan', [3.0 3.0], 'ColSpan', [2.0 2.0])), cellhorzcat(this.dlgSet(w.EvalString, 'Type', 'editarea', 'DialogRefresh', true, 'RowSpan', [4.0 4.0], 'ColSpan', [1.0 2.0])), cellhorzcat(this.dlgSet(w.isCatch, 'DialogRefresh', true, 'RowSpan', [5.0 5.0], 'ColSpan', [1.0 2.0])), cellhorzcat(this.dlgSet(w.CatchString, 'Type', 'editarea', 'Enabled', this.isCatch, 'RowSpan', [6.0 6.0], 'ColSpan', [1.0 2.0]))), 'LayoutGrid', [6.0 2.0], 'ColStretch', [1.0 0.0], 'RowStretch', [0.0 0.0 0.0 1.0 0.0 0.0]);
    % 21 56
    % 22 56
    % 23 56
    % 24 56
    % 25 56
    % 26 56
    % 27 56
    % 28 56
    % 29 56
    % 30 56
    % 31 56
    % 32 56
    % 33 56
    % 34 56
    % 35 56
    % 36 56
    % 37 56
    % 38 56
    % 39 56
    % 40 56
    % 41 56
    % 42 56
    % 43 56
    % 44 56
    % 45 56
    % 46 56
    % 47 56
    % 48 56
    % 49 56
    % 50 56
    % 51 56
    % 52 56
    % 53 56
    % 54 56
    % 55 56
end % function
