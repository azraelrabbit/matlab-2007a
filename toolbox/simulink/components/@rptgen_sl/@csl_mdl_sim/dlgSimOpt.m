function dlgStruct = dlgSimOpt(this, varargin)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    wSimParam = RptgenML.twoColumnTable(this, 'SimParam', '', 'RowSpan', [3.0 3.0], 'ColSpan', [1.0 1.0]);
    % 8 9
    wSimParam = RptgenML.twoColumnTable(this, wSimParam, '-setColHeader', cellhorzcat(xlate('Simulation Parameter'), xlate('Value')));
    % 10 11
    wSimParam = RptgenML.twoColumnTable(this, wSimParam, '-setDefaultRow', cellhorzcat(xlate('SimParam'), xlate('SimValue')));
    % 12 14
    % 13 14
    dlgStruct = this.dlgContainer(vertcat(cellhorzcat(this.dlgWidget('CompileModel', 'RowSpan', [1.0 1.0], 'ColSpan', [1.0 1.0])), cellhorzcat(this.dlgWidget('MessageDisplay', 'RowSpan', [2.0 2.0], 'ColSpan', [1.0 1.0])), cellhorzcat(wSimParam)), xlate('Simulation Options'), 'LayoutGrid', [3.0 1.0], 'RowStretch', [0.0 0.0 1.0], varargin{:});
    % 15 22
    % 16 22
    % 17 22
    % 18 22
    % 19 22
    % 20 22
    % 21 22
end % function
