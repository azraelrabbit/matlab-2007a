function dlgstruct = getDialogSchema(hDlgSrcObj, dialogTag)
    % 1 20
    % 2 20
    % 3 20
    % 4 20
    % 5 20
    % 6 20
    % 7 20
    % 8 20
    % 9 20
    % 10 20
    % 11 20
    % 12 20
    % 13 20
    % 14 20
    % 15 20
    % 16 20
    % 17 20
    % 18 20
    DefaultNameLocation = 1.0;
    % 20 22
    TableWidgetStruct = [];
    srcObjArray = hDlgSrcObj.TableRowSrcObj;
    size = numel(srcObjArray);
    % 24 29
    % 25 29
    % 26 29
    % 27 29
    for i=1.0:size
        % 29 33
        % 30 33
        % 31 33
        srcObjForThisRow = srcObjArray(i);
        % 33 37
        % 34 37
        % 35 37
        tagObjProp = 'SrcAttributeName';
        SA_AttributeName = struct('Type', {'edit'}, 'Tag', cellhorzcat(horzcat(tagObjProp, num2str(i))), 'Mode', cellhorzcat(true), 'ObjectProperty', cellhorzcat(tagObjProp), 'Source', cellhorzcat(srcObjForThisRow));
        % 38 46
        % 39 46
        % 40 46
        % 41 46
        % 42 46
        % 43 46
        % 44 46
        tagObjProp = 'SrcAttributeFrom';
        SA_AttributeFrom = struct('Type', {'combobox'}, 'Tag', cellhorzcat(horzcat(tagObjProp, num2str(i))), 'ObjectProperty', cellhorzcat(tagObjProp), 'Mode', cellhorzcat(true), 'DialogRefresh', {[1.0]}, 'Entries', cellhorzcat(ctranspose(srcObjForThisRow.getPropAllowedValues(tagObjProp))), 'Source', cellhorzcat(srcObjForThisRow));
        % 47 56
        % 48 56
        % 49 56
        % 50 56
        % 51 56
        % 52 56
        % 53 56
        % 54 56
        tagObjProp = 'SrcAttributeValue';
        en = not(isequal(srcObjForThisRow.SrcAttributeFrom, SA_AttributeFrom.Entries{2.0}));
        SA_AttributeValue = struct('Type', {'edit'}, 'Tag', cellhorzcat(horzcat(tagObjProp, num2str(i))), 'ObjectProperty', cellhorzcat(tagObjProp), 'Mode', cellhorzcat(true), 'Enabled', cellhorzcat(en), 'Source', cellhorzcat(srcObjForThisRow));
        % 58 66
        % 59 66
        % 60 66
        % 61 66
        % 62 66
        % 63 66
        % 64 66
        tagObjProp = 'SrcAttributeTreatAsVector';
        % 66 68
        SA_AttributeTreatAsVector = struct('Type', {'checkbox'}, 'Tag', cellhorzcat(horzcat(tagObjProp, num2str(i))), 'ObjectProperty', cellhorzcat(tagObjProp), 'Mode', cellhorzcat(true), 'Enabled', cellhorzcat(en), 'Source', cellhorzcat(srcObjForThisRow));
        % 68 76
        % 69 76
        % 70 76
        % 71 76
        % 72 76
        % 73 76
        % 74 76
        TableRow = cellhorzcat(SA_AttributeName, SA_AttributeFrom, SA_AttributeValue, SA_AttributeTreatAsVector);
        % 76 78
        TableWidgetStruct = vertcat(TableWidgetStruct, TableRow);
    end % for
    % 79 85
    % 80 85
    % 81 85
    % 82 85
    % 83 85
    TableColumnHeader = cellhorzcat(sprintf('Name'), sprintf('Value From'), sprintf('Value'), sprintf('Treat\nVector\nAs 1-D'));
    % 85 89
    % 86 89
    % 87 89
    TableColumnHeaderWidth = [8.0 8.0 14.0 6.0];
    TableColumnHeaderHeight = 4.0;
    % 90 92
    TableRowHeader = ctranspose(cellstr(horzcat(repmat('A', size, 1.0), num2str(ctranspose(1.0:size)))));
    TableRowHeaderWidth = 4.0;
    % 93 95
    AttributeTable = struct('Type', {'table'}, 'Tag', {'AttributeTable'}, 'Size', cellhorzcat(horzcat(size, 4.0)), 'Grid', cellhorzcat(true), 'DialogRefresh', {[1.0]}, 'HeaderVisibility', {[1.0,1.0]}, 'ColHeader', cellhorzcat(TableColumnHeader), 'RowHeader', cellhorzcat(TableRowHeader), 'ColumnCharacterWidth', cellhorzcat(TableColumnHeaderWidth), 'ColumnHeaderHeight', cellhorzcat(TableColumnHeaderHeight), 'RowHeaderWidth', cellhorzcat(TableRowHeaderWidth), 'Editable', cellhorzcat(true), 'ValueChangedCallback', cellhorzcat(@onValueChanged), 'CurrentItemChangedCallback', cellhorzcat(@onCurrentChanged), 'Data', cellhorzcat(TableWidgetStruct), 'SelectedRow', cellhorzcat(hDlgSrcObj.SelectedTableRow), 'Alignment', {[5.0]}, 'MinimumSize', {[400.0,200.0]});
    % 95 114
    % 96 114
    % 97 114
    % 98 114
    % 99 114
    % 100 114
    % 101 114
    % 102 114
    % 103 114
    % 104 114
    % 105 114
    % 106 114
    % 107 114
    % 108 114
    % 109 114
    % 110 114
    % 111 114
    % 112 114
    AttributeTableGroup.Name = '';
    AttributeTableGroup.Type = 'group';
    AttributeTableGroup.Items = cellhorzcat(AttributeTable);
    AttributeTableGroup.RowSpan = [1.0 4.0];
    AttributeTableGroup.ColSpan = [2.0 2.0];
    % 118 125
    % 119 125
    % 120 125
    % 121 125
    % 122 125
    % 123 125
    tagObjProp = 'AttributeCreate';
    vis = 1.0;
    % 126 128
    SA_AttributeCreate = struct('Type', {'checkbox'}, 'Name', {'Create attribute if not present'}, 'Tag', cellhorzcat(tagObjProp), 'ObjectProperty', cellhorzcat(tagObjProp), 'Mode', cellhorzcat(true), 'RowSpan', {[5.0,5.0]}, 'ColSpan', {[1.0,2.0]}, 'Visible', cellhorzcat(vis), 'Enabled', cellhorzcat(vis));
    % 128 142
    % 129 142
    % 130 142
    % 131 142
    % 132 142
    % 133 142
    % 134 142
    % 135 142
    % 136 142
    % 137 142
    % 138 142
    % 139 142
    % 140 142
    iconPath = fullfile(matlabroot, 'toolbox', 'shared', 'dastudio', 'resources');
    ButtonAddNewEntry = struct('FilePath', cellhorzcat(fullfile(iconPath, 'new.png')), 'Type', {'pushbutton'}, 'ToolTip', {'Add'}, 'Tag', {'add_new_line'}, 'ObjectMethod', {'buttonCallback'}, 'Source', cellhorzcat(hDlgSrcObj), 'MethodArgs', {{'%dialog','addNewEntry'}}, 'ArgDataTypes', {{'handle','string'}}, 'RowSpan', {[1.0,1.0]}, 'ColSpan', {[1.0,1.0]}, 'Mode', cellhorzcat(true), 'DialogRefresh', cellhorzcat(true));
    % 143 160
    % 144 160
    % 145 160
    % 146 160
    % 147 160
    % 148 160
    % 149 160
    % 150 160
    % 151 160
    % 152 160
    % 153 160
    % 154 160
    % 155 160
    % 156 160
    % 157 160
    % 158 160
    ButtonCopySelectedEntry = struct('FilePath', cellhorzcat(fullfile(iconPath, 'copy.png')), 'Type', {'pushbutton'}, 'ToolTip', {'Copy'}, 'Tag', {'copy_selected_line'}, 'ObjectMethod', {'buttonCallback'}, 'Source', cellhorzcat(hDlgSrcObj), 'MethodArgs', {{'%dialog','copySelectedEntry'}}, 'ArgDataTypes', {{'handle','string'}}, 'RowSpan', {[2.0,2.0]}, 'ColSpan', {[1.0,1.0]}, 'Mode', cellhorzcat(true), 'DialogRefresh', cellhorzcat(true));
    % 160 177
    % 161 177
    % 162 177
    % 163 177
    % 164 177
    % 165 177
    % 166 177
    % 167 177
    % 168 177
    % 169 177
    % 170 177
    % 171 177
    % 172 177
    % 173 177
    % 174 177
    % 175 177
    ButtonRemoveSelectedEntry = struct('FilePath', cellhorzcat(fullfile(iconPath, 'delete.png')), 'Type', {'pushbutton'}, 'ToolTip', {'Delete'}, 'Tag', {'remove_selected_line'}, 'ObjectMethod', {'buttonCallback'}, 'Source', cellhorzcat(hDlgSrcObj), 'MethodArgs', {{'%dialog','removeSelectedEntry'}}, 'ArgDataTypes', {{'handle','string'}}, 'RowSpan', {[3.0,3.0]}, 'ColSpan', {[1.0,1.0]}, 'Mode', cellhorzcat(true), 'DialogRefresh', cellhorzcat(true));
    % 177 190
    % 178 190
    % 179 190
    % 180 190
    % 181 190
    % 182 190
    % 183 190
    % 184 190
    % 185 190
    % 186 190
    % 187 190
    % 188 190
    EmptyTextWidget1 = struct('Type', {'text'}, 'Name', {''}, 'RowSpan', {[4.0,4.0]}, 'ColSpan', {[1.0,1.0]});
    % 190 198
    % 191 198
    % 192 198
    % 193 198
    % 194 198
    % 195 198
    % 196 198
    tab1.Name = 'Set Attribute';
    tab1.Items = cellhorzcat(ButtonAddNewEntry, ButtonRemoveSelectedEntry, ButtonCopySelectedEntry, AttributeTableGroup, EmptyTextWidget1, SA_AttributeCreate);
    tab1.LayoutGrid = [5.0 2.0];
    tab1.RowStretch = [0.0 0.0 0.0 1.0 0.0];
    tab1.ColStretch = [0.0 1.0];
    % 202 205
    % 203 205
    tagObjProp = 'StatNumberDeparted';
    % 205 207
    vis = 1.0;
    SA_StatCount = struct('Type', {'combobox'}, 'Name', {'Number of entities departed, #d:'}, 'Tag', cellhorzcat(tagObjProp), 'ObjectProperty', cellhorzcat(tagObjProp), 'DialogRefresh', {[1.0]}, 'Mode', {[1.0]}, 'Visible', cellhorzcat(vis), 'Enabled', cellhorzcat(vis), 'Entries', cellhorzcat(ctranspose(hDlgSrcObj.getPropAllowedValues(tagObjProp))), 'NameLocation', cellhorzcat(DefaultNameLocation));
    % 208 220
    % 209 220
    % 210 220
    % 211 220
    % 212 220
    % 213 220
    % 214 220
    % 215 220
    % 216 220
    % 217 220
    % 218 220
    tab2.Name = 'Statistics';
    tab2.Items = cellhorzcat(SA_StatCount);
    % 221 225
    % 222 225
    % 223 225
    tabcont.Type = 'tab';
    tabcont.Tabs = cellhorzcat(tab1, tab2);
    tabcont.RowSpan = [2.0 2.0];
    tabcont.ColSpan = [1.0 1.0];
    % 228 231
    % 229 231
    descriptionPane = desGetDescriptionPaneLocal(hDlgSrcObj.Block, hDlgSrcObj.Block.MaskDescription);
    descriptionPane.RowSpan = [1.0 1.0];
    descriptionPane.ColSpan = [1.0 1.0];
    % 233 236
    % 234 236
    idx = findstr(hDlgSrcObj.Block.Name, sprintf('\n'));
    blkName = hDlgSrcObj.Block.Name;
    % 237 239
    dlgstruct = struct('DialogTitle', cellhorzcat(horzcat('Block parameters: ', blkName)), 'HelpMethod', {'eval'}, 'HelpArgs', {{'helpview(simeventsbhelp)'}}, 'Items', cellhorzcat(cellhorzcat(descriptionPane, tabcont)), 'DialogTag', cellhorzcat(dialogTag), 'CloseMethod', {'closeCallback'}, 'CloseMethodArgs', {{'%dialog'}}, 'SmartApply', cellhorzcat(false), 'CloseMethodArgsDT', {{'handle'}}, 'PreApplyCallback', {'des_ddg_preApply'}, 'PreApplyArgs', {{'%source','%dialog'}}, 'PreApplyArgsDT', {'handle'}, 'LayoutGrid', {[2.0,1.0]}, 'RowStretch', {[0.0,1.0]});
    % 239 259
    % 240 259
    % 241 259
    % 242 259
    % 243 259
    % 244 259
    % 245 259
    % 246 259
    % 247 259
    % 248 259
    % 249 259
    % 250 259
    % 251 259
    % 252 259
    % 253 259
    % 254 259
    % 255 259
    % 256 259
    % 257 259
    [isLibrary, isLocked] = hDlgSrcObj.isLibraryBlock(hDlgSrcObj.Block);
    if isLibrary && isLocked
        dlgstruct.DisableDialog = 1.0;
        % 261 263
        return;
    end % if
    % 264 267
    % 265 267
    parenth = bdroot(hDlgSrcObj.Block.Handle);
    simStatus = get_param(parenth, 'SimulationStatus');
    if any(strcmp(simStatus, {'running','paused'}))
        dlgstruct = hDlgSrcObj.disableNontunables(dlgstruct);
    end % if
