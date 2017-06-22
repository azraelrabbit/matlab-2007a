function dlgStruct = dlgValueSpecial(this, propName, parentNode, varargin)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    if ischar(this)
        feval(this, propName);
        return;
    end % if
    % 12 14
    if isLibrary(this)
        globalEnable = 0.0;
    else
        globalEnable = 1.0;
    end % if
    % 18 20
    allOpt = RptgenML.StylesheetHeaderCell.setValueSpecial;
    allOpt = vertcat(cellhorzcat('', xlate('<Select template>')), allOpt);
    % 21 26
    % 22 26
    % 23 26
    % 24 26
    pValue = struct(findprop(this, propName));
    pValue.Description = horzcat(pValue.Description, ' (XML)');
    % 27 30
    % 28 30
    dlgStruct = this.dlgContainer(vertcat(cellhorzcat(this.dlgWidget(pValue, 'ColSpan', [1.0 2.0], 'RowSpan', [1.0 1.0], 'Type', 'editarea', 'DialogRefresh', 1.0, 'Enabled', globalEnable)), cellhorzcat(struct('Type', 'combobox', 'Tag', 'ListValueSpecial', 'Name', xlate('Append template:'), 'MatlabMethod', 'RptgenML.StylesheetHeaderCell.dlgValueSpecial', 'MatlabArgs', {{'cbkListSelect','%dialog'}}, 'UserData', cellhorzcat(ctranspose(allOpt(:, 1.0))), 'Entries', cellhorzcat(ctranspose(allOpt(:, 2.0))), 'Enabled', globalEnable, 'ColSpan', [1.0 1.0], 'RowSpan', [2.0 2.0])), cellhorzcat(struct('Type', 'pushbutton', 'Tag', 'setValueSpecial', 'ToolTip', xlate('Insert selected template at the end.'), 'Name', xlate('Append'), 'Enabled', false, 'MatlabMethod', 'RptgenML.StylesheetHeaderCell.setValueSpecial', 'MatlabArgs', cellhorzcat(cellhorzcat('%source', '%dialog', propName, parentNode)), 'DialogRefresh', true, 'ColSpan', [2.0 2.0], 'RowSpan', [2.0 2.0]))), '', 'LayoutGrid', [2.0 2.0], 'RowStretch', [1.0 0.0], 'ColStretch', [1.0 0.0], varargin{:});
    % 30 61
    % 31 61
    % 32 61
    % 33 61
    % 34 61
    % 35 61
    % 36 61
    % 37 61
    % 38 61
    % 39 61
    % 40 61
    % 41 61
    % 42 61
    % 43 61
    % 44 61
    % 45 61
    % 46 61
    % 47 61
    % 48 61
    % 49 61
    % 50 61
    % 51 61
    % 52 61
    % 53 61
    % 54 61
    % 55 61
    % 56 61
    % 57 61
    % 58 61
    % 59 61
function cbkListSelect(dlgH)
    % 61 66
    % 62 66
    % 63 66
    % 64 66
    dlgH.setEnabled('setValueSpecial', gt(dlgH.getWidgetValue('ListValueSpecial'), 0.0));
