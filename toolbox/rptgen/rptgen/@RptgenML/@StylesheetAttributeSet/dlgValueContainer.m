function dlgStruct = dlgValueContainer(this, varargin)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if isLibrary(this)
        globalEnable = 0.0;
    else
        globalEnable = 1.0;
    end % if
    % 11 13
    if isempty(this.DescriptionShort)
        headText = this.ID;
    else
        headText = horzcat(this.ID, ' - ', this.DescriptionShort);
    end % if
    % 17 19
    dlgStruct = this.dlgContainer(vertcat(cellhorzcat(this.dlgText(headText, 'WordWrap', 1.0, 'RowSpan', [1.0 1.0], 'ColSpan', [1.0 1.0])), cellhorzcat(this.dlgWidget('UseAttributeSets', 'RowSpan', [2.0 2.0], 'ColSpan', [1.0 1.0], 'Enabled', globalEnable)), cellhorzcat(this.dlgText(xlate('Attributes:'), 'RowSpan', [3.0 3.0], 'ColSpan', [1.0 1.0])), cellhorzcat(RptgenML.dlgChildContainer(this, '', 'Enabled', globalEnable, 'RowSpan', [4.0 4.0], 'ColSpan', [1.0 1.0]))), xlate('Value'), 'LayoutGrid', [4.0 1.0], 'RowStretch', [0.0 1.0 0.0 0.0], varargin{:});
    % 19 37
    % 20 37
    % 21 37
    % 22 37
    % 23 37
    % 24 37
    % 25 37
    % 26 37
    % 27 37
    % 28 37
    % 29 37
    % 30 37
    % 31 37
    % 32 37
    % 33 37
    % 34 37
    % 35 37
end % function