end % function
function descriptionPane = desGetDescriptionPaneLocal(block, text)
    % 273 283
    % 274 283
    % 275 283
    % 276 283
    % 277 283
    % 278 283
    % 279 283
    % 280 283
    % 281 283
    description.Type = 'text';
    description.Name = text;
    description.Tag = 'description';
    description.WordWrap = 1.0;
    % 286 288
    descriptionPane.Type = 'group';
    descriptionPane.Name = block.MaskType;
    descriptionPane.Tag = 'descriptionPane';
    descriptionPane.Items = cellhorzcat(description);
    descriptionPane.RowSpan = [1.0 1.0];
    descriptionPane.ColSpan = [1.0 1.0];
    descriptionPane.Tag = 'descriptionPane';
end % function
function onValueChanged(dlgHandle, rowNumber, columnNumber, widgetValue)
    % 296 308
    % 297 308
    % 298 308
    % 299 308
    % 300 308
    % 301 308
    % 302 308
    % 303 308
    % 304 308
    % 305 308
    % 306 308
    hObj = dlgHandle.getSource;
    % 308 310
    s = hObj.TableRowSrcObj(plus(rowNumber, 1.0));
    switch columnNumber
    case 0.0
        s.SrcAttributeName = widgetValue;
        AttributeNameString = des_set_pipestr(hObj.AttributeName, plus(rowNumber, 1.0), widgetValue);
        hObj.AttributeName = AttributeNameString;
    case 1.0
        pop_up_values = s.getPropAllowedValues('SrcAttributeFrom');
        s.SrcAttributeFrom = pop_up_values{plus(widgetValue, 1.0)};
        AttributeFromString = des_set_pipestr(hObj.AttributeFrom, plus(rowNumber, 1.0), pop_up_values{plus(widgetValue, 1.0)});
        hObj.AttributeFrom = AttributeFromString;
        dlgHandle.refresh;
    case 2.0
        s.SrcAttributeValue = widgetValue;
        AttributeValueString = des_set_pipestr(hObj.AttributeValue, plus(rowNumber, 1.0), widgetValue);
        hObj.AttributeValue = AttributeValueString;
    case 3.0
        s.SrcAttributeTreatAsVector = widgetValue;
        AttributeTreatAsVectorString = des_set_pipestr(hObj.AttributeTreatAsVector, plus(rowNumber, 1.0), num2str(widgetValue));
        hObj.AttributeTreatAsVector = AttributeTreatAsVectorString;
    otherwise
        error('Invalid column for value -changed callback of the attribute table');
    end % switch
end % function
function onCurrentChanged(dlgHandle, rowNumber, columnNumber)
    % 334 341
    % 335 341
    % 336 341
    % 337 341
    % 338 341
    % 339 341
    hObj = dlgHandle.getSource;
    % 341 343
    hObj.SelectedTableRow = rowNumber;
end % function
