function dlgStruct = list_getDialogSchema(this, name, varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    isOrdered = strcmp(this.ListStyle, 'orderedlist');
    % 9 10
    dlgStruct = this.dlgContainer(vertcat(cellhorzcat(this.dlgWidget('ListStyle', 'RowSpan', [1.0 1.0], 'ColSpan', [1.0 1.0], 'DialogRefresh', true)), cellhorzcat(this.dlgWidget('NumerationType', 'RowSpan', [2.0 2.0], 'ColSpan', [1.0 1.0], 'Enabled', isOrdered)), cellhorzcat(this.dlgWidget('NumInherit', 'RowSpan', [3.0 3.0], 'ColSpan', [1.0 1.0], 'Enabled', isOrdered))), xlate('List Formatting'), 'LayoutGrid', [3.0 1.0], varargin{:});
    % 11 23
    % 12 23
    % 13 23
    % 14 23
    % 15 23
    % 16 23
    % 17 23
    % 18 23
    % 19 23
    % 20 23
    % 21 23
    % 22 23
end % function
