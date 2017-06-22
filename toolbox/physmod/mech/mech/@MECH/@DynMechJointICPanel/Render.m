function [retVal, schema] = Render(hThis, schema)
    % 1 15
    % 2 15
    % 3 15
    % 4 15
    % 5 15
    % 6 15
    % 7 15
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    retVal = true;
    % 15 17
    tableInfo.Name = '';
    tableInfo.Type = 'table';
    tableInfo.Tag = horzcat(hThis.ObjId, '.', hThis.ParamName, '.Table');
    tableInfo.RowSpan = [1.0 1.0];
    tableInfo.ColSpan = [1.0 1.0];
    tableInfo.Mode = true;
    tableInfo.Source = hThis;
    tableInfo.ValueChangedCallback = @l_OnValueChangedCB;
    % 24 26
    tableInfo.Grid = true;
    tableInfo.HeaderVisibility = [0.0 1.0];
    tableInfo.ColHeader = cellhorzcat(xlate('Enable'), xlate('Primitive'), xlate('  Position'), xlate('Units'), xlate('  Velocity'), xlate('  Units'));
    % 28 36
    % 29 36
    % 30 36
    % 31 36
    % 32 36
    % 33 36
    % 34 36
    tableInfo.ReadOnlyColumns = 1.0;
    tableInfo.ColumnCharacterWidth = [5.0 8.0 12.0 5.0 12.0 8.0];
    tableInfo.Editable = true;
    % 38 40
    nStates = numel(hThis.StateList);
    nJointPrims = numel(hThis.AdjacentPrimitives);
    notConnected = eq(nJointPrims, 0.0);
    % 42 44
    if eq(nJointPrims, 0.0)
        tableInfo.Size = horzcat(nStates, 6.0);
        tableInfo.Editable = false;
    else
        tableInfo.Size = horzcat(nJointPrims, 6.0);
    end % if
    % 49 51
    hThis.Row2ItemMap = [];
    % 51 53
    stateData = {};
    rowIdx = 0.0;
    for idx=1.0:nStates
        hItem = hThis.StateList(idx);
        % 56 59
        % 57 59
        if not(notConnected)
            ansVect = ismember(hThis.AdjacentPrimitives, hItem.Name);
            if not(any(ansVect))
                continue;
            end % if
            rowIdx = plus(rowIdx, 1.0);
            % 64 67
            % 65 67
            if isempty(hThis.Row2ItemMap)
                hThis.Row2ItemMap = idx;
            else
                hThis.Row2ItemMap(plus(end, 1.0)) = idx;
            end % if
        else
            % 72 74
            rowIdx = plus(rowIdx, 1.0);
        end % if
        % 75 77
        if eq(hItem.Name(1.0), 'P') || eq(hItem.Name(1.0), 'R')
            enableVal.Type = 'checkbox';
            enableVal.Source = hThis.StateList(idx);
            enableVal.ObjectProperty = 'Enabled';
            enableVal.Mode = true;
            enableVal.Enabled = true;
        else
            % 83 85
            enableVal.Type = 'edit';
            enableVal.Source = hThis;
            enableVal.ObjectProperty = 'DummyProp';
            enableVal.Enabled = false;
        end % if
        % 89 91
        stateData{rowIdx, 1.0} = enableVal;
        % 91 94
        % 92 94
        stateData{rowIdx, 2.0} = hItem.Name;
        % 94 96
        if eq(hItem.Name(1.0), 'P') || eq(hItem.Name(1.0), 'R')
            % 96 98
            posVal.Type = 'edit';
            posVal.ObjectProperty = 'Position';
            posVal.Source = hItem;
            posVal.Mode = true;
            posVal.Enabled = true;
        else
            % 103 105
            posVal.Type = 'edit';
            posVal.Source = hThis;
            posVal.ObjectProperty = 'DummyProp';
            posVal.Enabled = false;
        end % if
        stateData{rowIdx, 3.0} = posVal;
        % 110 112
        switch hItem.Name(1.0)
        case 'P'
            % 113 115
            posUnitVal.Type = 'combobox';
            posUnitVal.ObjectProperty = 'PosUnit';
            posUnitVal.Source = hItem;
            posUnitVal.Mode = true;
            posUnitVal.Entries = hItem.PosUnitChoices;
            posUnitVal.Values = 1.0:length(hItem.PosUnitChoices);
        case 'R'
            % 121 123
            posUnitVal.Type = 'combobox';
            posUnitVal.ObjectProperty = 'AngUnit';
            posUnitVal.Source = hItem;
            posUnitVal.Mode = true;
            posUnitVal.Entries = hItem.AngUnitChoices;
            posUnitVal.Values = 1.0:length(hItem.AngUnitChoices);
        otherwise
            % 129 131
            posUnitVal.Type = 'edit';
            posUnitVal.Source = hThis;
            posUnitVal.ObjectProperty = 'DummyProp';
            posUnitVal.Enabled = false;
        end % switch
        stateData{rowIdx, 4.0} = posUnitVal;
        % 136 138
        if eq(hItem.Name(1.0), 'P') || eq(hItem.Name(1.0), 'R')
            % 138 140
            velVal.Type = 'edit';
            velVal.ObjectProperty = 'Velocity';
            velVal.Source = hItem;
            velVal.Mode = true;
        else
            % 144 146
            velVal.Type = 'edit';
            velVal.Source = hThis;
            velVal.ObjectProperty = 'DummyProp';
            velVal.Enabled = false;
        end % if
        stateData{rowIdx, 5.0} = velVal;
        % 151 153
        switch hItem.Name(1.0)
        case 'P'
            % 154 156
            velUnitVal.Type = 'combobox';
            velUnitVal.ObjectProperty = 'VelUnit';
            velUnitVal.Source = hItem;
            velUnitVal.Mode = true;
            velUnitVal.Entries = hItem.velUnitChoices;
            velUnitVal.Values = 1.0:length(hItem.velUnitChoices);
        case 'R'
            % 162 164
            velUnitVal.Type = 'combobox';
            velUnitVal.ObjectProperty = 'AngVelUnit';
            velUnitVal.Source = hItem;
            velUnitVal.Mode = true;
            velUnitVal.Entries = hItem.AngVelUnitChoices;
            velUnitVal.Values = 1.0:length(hItem.AngVelUnitChoices);
        otherwise
            % 170 172
            velUnitVal.Type = 'edit';
            velUnitVal.Source = hThis;
            velUnitVal.ObjectProperty = 'DummyProp';
            velUnitVal.Enabled = false;
        end % switch
        stateData{rowIdx, 6.0} = velUnitVal;
    end % for
    % 178 180
    tableInfo.Data = stateData;
    tableInfo.Enabled = hThis.EnableStatus;
    % 181 183
    tablePanel.Source = hThis;
    tablePanel.Name = '';
    tablePanel.Type = 'panel';
    tablePanel.LayoutGrid = [1.0 1.0];
    tablePanel.ColSpan = [1.0 1.0];
    tablePanel.RowSpan = [1.0 1.0];
    tablePanel.Items = cellhorzcat(tableInfo);
    % 189 191
    schema = tablePanel;
