function dlgStruct = getDialogSchema(this, name)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    dlgStruct = this.dlgMain(name, vertcat(cellhorzcat(this.dlgFormatWidget('ColSpan', [1.0 1.0], 'RowSpan', [1.0 1.0])), cellhorzcat(this.dlgStylesheetWidget('ColSpan', [2.0 2.0], 'RowSpan', [1.0 1.0]))), 'LayoutGrid', [1.0 2.0]);
    % 9 18
    % 10 18
    % 11 18
    % 12 18
    % 13 18
    % 14 18
    % 15 18
    % 16 18
    % 17 18
    if strcmpi(name, 'panel')
        dlgStruct.Type = 'group';
        dlgStruct.Name = xlate('Report Format and Stylesheet');
    end % if
end % function
