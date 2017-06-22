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
    chEl = this.getChooseElement;
    if isempty(chEl)
        dlgStruct = this.dlgContainer(vertcat(cellhorzcat(this.dlgText(headText, 'WordWrap', 1.0, 'RowSpan', [1.0 1.0], 'ColSpan', [1.0 1.0])), cellhorzcat(this.dlgWidget('Value', 'Type', 'editarea', 'RowSpan', [2.0 2.0], 'ColSpan', [1.0 1.0], 'Enabled', globalEnable, 'Name', xlate('Value (XML)')))), xlate('Value'), 'LayoutGrid', [2.0 1.0], 'RowStretch', [0.0 1.0], varargin{:});
    else
        % 22 35
        % 23 35
        % 24 35
        % 25 35
        % 26 35
        % 27 35
        % 28 35
        % 29 35
        % 30 35
        % 31 35
        % 32 35
        % 33 35
        % 34 37
        % 35 37
        oEl = this.getOtherwiseElement(chEl);
        % 37 39
        dlgStruct = this.dlgContainer(vertcat(cellhorzcat(this.dlgText(headText, 'WordWrap', 1.0, 'RowSpan', [1.0 1.0], 'ColSpan', [1.0 2.0])), cellhorzcat(this.dlgText(xlate('Conditional cell values:'), 'RowSpan', [2.0 2.0], 'ColSpan', [1.0 1.0])), cellhorzcat(struct('Type', 'pushbutton', 'ColSpan', [2.0 2.0], 'RowSpan', [2.0 2.0], 'Tag', 'addCell', 'ToolTip', xlate('Add new empty cell'), 'DialogRefresh', 1.0, 'Enabled', globalEnable, 'MatlabMethod', 'addCell', 'MatlabArgs', {{'%source'}}, 'Name', xlate('Add Cell'))), cellhorzcat(RptgenML.dlgChildContainer(this, '', 'Enabled', globalEnable, 'RowSpan', [3.0 3.0], 'ColSpan', [1.0 2.0])), cellhorzcat(RptgenML.StylesheetHeaderCell.dlgValueSpecial(this, 'OtherwiseValue', oEl, 'ColSpan', [1.0 2.0], 'RowSpan', [4.0 4.0]))), xlate('Value'), 'LayoutGrid', [4.0 2.0], 'RowStretch', [0.0 0.0 0.0 1.0], 'ColStretch', [1.0 0.0], varargin{:});
        % 39 67
        % 40 67
        % 41 67
        % 42 67
        % 43 67
        % 44 67
        % 45 67
        % 46 67
        % 47 67
        % 48 67
        % 49 67
        % 50 67
        % 51 67
        % 52 67
        % 53 67
        % 54 67
        % 55 67
        % 56 67
        % 57 67
        % 58 67
        % 59 67
        % 60 67
        % 61 67
        % 62 67
        % 63 67
        % 64 67
        % 65 67
    end % if
