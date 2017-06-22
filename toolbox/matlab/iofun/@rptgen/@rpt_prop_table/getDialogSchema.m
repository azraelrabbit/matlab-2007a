function dlgStruct = getDialogSchema(this, name)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if isempty(this.TableContent)
        % 7 10
        % 8 10
        this.applyPresetTable('default');
    end % if
    % 11 13
    for i=length(this.TableContent):-1.0:1.0
        try
            if isempty(this.TableContent(i).SpanOrigin)
                cellList{plus(i, 1.0)} = get(this.TableContent(i), 'Text');
                if isempty(cellList{plus(i, 1.0)})
                    cellList{plus(i, 1.0)} = xlate('<empty>');
                end % if
            else
                cellList{plus(i, 1.0)} = sprintf('[%s]', this.TableContent(i).SpanOrigin.Text);
            end % if
        catch
            cellList{plus(i, 1.0)} = '<n/a>';
        end % try
    end % for
    % 26 28
    try
        cellList{1.0} = this.TableTitle.Text;
        if isempty(cellList{1.0})
            cellList{1.0} = xlate('<no title>');
        end % if
    catch
        cellList{1.0} = '<n/a>';
    end % try
    % 35 38
    % 36 38
    cellIdx = min(this.DlgCellIndex, length(this.TableContent));
    % 38 40
    if le(cellIdx, 0.0)
        editedCell = this.TableTitle;
    else
        editedCell = this.TableContent(cellIdx);
    end % if
    % 44 54
    % 45 54
    % 46 54
    % 47 54
    % 48 54
    % 49 54
    % 50 54
    % 51 54
    % 52 54
    allPresets = horzcat(cellhorzcat(xlate('-- Select Table --')), ctranspose(this.pt_getPresetTableList));
    % 54 56
    try
        subclassContainer = this.pt_getDialogSchema(name);
    catch
        warning(lasterr);
        subclassContainer = {};
    end % try
    % 61 63
    if not(isempty(subclassContainer))
        if iscell(subclassContainer)
            subclassContainer = this.dlgContainer(subclassContainer, xlate('Select Object'));
            % 65 69
            % 66 69
            % 67 69
        end % if
    else
        subclassContainer = this.dlgText('x', 'Visible', 0.0);
    end % if
    subclassContainer.ColSpan = [1.0 2.0];
    subclassContainer.RowSpan = [1.0 1.0];
    % 74 76
    if isa(editedCell, 'rptgen.rpt_prop_cell')
        wEditedCell = getDialogSchema(editedCell, 'panel');
    else
        wEditedCell = this.dlgText(xlate('Error: not a property cell'));
    end % if
    % 80 82
    pSVM = findprop(this, 'SingleValueMode');
    % 82 85
    % 83 85
    dlgStruct = this.dlgMain(name, vertcat(cellhorzcat(subclassContainer), cellhorzcat(this.dlgContainer(vertcat(cellhorzcat(this.dlgWidget('SingleValueMode', 'MatlabMethod', 'setSingleValueMode', 'MatlabArgs', cellhorzcat(this), 'ColSpan', [3.0 3.0], 'RowSpan', [1.0 1.0])), cellhorzcat(this.dlgWidget('isBorder', 'ColSpan', [3.0 3.0], 'RowSpan', [2.0 2.0])), cellhorzcat(struct('Type', 'combobox', 'Tag', 'PresetTableList', 'Name', horzcat(xlate('Preset table'), ':'), 'UserData', cellhorzcat(allPresets), 'Entries', cellhorzcat(allPresets), 'ColSpan', [1.0 1.0], 'RowSpan', [1.0 1.0])), cellhorzcat(struct('Type', 'pushbutton', 'Name', xlate('Apply'), 'ObjectMethod', 'dlgApplyPresetTable', 'MethodArgs', {{'%dialog'}}, 'ArgDataTypes', {{'handle'}}, 'DialogRefresh', true, 'ColSpan', [2.0 2.0], 'RowSpan', [1.0 1.0])), cellhorzcat(struct('Type', 'pushbutton', 'Name', horzcat(xlate('Edit'), '...'), 'MatlabMethod', 'dlgEditor', 'MatlabArgs', cellhorzcat(cellhorzcat(this, 'start', '%dialog')), 'DialogRefresh', true, 'ColSpan', [1.0 2.0], 'RowSpan', [2.0 2.0]))), xlate('Table'), 'ColSpan', [1.0 2.0], 'RowSpan', [2.0 2.0], 'ColStretch', [1.0 0.0 0.0], 'LayoutGrid', [2.0 3.0])), cellhorzcat(this.dlgContainer(vertcat(cellhorzcat(this.dlgWidget('DlgCellIndex', 'Type', 'listbox', 'DialogRefresh', true, 'ColSpan', [1.0 1.0], 'RowSpan', [1.0 1.0], 'MultiSelect', 0.0, 'Entries', cellList))), xlate('Table Cells'), 'RowStretch', 1.0, 'LayoutGrid', [1.0 1.0], 'ColSpan', [1.0 1.0], 'RowSpan', [3.0 3.0])), cellhorzcat(this.dlgSet(wEditedCell, 'ColSpan', [2.0 2.0], 'RowSpan', [3.0 3.0]))), 'LayoutGrid', [3.0 2.0], 'RowStretch', [0.0 0.0 1.0]);
    % 85 140
    % 86 140
    % 87 140
    % 88 140
    % 89 140
    % 90 140
    % 91 140
    % 92 140
    % 93 140
    % 94 140
    % 95 140
    % 96 140
    % 97 140
    % 98 140
    % 99 140
    % 100 140
    % 101 140
    % 102 140
    % 103 140
    % 104 140
    % 105 140
    % 106 140
    % 107 140
    % 108 140
    % 109 140
    % 110 140
    % 111 140
    % 112 140
    % 113 140
    % 114 140
    % 115 140
    % 116 140
    % 117 140
    % 118 140
    % 119 140
    % 120 140
    % 121 140
    % 122 140
    % 123 140
    % 124 140
    % 125 140
    % 126 140
    % 127 140
    % 128 140
    % 129 140
    % 130 140
    % 131 140
    % 132 140
    % 133 140
    % 134 140
    % 135 140
    % 136 140
    % 137 140
    % 138 140
end % function
