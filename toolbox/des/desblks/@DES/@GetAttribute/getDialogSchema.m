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
        GA_AttributeName = struct('Type', {'edit'}, 'Tag', cellhorzcat(horzcat(tagObjProp, num2str(i))), 'Mode', cellhorzcat(true), 'ObjectProperty', cellhorzcat(tagObjProp), 'Source', cellhorzcat(srcObjForThisRow));
        % 38 46
        % 39 46
        % 40 46
        % 41 46
        % 42 46
        % 43 46
        % 44 46
        tagObjProp = 'SrcAttributeMissing';
        GA_AttributeMissing = struct('Type', {'combobox'}, 'Tag', cellhorzcat(horzcat(tagObjProp, num2str(i))), 'ObjectProperty', cellhorzcat(tagObjProp), 'Mode', cellhorzcat(true), 'DialogRefresh', {[1.0]}, 'Entries', cellhorzcat(ctranspose(srcObjForThisRow.getPropAllowedValues(tagObjProp))), 'Source', cellhorzcat(srcObjForThisRow));
        % 47 56
        % 48 56
        % 49 56
        % 50 56
        % 51 56
        % 52 56
        % 53 56
        % 54 56
        tagObjProp = 'SrcAttributeDefaultValue';
        en = not(isequal(srcObjForThisRow.SrcAttributeMissing, GA_AttributeMissing.Entries{1.0}));
        GA_AttributeValue = struct('Type', {'edit'}, 'Tag', cellhorzcat(horzcat(tagObjProp, num2str(i))), 'ObjectProperty', cellhorzcat(tagObjProp), 'Mode', cellhorzcat(true), 'Enabled', cellhorzcat(en), 'Source', cellhorzcat(srcObjForThisRow));
        % 58 66
        % 59 66
        % 60 66
        % 61 66
        % 62 66
        % 63 66
        % 64 66
        tagObjProp = 'SrcAttributeTreatAsVector';
        % 66 68
        GA_AttributeTreatAsVector = struct('Type', {'checkbox'}, 'Tag', cellhorzcat(horzcat(tagObjProp, num2str(i))), 'ObjectProperty', cellhorzcat(tagObjProp), 'Mode', cellhorzcat(true), 'Enabled', cellhorzcat(en), 'Source', cellhorzcat(srcObjForThisRow));
        % 68 76
        % 69 76
        % 70 76
        % 71 76
        % 72 76
        % 73 76
        % 74 76
        tagObjProp = 'SrcAttributeSendTiming';
        GA_AttributeSendTiming = struct('Type', {'combobox'}, 'Tag', cellhorzcat(horzcat(tagObjProp, num2str(i))), 'ObjectProperty', cellhorzcat(tagObjProp), 'Mode', cellhorzcat(true), 'DialogRefresh', {[1.0]}, 'Entries', cellhorzcat(ctranspose(srcObjForThisRow.getPropAllowedValues(tagObjProp))), 'Source', cellhorzcat(srcObjForThisRow));
        % 77 86
        % 78 86
        % 79 86
        % 80 86
        % 81 86
        % 82 86
        % 83 86
        % 84 86
        TableRow = cellhorzcat(GA_AttributeName, GA_AttributeMissing, GA_AttributeValue, GA_AttributeTreatAsVector);
        % 86 88
        TableWidgetStruct = vertcat(TableWidgetStruct, TableRow);
    end % for
    % 89 95
    % 90 95
    % 91 95
    % 92 95
    % 93 95
    TableColumnHeader = cellhorzcat(sprintf('Name'), sprintf('When Attribute\nIs Missing'), sprintf('Default\nValue'), sprintf('Treat\nVector\nAs 1-D'));
    % 95 100
    % 96 100
    % 97 100
    % 98 100
    TableColumnHeaderWidth = [8.0 11.0 6.0 7.0];
    TableColumnHeaderHeight = 4.0;
    % 101 103
    TableRowHeader = ctranspose(cellstr(horzcat(repmat('A', size, 1.0), num2str(ctranspose(1.0:size)))));
    TableRowHeaderWidth = 3.0;
    % 104 106
    AttributeTable = struct('Type', {'table'}, 'Tag', {'AttributeTable'}, 'Size', cellhorzcat(horzcat(size, 4.0)), 'Grid', cellhorzcat(true), 'DialogRefresh', {[1.0]}, 'HeaderVisibility', {[1.0,1.0]}, 'ColHeader', cellhorzcat(TableColumnHeader), 'RowHeader', cellhorzcat(TableRowHeader), 'ColumnCharacterWidth', cellhorzcat(TableColumnHeaderWidth), 'ColumnHeaderHeight', cellhorzcat(TableColumnHeaderHeight), 'RowHeaderWidth', cellhorzcat(TableRowHeaderWidth), 'Editable', cellhorzcat(true), 'ValueChangedCallback', cellhorzcat(@onValueChanged), 'CurrentItemChangedCallback', cellhorzcat(@onCurrentChanged), 'Data', cellhorzcat(TableWidgetStruct), 'SelectedRow', cellhorzcat(hDlgSrcObj.SelectedTableRow), 'Alignment', {[5.0]}, 'MinimumSize', {[300.0,250.0]});
    % 106 125
    % 107 125
    % 108 125
    % 109 125
    % 110 125
    % 111 125
    % 112 125
    % 113 125
    % 114 125
    % 115 125
    % 116 125
    % 117 125
    % 118 125
    % 119 125
    % 120 125
    % 121 125
    % 122 125
    % 123 125
    AttributeTableGroup.Name = '';
    AttributeTableGroup.Type = 'group';
    AttributeTableGroup.Items = cellhorzcat(AttributeTable);
    AttributeTableGroup.RowSpan = [1.0 4.0];
    AttributeTableGroup.ColSpan = [2.0 2.0];
    % 129 135
    % 130 135
    % 131 135
    % 132 135
    % 133 135
    iconPath = fullfile(matlabroot, 'toolbox', 'shared', 'dastudio', 'resources');
    % 135 137
    ButtonAddNewEntry = struct('FilePath', cellhorzcat(fullfile(iconPath, 'new.png')), 'Type', {'pushbutton'}, 'ToolTip', {'Add'}, 'Tag', {'add_new_line'}, 'ObjectMethod', {'buttonCallback'}, 'Source', cellhorzcat(hDlgSrcObj), 'MethodArgs', {{'%dialog','addNewEntry'}}, 'ArgDataTypes', {{'handle','string'}}, 'RowSpan', {[1.0,1.0]}, 'ColSpan', {[1.0,1.0]}, 'Mode', cellhorzcat(true), 'DialogRefresh', cellhorzcat(true));
    % 137 154
    % 138 154
    % 139 154
    % 140 154
    % 141 154
    % 142 154
    % 143 154
    % 144 154
    % 145 154
    % 146 154
    % 147 154
    % 148 154
    % 149 154
    % 150 154
    % 151 154
    % 152 154
    ButtonCopySelectedEntry = struct('FilePath', cellhorzcat(fullfile(iconPath, 'copy.png')), 'Type', {'pushbutton'}, 'ToolTip', {'Copy'}, 'Tag', {'copy_selected_line'}, 'ObjectMethod', {'buttonCallback'}, 'Source', cellhorzcat(hDlgSrcObj), 'MethodArgs', {{'%dialog','copySelectedEntry'}}, 'ArgDataTypes', {{'handle','string'}}, 'RowSpan', {[2.0,2.0]}, 'ColSpan', {[1.0,1.0]}, 'Mode', cellhorzcat(true), 'DialogRefresh', cellhorzcat(true));
    % 154 171
    % 155 171
    % 156 171
    % 157 171
    % 158 171
    % 159 171
    % 160 171
    % 161 171
    % 162 171
    % 163 171
    % 164 171
    % 165 171
    % 166 171
    % 167 171
    % 168 171
    % 169 171
    ButtonRemoveSelectedEntry = struct('FilePath', cellhorzcat(fullfile(iconPath, 'delete.png')), 'Type', {'pushbutton'}, 'ToolTip', {'Delete'}, 'Tag', {'remove_selected_line'}, 'ObjectMethod', {'buttonCallback'}, 'Source', cellhorzcat(hDlgSrcObj), 'MethodArgs', {{'%dialog','removeSelectedEntry'}}, 'ArgDataTypes', {{'handle','string'}}, 'RowSpan', {[3.0,3.0]}, 'ColSpan', {[1.0,1.0]}, 'Mode', cellhorzcat(true), 'DialogRefresh', cellhorzcat(true));
    % 171 184
    % 172 184
    % 173 184
    % 174 184
    % 175 184
    % 176 184
    % 177 184
    % 178 184
    % 179 184
    % 180 184
    % 181 184
    % 182 184
    EmptyTextWidget1 = struct('Type', {'text'}, 'Name', {''}, 'RowSpan', {[4.0,4.0]}, 'ColSpan', {[1.0,1.0]});
    % 184 192
    % 185 192
    % 186 192
    % 187 192
    % 188 192
    % 189 192
    % 190 192
    tab1.Name = 'Get Attribute';
    tab1.Items = cellhorzcat(ButtonAddNewEntry, ButtonRemoveSelectedEntry, ButtonCopySelectedEntry, AttributeTableGroup);
    tab1.LayoutGrid = [4.0 2.0];
    tab1.RowStretch = [0.0 0.0 0.0 1.0];
    tab1.ColStretch = [0.0 1.0];
    % 196 201
    % 197 201
    % 198 201
    % 199 201
    tagObjProp = 'StatNumberDeparted';
    % 201 203
    vis = 1.0;
    GA_StatCount = struct('Type', {'combobox'}, 'Name', {'Number of entities departed, #d:'}, 'Tag', cellhorzcat(tagObjProp), 'ObjectProperty', cellhorzcat(tagObjProp), 'DialogRefresh', {[1.0]}, 'Mode', {[1.0]}, 'Visible', cellhorzcat(vis), 'Enabled', cellhorzcat(vis), 'Entries', cellhorzcat(ctranspose(hDlgSrcObj.getPropAllowedValues(tagObjProp))), 'NameLocation', cellhorzcat(DefaultNameLocation));
    % 204 216
    % 205 216
    % 206 216
    % 207 216
    % 208 216
    % 209 216
    % 210 216
    % 211 216
    % 212 216
    % 213 216
    % 214 216
    tab2.Name = 'Statistics';
    tab2.Items = cellhorzcat(GA_StatCount);
    % 217 221
    % 218 221
    % 219 221
    tabcont.Name = 'tabcont';
    tabcont.Type = 'tab';
    tabcont.Tabs = cellhorzcat(tab1, tab2);
    tabcont.RowSpan = [2.0 2.0];
    tabcont.ColSpan = [1.0 1.0];
    % 225 229
    % 226 229
    % 227 229
    descriptionPane = desGetDescriptionPaneLocal(hDlgSrcObj.Block, hDlgSrcObj.Block.MaskDescription);
    descriptionPane.RowSpan = [1.0 1.0];
    descriptionPane.ColSpan = [1.0 1.0];
    % 231 234
    % 232 234
    mainPane.Type = 'panel';
    mainPane.Name = '';
    mainPane.Items = cellhorzcat(descriptionPane, tabcont);
    mainPane.Tag = 'mainPane';
    mainPane.LayoutGrid = [2.0 1.0];
    mainPane.RowStretch = [0.0 1.0];
    % 239 243
    % 240 243
    % 241 243
    idx = findstr(hDlgSrcObj.Block.Name, sprintf('\n'));
    blkName = hDlgSrcObj.Block.Name;
    % 244 246
    dlgstruct = struct('DialogTitle', cellhorzcat(horzcat('Block parameters: ', blkName)), 'HelpMethod', {'eval'}, 'HelpArgs', {{'helpview(simeventsbhelp)'}}, 'Items', cellhorzcat(cellhorzcat(mainPane)), 'DialogTag', cellhorzcat(dialogTag), 'CloseMethod', {'closeCallback'}, 'CloseMethodArgs', {{'%dialog'}}, 'SmartApply', cellhorzcat(false), 'CloseMethodArgsDT', {{'handle'}}, 'PreApplyCallback', {'des_ddg_preApply'}, 'PreApplyArgs', {{'%source','%dialog'}}, 'PreApplyArgsDT', {'handle'});
    % 246 264
    % 247 264
    % 248 264
    % 249 264
    % 250 264
    % 251 264
    % 252 264
    % 253 264
    % 254 264
    % 255 264
    % 256 264
    % 257 264
    % 258 264
    % 259 264
    % 260 264
    % 261 264
    % 262 264
    [isLibrary, isLocked] = hDlgSrcObj.isLibraryBlock(hDlgSrcObj.Block);
    if isLibrary && isLocked
        dlgstruct.DisableDialog = 1.0;
        % 266 268
        return;
    end % if
    % 269 272
    % 270 272
    parenth = bdroot(hDlgSrcObj.Block.Handle);
    simStatus = get_param(parenth, 'SimulationStatus');
    if any(strcmp(simStatus, {'running','paused'}))
        dlgstruct = hDlgSrcObj.disableNontunables(dlgstruct);
    end % if
