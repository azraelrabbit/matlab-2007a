function dlgStruct = dlgSectionOptions(this, varargin)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    dlgStruct = this.dlgContainer(vertcat(cellhorzcat(this.dlgWidget('ObjectSection', 'RowSpan', [1.0 1.0], 'ColSpan', [1.0 1.0], 'DialogRefresh', true)), cellhorzcat(this.dlgWidget('ShowTypeInTitle', 'RowSpan', [2.0 2.0], 'ColSpan', [1.0 1.0], 'Enabled', this.ObjectSection)), cellhorzcat(this.dlgWidget('ObjectAnchor', 'RowSpan', [3.0 3.0], 'ColSpan', [1.0 1.0]))), xlate('Section Options'), 'LayoutGrid', [3.0 1.0], varargin{:});
    % 11 24
    % 12 24
    % 13 24
    % 14 24
    % 15 24
    % 16 24
    % 17 24
    % 18 24
    % 19 24
    % 20 24
    % 21 24
    % 22 24
    % 23 24
end % function