function l_OnValueChangedCB(dlg, row, col, value)
    % 192 206
    % 193 206
    % 194 206
    % 195 206
    % 196 206
    % 197 206
    % 198 206
    % 199 206
    % 200 206
    % 201 206
    % 202 206
    % 203 206
    % 204 206
    hMyDlgSrc = dlg.getDialogSource();
    hBldrObj = hMyDlgSrc.BuilderObj();
    matchList = hBldrObj.TagSearch('DynMechJointICPanel', 'Partial', 'First');
    if isempty(matchList)
        return;
    end % if
    % 211 213
    if isempty(matchList(1.0).Row2ItemMap) || gt(plus(row, 1.0), numel(matchList(1.0).Row2ItemMap))
        % 213 215
        return;
    end % if
    % 216 220
    % 217 220
    % 218 220
    mappedIdx = matchList(1.0).Row2ItemMap(plus(row, 1.0));
    % 220 223
    % 221 223
    if eq(matchList(1.0).StateList(mappedIdx).Name(1.0), 'S')
        return;
    end % if
    % 225 227
    isAngle = eq(matchList(1.0).StateList(mappedIdx).Name(1.0), 'R');
    % 227 229
    needsRefresh = false;
    % 229 231
    switch col
    case 0.0
        matchList(1.0).StateList(mappedIdx).Enabled = value;
    case 2.0
        matchList(1.0).StateList(mappedIdx).Position = value;
        % 235 238
        % 236 238
        if eq(matchList(1.0).StateList(mappedIdx).Enabled, false)
            matchList(1.0).StateList(mappedIdx).Enabled = true;
            lChangeEnableCheckBox(matchList(1.0), dlg, row, 0.0, '1');
        end % if
    case 3.0
        if isAngle
            matchList(1.0).StateList(mappedIdx).angUnit = value;
        else
            matchList(1.0).StateList(mappedIdx).PosUnit = value;
        end % if
    case 4.0
        % 248 250
        matchList(1.0).StateList(mappedIdx).Velocity = value;
        % 250 253
        % 251 253
        if eq(matchList(1.0).StateList(mappedIdx).Enabled, false)
            matchList(1.0).StateList(mappedIdx).Enabled = true;
            lChangeEnableCheckBox(matchList(1.0), dlg, row, 0.0, '1');
        end % if
    case 5.0
        if isAngle
            matchList(1.0).StateList(mappedIdx).angVelUnit = value;
        else
            matchList(1.0).StateList(mappedIdx).velUnit = value;
        end % if
    end % switch
    % 263 265
    if needsRefresh
        dlg.refresh();
    end % if
function lChangeEnableCheckBox(hObj, hDlg, row, col, valStr)
    % 268 272
    % 269 272
    % 270 272
    tablTag = horzcat(hObj.ObjId, '.', hObj.ParamName, '.Table');
    hDlg.setTableItemValue(tablTag, row, col, valStr);
