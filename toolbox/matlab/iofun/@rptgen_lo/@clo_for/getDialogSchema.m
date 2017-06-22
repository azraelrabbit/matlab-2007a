function dlgStruct = getDialogSchema(this, name)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    w = this.dlgWidget;
    % 8 9
    w.LoopType = this.dlgSet(w.LoopType, 'DialogRefresh', true);
    % 10 12
    % 11 12
    if strcmp(this.LoopType, 'increment')
        typeGroup = vertcat(cellhorzcat(w.LoopType), cellhorzcat(w.StartNumber), cellhorzcat(w.IncrementNumber), cellhorzcat(w.EndNumber));
    else
        % 15 19
        % 16 19
        % 17 19
        % 18 19
        % 19 20
        typeGroup = vertcat(cellhorzcat(w.LoopType), cellhorzcat(w.LoopVector));
        % 21 24
        % 22 24
        % 23 24
    end % if
    % 25 26
    dlgStruct = this.dlgMain(name, vertcat(cellhorzcat(this.dlgContainer(typeGroup, xlate('LoopType'), 'RowSpan', [1.0 1.0], 'ColSpan', [1.0 1.0])), cellhorzcat(this.dlgContainer(vertcat(cellhorzcat(this.dlgSet(w.isUseVariable, 'DialogRefresh', true)), cellhorzcat(this.dlgSet(w.VariableName, 'Enabled', this.isUseVariable)), cellhorzcat(this.dlgSet(w.isCleanup, 'Enabled', this.isUseVariable))), xlate('Workspace Variable'), 'RowSpan', [2.0 2.0], 'ColSpan', [1.0 1.0]))), 'LayoutGrid', [2.0 1.0]);
    % 27 39
    % 28 39
    % 29 39
    % 30 39
    % 31 39
    % 32 39
    % 33 39
    % 34 39
    % 35 39
    % 36 39
    % 37 39
    % 38 39
end % function
