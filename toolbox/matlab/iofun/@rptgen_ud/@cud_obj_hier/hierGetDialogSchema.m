function dlgStruct = hierGetDialogSchema(this, name)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    dlgStruct = this.dlgContainer(vertcat(cellhorzcat(this.dlgWidget('TreeType')), cellhorzcat(this.dlgWidget('EmphasizeCurrent')), cellhorzcat(this.dlgText('')), cellhorzcat(this.dlgWidget('ParentDepth')), cellhorzcat(this.dlgWidget('ShowSiblings')), cellhorzcat(this.dlgWidget('ChildDepth'))), xlate('Tree Objects'));
    % 11 17
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    % 16 17
end % function
