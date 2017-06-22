function impTab = getTabDialogSchema(h, schemaName, hTopObj)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    size = h.Size;
    tag = horzcat(getWidgetTagPrefix(h), 'ImplementationPanel_');
    % 9 21
    % 10 21
    % 11 21
    % 12 21
    % 13 21
    % 14 21
    % 15 21
    % 16 21
    % 17 21
    % 18 21
    % 19 21
    tblPos.Tag = 'tablePos';
    tblPos.Type = 'table';
    tblPos.Size = horzcat(size, 5.0);
    tblPos.Grid = true;
    % 24 33
    % 25 33
    % 26 33
    % 27 33
    % 28 33
    % 29 33
    % 30 33
    % 31 33
    tblPos.ColHeader = cellhorzcat(sprintf('ModelScope'), sprintf('BlockScope'), sprintf('Implementation'), sprintf('Parameter'), sprintf('Value'));
    % 33 40
    % 34 40
    % 35 40
    % 36 40
    % 37 40
    % 38 40
    tblPos.ColumnCharacterWidth = [11.0 11.0 11.0 6.0 4.0];
    tblPos.ColumnHeaderHeight = 2.0;
    tblPos.RowHeaderWidth = 2.0;
    tblPos.HeaderVisibility = [1.0 1.0];
    tblPos.MinimumSize = [500.0 320.0];
    tblPos.MaximumSize = [500.0 320.0];
    % 45 49
    % 46 49
    % 47 49
    tblPos.Editable = true;
    tblPos.ValueChangedCallback = @onValueChanged;
    tblPos.CurrentItemChangedCallback = @onCurrentChanged;
    tblPos.Tag = horzcat(tag, 'tblPos');
    % 52 54
    data = {};
    for i=1.0:length(h.positionSchema)
        s = h.positionSchema(i);
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
        cmbPath.Type = 'edit';
        cmbPath.ObjectProperty = 'path';
        cmbPath.Source = s;
        cmbPath.ToolTip = 'pathpathpathpathpathpathpath';
        cmbPath.Tag = horzcat(tag, 'modelScope_', num2str(i));
        data{i, 1.0} = cmbPath;
        % 72 75
        % 73 75
        cmbBlock.Type = 'edit';
        cmbBlock.ObjectProperty = 'BlockScope';
        cmbBlock.Source = s;
        cmbBlock.Mode = true;
        cmbBlock.DialogRefresh = true;
        cmbBlock.Tag = horzcat(tag, 'BlockScope_', num2str(i));
        data{i, 2.0} = cmbBlock;
        % 81 84
        % 82 84
        cmbImp.Type = 'combobox';
        if isempty(s.implElements)
            s.implElements = {'aaa','bbb','ccc','ddd','eee'};
        end % if
        % 87 89
        cmbImp.Entries = s.implElements;
        s.implementation = s.implElements{s.implSelIndex};
        cmbImp.Values = 1.0:length(s.implElements);
        cmbImp.Value = s.implSelIndex;
        cmbImp.Tag = horzcat(tag, 'implementation_', num2str(i));
        data{i, 3.0} = cmbImp;
        % 94 97
        % 95 97
        strParameter.Type = 'edit';
        strParameter.ObjectProperty = 'parameter';
        strParameter.Source = s;
        strParameter.ToolTip = 'parameterparameterparameterparameterparameter';
        strParameter.Tag = horzcat(tag, 'param_', num2str(i));
        % 101 104
        % 102 104
        data{i, 4.0} = strParameter;
        % 104 107
        % 105 107
        strValue.Type = 'edit';
        strValue.ObjectProperty = 'value';
        strValue.Source = s;
        strValue.Tag = horzcat(tag, 'value_', num2str(i));
        % 110 112
        data{i, 5.0} = strValue;
        % 112 128
        % 113 128
        % 114 128
        % 115 128
        % 116 128
        % 117 128
        % 118 128
        % 119 128
        % 120 128
        % 121 128
        % 122 128
        % 123 128
        % 124 128
        % 125 128
        % 126 128
    end % for
    % 128 130
    tblPos.Data = data;
    % 130 132
    if gt(size, 0.0)
        tblPos.SelectedRow = h.selTableIndex;
    end % if
    % 134 140
    % 135 140
    % 136 140
    % 137 140
    % 138 140
    tblPos.Mode = true;
    tblPos.Tag = horzcat(tag, 'table');
    % 141 144
    % 142 144
    pnlTable.Name = '';
    pnlTable.Type = 'panel';
    pnlTable.Items = cellhorzcat(tblPos);
    pnlTable.LayoutGrid = [7.0 7.0];
    pnlTable.ColStretch = [1.0 1.0 1.0 1.0 1.0 1.0 1.0];
    pnlTable.RowStretch = [0.0 0.0 0.0 1.0 1.0 1.0 1.0];
    pnlTable.RowSpan = [1.0 8.0];
    pnlTable.ColSpan = [1.0 7.0];
    pnlTable.Tag = horzcat(tag, 'Tab_group');
    % 152 157
    % 153 157
    % 154 157
    % 155 157
    iconPath = fullfile(matlabroot, 'toolbox', 'shared', 'hdlshared');
    % 157 161
    % 158 161
    % 159 161
    bAdd.FilePath = fullfile(iconPath, 'insert_row.png');
    bAdd.Type = 'pushbutton';
    bAdd.ToolTip = 'Add a new entry';
    bAdd.Tag = horzcat(tag, 'add');
    bAdd.MinimumSize = [25.0 25.0];
    bAdd.MaximumSize = [25.0 25.0];
    bAdd.ObjectMethod = 'implementationlCallback';
    bAdd.MethodArgs = cellhorzcat('%dialog', bAdd.Tag, 'addNewEntry');
    bAdd.ArgDataTypes = {'handle','string','string'};
    bAdd.RowSpan = [1.0 1.0];
    bAdd.ColSpan = [8.0 8.0];
    bAdd.Mode = true;
    bAdd.DialogRefresh = true;
    % 173 175
    if isequal(h.Size, 0.0) || lt(h.selTableIndex, 0.0)
        buttonEnable = false;
    else
        buttonEnable = true;
    end % if
    % 179 182
    % 180 182
    bRemove.FilePath = fullfile(iconPath, 'delete.png');
    bRemove.ToolTip = 'Delete selected entry';
    bRemove.Type = 'pushbutton';
    bRemove.Tag = horzcat(tag, 'remove');
    bRemove.MinimumSize = [25.0 25.0];
    bRemove.MaximumSize = [25.0 25.0];
    bRemove.ObjectMethod = 'implementationlCallback';
    bRemove.MethodArgs = cellhorzcat('%dialog', bRemove.Tag, 'removeEntry');
    bRemove.ArgDataTypes = {'handle','string','string'};
    bRemove.RowSpan = [2.0 2.0];
    bRemove.ColSpan = [8.0 8.0];
    bRemove.Enabled = buttonEnable;
    bRemove.Mode = true;
    bRemove.DialogRefresh = true;
    % 195 199
    % 196 199
    % 197 199
    bDuplicate.FilePath = fullfile(iconPath, 'copy.png');
    bDuplicate.Type = 'pushbutton';
    bDuplicate.ToolTip = 'Make a copy of selected entry';
    bDuplicate.Tag = horzcat(tag, 'dup');
    bDuplicate.MinimumSize = [25.0 25.0];
    bDuplicate.MaximumSize = [25.0 25.0];
    bDuplicate.ObjectMethod = 'implementationlCallback';
    bDuplicate.MethodArgs = cellhorzcat('%dialog', bDuplicate.Tag, 'dupEntry');
    bDuplicate.ArgDataTypes = {'handle','string','string'};
    bDuplicate.RowSpan = [3.0 3.0];
    bDuplicate.ColSpan = [8.0 8.0];
    bDuplicate.Enabled = buttonEnable;
    bDuplicate.Mode = true;
    bDuplicate.DialogRefresh = true;
    % 212 217
    % 213 217
    % 214 217
    % 215 217
    grpConfigEntries.Name = 'Implementation Bindings';
    grpConfigEntries.Type = 'group';
    grpConfigEntries.Items = cellhorzcat(pnlTable, bAdd, bDuplicate, bRemove);
    grpConfigEntries.LayoutGrid = [8.0 8.0];
    grpConfigEntries.ColStretch = [1.0 1.0 1.0 1.0 1.0 1.0 1.0 0.0];
    % 221 223
    grpConfigEntries.RowStretch = [1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0];
    grpConfigEntries.Tag = horzcat(tag, 'group');
    % 224 226
    impTab.Items = cellhorzcat(grpConfigEntries);
    impTab.Name = 'Implementation Bindings';
    impTab.Source = h;
    impTab.Tag = horzcat(tag, 'impTab');