end % function
function descriptionPane = desGetDescriptionPaneLocal(block, text)
    % 278 288
    % 279 288
    % 280 288
    % 281 288
    % 282 288
    % 283 288
    % 284 288
    % 285 288
    % 286 288
    description.Type = 'text';
    description.Name = text;
    description.Tag = 'description';
    description.WordWrap = 1.0;
    descriptionPane.Type = 'group';
    descriptionPane.Name = block.MaskType;
    descriptionPane.Tag = 'descriptionPane';
    descriptionPane.Items = cellhorzcat(description);
    descriptionPane.RowSpan = [1.0 1.0];
    descriptionPane.ColSpan = [1.0 1.0];
    descriptionPane.Tag = 'descriptionPane';
end % function
function onValueChanged(dlgHandle, rowNumber, columnNumber, widgetValue)
    % 300 312
    % 301 312
    % 302 312
    % 303 312
    % 304 312
    % 305 312
    % 306 312
    % 307 312
    % 308 312
    % 309 312
    % 310 312
    hObj = dlgHandle.getSource;
    % 312 314
    s = hObj.TableRowSrcObj(plus(rowNumber, 1.0));
    switch columnNumber
    case 0.0
        s.SrcAttributeName = widgetValue;
        AttributeNameString = des_set_pipestr(hObj.AttributeName, plus(rowNumber, 1.0), widgetValue);
        hObj.AttributeName = AttributeNameString;
    case 1.0
        pop_up_values = s.getPropAllowedValues('SrcAttributeMissing');
        s.SrcAttributeMissing = pop_up_values{plus(widgetValue, 1.0)};
        AttributeMissingString = des_set_pipestr(hObj.AttributeMissing, plus(rowNumber, 1.0), pop_up_values{plus(widgetValue, 1.0)});
        hObj.AttributeMissing = AttributeMissingString;
        dlgHandle.refresh;
    case 2.0
        s.SrcAttributeDefaultValue = widgetValue;
        AttributeDefaultValueString = des_set_pipestr(hObj.AttributeDefaultValue, plus(rowNumber, 1.0), widgetValue);
        hObj.AttributeDefaultValue = AttributeDefaultValueString;
    case 3.0
        s.SrcAttributeTreatAsVector = widgetValue;
        AttributeTreatAsVectorString = des_set_pipestr(hObj.AttributeTreatAsVector, plus(rowNumber, 1.0), num2str(widgetValue));
        hObj.AttributeTreatAsVector = AttributeTreatAsVectorString;
    case 4.0
        pop_up_values = s.getPropAllowedValues('SrcAttributeSendTiming');
        s.SrcAttributeSendTiming = pop_up_values{plus(widgetValue, 1.0)};
        AttributeSendTimingString = des_set_pipestr(hObj.AttributeSendTiming, plus(rowNumber, 1.0), pop_up_values{plus(widgetValue, 1.0)});
        hObj.AttributeSendTiming = AttributeSendTimingString;
    otherwise
        error('Invalid column for value -changed callback of the attribute table');
    end % switch
end % function
function onCurrentChanged(dlgHandle, rowNumber, columnNumber)
    % 343 350
    % 344 350
    % 345 350
    % 346 350
    % 347 350
    % 348 350
    hObj = dlgHandle.getSource;
    % 350 352
    hObj.SelectedTableRow = rowNumber;
end % function
