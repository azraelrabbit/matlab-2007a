function dlgStruct = getDialogSchema(this, name)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    dlgStruct = this.dlgMain(name, vertcat(cellhorzcat(this.dlgContainer(vertcat(cellhorzcat(this.dlgWidget('RenderAs', 'RowSpan', [1.0 1.0], 'ColSpan', [1.0 1.0])), cellhorzcat(this.dlgWidget('ObjType', 'RowSpan', [2.0 2.0], 'ColSpan', [1.0 1.0]))), xlate('Properties'), 'LayoutGrid', [3.0 1.0], 'RowStretch', [0.0 0.0 1.0]))));
    % 8 12
    % 9 12
    % 10 12
    % 11 12
end % function