function onValueChanged(d, r, c, val)
    % 230 243
    % 231 243
    % 232 243
    % 233 243
    % 234 243
    % 235 243
    % 236 243
    % 237 243
    % 238 243
    % 239 243
    % 240 243
    % 241 243
    if ischar(val)
        disp(sprintf('item at (%d, %d) changed to ''%s''', r, c, val));
    else
        disp(sprintf('item at (%d, %d) changed to %d', r, c, val));
    end % if
    % 247 250
    % 248 250
    hdlccomp = gethdlcconfigset(d.getSource);
    hCFGDialogObj = getsubcomponent(hdlccomp, 'hdlcoderui.hdlconfigs');
    % 251 253
    s = hCFGDialogObj.positionSchema(plus(r, 1.0));
    switch c
        % 255 257
    case 0.0
        % 256 258
        s.path = val;
    case 1.0
        s.BlockScope = val;
    case 2.0
        s.implementation = s.implElements{val};
        s.implSelIndex = val;
    case 3.0
        s.parameter = val;
    case 4.0
        s.value = val;
    end % switch
function onCurrentChanged(d, r, c)
    % 269 274
    % 270 274
    % 271 274
    % 272 274
    disp(sprintf('selected item at (%d, %d)', r, c));
    % 274 276
    hdlccomp = gethdlcconfigset(d.getSource);
    hCFGDialogObj = getsubcomponent(hdlccomp, 'hdlcoderui.hdlconfigs');
    hCFGDialogObj.selTableIndex = r;
