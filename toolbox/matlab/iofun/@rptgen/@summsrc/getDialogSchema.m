function dlgStruct = getDialogSchema(this, name)
    % 1 14
    % 2 14
    % 3 14
    % 4 14
    % 5 14
    % 6 14
    % 7 14
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    cWid = this.getColumnWidths;
    tableData = this.Properties(:);
    propCount = length(this.Properties);
    customHeaders = this.ColumnHeaders;
    customHeaderCount = length(customHeaders);
    for i=1.0:propCount
        if lt(customHeaderCount, i) || isempty(customHeaders{i})
            tableData{i, 3.0} = xlate('<auto>');
        else
            tableData{i, 3.0} = customHeaders{i};
        end % if
        tableData{i, 2.0} = sprintf('%g', cWid(i));
    end % for
    % 26 31
    % 27 31
    % 28 31
    % 29 31
    propPanel = this.dlgContainer(vertcat(cellhorzcat(struct('Tag', 'Properties', 'Type', 'table', 'Size', size(tableData), 'Grid', true, 'HeaderVisibility', [0.0 1.0], 'ColHeader', cellhorzcat(cellhorzcat(xlate('Property Name'), xlate('Width'), xlate('Header'))), 'ColumnCharacterWidth', [8.0 4.0 12.0], 'Editable', true, 'ValueChangedCallback', @onValueChanged, 'CurrentItemChangedCallback', @onCurrentChanged, 'Data', cellhorzcat(tableData), 'SelectedRow', minus(this.DlgCurrentPropertyIdx, 1.0), 'RowSpan', [1.0 6.0], 'ColSpan', [1.0 1.0])), cellhorzcat(this.dlgWidget('FilterEmptyColumns', 'RowSpan', [7.0 7.0], 'ColSpan', [1.0 2.0])), cellhorzcat(this.dlgText(' ', 'RowSpan', [1.0 1.0], 'ColSpan', [2.0 2.0])), cellhorzcat(struct('Type', 'pushbutton', 'Tag', 'dlgMoveUp', 'Enabled', gt(this.DlgCurrentPropertyIdx, 1.0), 'FilePath', fullfile(matlabroot, 'toolbox/rptgen/resources/move_up.png'), 'MatlabMethod', 'dlgMoveUp', 'MatlabArgs', {{'%source'}}, 'ToolTip', xlate('Move property up'), 'DialogRefresh', true, 'ColSpan', [2.0 2.0], 'RowSpan', [2.0 2.0])), cellhorzcat(struct('Type', 'pushbutton', 'Tag', 'dlgMoveDown', 'Enabled', lt(this.DlgCurrentPropertyIdx, propCount), 'FilePath', fullfile(matlabroot, 'toolbox/rptgen/resources/move_down.png'), 'DialogRefresh', true, 'MatlabMethod', 'dlgMoveDown', 'MatlabArgs', {{'%source'}}, 'ToolTip', xlate('Move property down'), 'ColSpan', [2.0 2.0], 'RowSpan', [3.0 3.0])), cellhorzcat(struct('Type', 'pushbutton', 'Tag', 'dlgDelete', 'Enabled', gt(propCount, 1.0), 'FilePath', fullfile(matlabroot, 'toolbox/rptgen/resources/delete.png'), 'DialogRefresh', true, 'MatlabMethod', 'dlgDelete', 'MatlabArgs', {{'%source'}}, 'ToolTip', xlate('Remove property'), 'ColSpan', [2.0 2.0], 'RowSpan', [4.0 4.0])), cellhorzcat(struct('Type', 'pushbutton', 'Tag', 'dlgAdd', 'FilePath', fullfile(matlabroot, 'toolbox/rptgen/resources/move_left.png'), 'DialogRefresh', true, 'MatlabMethod', 'dlgAdd', 'MatlabArgs', {{'%source','%dialog'}}, 'ToolTip', xlate('Add property'), 'ColSpan', [2.0 2.0], 'RowSpan', [5.0 5.0])), cellhorzcat(this.PropSrc.dlgDialogSchema('panel', this, '', 'RowSpan', [1.0 7.0], 'ColSpan', [3.0 3.0]))), xlate('Property Columns'), 'LayoutGrid', [6.0 3.0], 'RowStretch', [0.0 0.0 0.0 0.0 0.0 1.0], 'ColStretch', [2.0 0.0 1.0]);
    % 31 98
    % 32 98
    % 33 98
    % 34 98
    % 35 98
    % 36 98
    % 37 98
    % 38 98
    % 39 98
    % 40 98
    % 41 98
    % 42 98
    % 43 98
    % 44 98
    % 45 98
    % 46 98
    % 47 98
    % 48 98
    % 49 98
    % 50 98
    % 51 98
    % 52 98
    % 53 98
    % 54 98
    % 55 98
    % 56 98
    % 57 98
    % 58 98
    % 59 98
    % 60 98
    % 61 98
    % 62 98
    % 63 98
    % 64 98
    % 65 98
    % 66 98
    % 67 98
    % 68 98
    % 69 98
    % 70 98
    % 71 98
    % 72 98
    % 73 98
    % 74 98
    % 75 98
    % 76 98
    % 77 98
    % 78 98
    % 79 98
    % 80 98
    % 81 98
    % 82 98
    % 83 98
    % 84 98
    % 85 98
    % 86 98
    % 87 98
    % 88 98
    % 89 98
    % 90 98
    % 91 98
    % 92 98
    % 93 98
    % 94 98
    % 95 98
    % 96 98
    objPanel = this.dlgContainer(vertcat(cellhorzcat(this.dlgWidget('Anchor')), cellhorzcat(this.LoopComp.getDialogSchema('loop'))), xlate('Object Rows'));
    % 98 103
    % 99 103
    % 100 103
    % 101 103
    dlgStruct = this.dlgMain(name, vertcat(cellhorzcat(propPanel), cellhorzcat(objPanel)));
    % 103 106
    % 104 106
end % function
function onValueChanged(d, r, c, val)
    % 107 114
    % 108 114
    % 109 114
    % 110 114
    % 111 114
    % 112 114
    this = d.getWidgetSource('Properties');
    r = plus(r, 1.0);
    % 115 117
    if eq(c, 0.0)
        this.Properties{r} = val;
    else
        if eq(c, 1.0)
            this.ColumnWidths(r) = str2num(val);
        else
            if strcmpi(val, xlate('<auto>'))
                val = '';
            end % if
            cHead = this.ColumnHeaders;
            cHead{r} = val;
            for i=1.0:minus(r, 1.0)
                if not(ischar(cHead{i}))
                    cHead{i} = '';
                end % if
            end % for
            this.ColumnHeaders = cHead;
        end % if
    end % if
end % function
function onCurrentChanged(d, r, c)
    % 137 142
    % 138 142
    % 139 142
    % 140 142
    this = d.getWidgetSource('Properties');
    this.DlgCurrentPropertyIdx = plus(r, 1.0);
    d.selectTableRow('Properties', r);
    % 144 146
    d.setEnabled('dlgMoveUp', gt(this.DlgCurrentPropertyIdx, 1.0));
    d.setEnabled('dlgMoveDown', lt(this.DlgCurrentPropertyIdx, length(this.Properties)));
end % function
