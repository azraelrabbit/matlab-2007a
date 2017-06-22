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
    % 27 30
    % 28 30
    tableInfo.ColHeader = cellhorzcat(xlate('Primitive'), xlate('Enable'), sprintf('    Spring\n  Constant\n        k'), sprintf('    Damper\n   Constant\n          b'), sprintf('    Spring\n     Offset\n      x0'), sprintf('   Position\n     Units'), sprintf('   Velocity\n     Units'), sprintf('     Force/\n    Torque\n     Units'));
    % 30 39
    % 31 39
    % 32 39
    % 33 39
    % 34 39
    % 35 39
    % 36 39
    % 37 39
    tableInfo.ReadOnlyColumns = [0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0];
    tableInfo.ColumnCharacterWidth = [7.0 4.0 8.0 8.0 8.0 8.0 8.0 8.0];
    tableInfo.ColumnHeaderHeight = 3.0;
    tableInfo.Editable = true;
    % 42 44
    nStates = numel(hThis.StateList);
    nJointPrims = numel(hThis.AdjacentPrimitives);
    notConnected = eq(nJointPrims, 0.0);
    % 46 48
    if eq(nJointPrims, 0.0)
        tableInfo.Size = horzcat(nStates, 8.0);
        tableInfo.Editable = false;
    else
        tableInfo.Size = horzcat(nJointPrims, 8.0);
    end % if
    % 53 55
    hThis.Row2ItemMap = [];
    % 55 57
    stateData = {};
    rowIdx = 0.0;
    for idx=1.0:nStates
        hItem = hThis.StateList(idx);
        % 60 63
        % 61 63
        if not(notConnected)
            ansVect = ismember(hThis.AdjacentPrimitives, hItem.Name);
            if not(any(ansVect))
                continue;
            end % if
            rowIdx = plus(rowIdx, 1.0);
            % 68 71
            % 69 71
            if isempty(hThis.Row2ItemMap)
                hThis.Row2ItemMap = idx;
            else
                hThis.Row2ItemMap(plus(end, 1.0)) = idx;
            end % if
        else
            % 76 78
            rowIdx = plus(rowIdx, 1.0);
        end % if
        % 79 81
        if eq(hItem.Name(1.0), 'P') || eq(hItem.Name(1.0), 'R')
            enableVal.Type = 'checkbox';
            enableVal.Source = hThis.StateList(idx);
            enableVal.ObjectProperty = 'IsSet';
            enableVal.Mode = true;
            enableVal.Enabled = true;
        else
            % 87 89
            enableVal.Type = 'edit';
            enableVal.Source = hThis;
            enableVal.ObjectProperty = 'DummyProp';
            enableVal.Enabled = false;
        end % if
        stateData{rowIdx, 2.0} = enableVal;
        % 94 97
        % 95 97
        stateData{rowIdx, 1.0} = hItem.Name;
        % 97 99
        if eq(hItem.Name(1.0), 'P') || eq(hItem.Name(1.0), 'R')
            % 99 101
            spingVal.Type = 'edit';
            spingVal.ObjectProperty = 'Spring_k';
            spingVal.Source = hItem;
            spingVal.Mode = true;
            spingVal.Enabled = true;
            stateData{rowIdx, 3.0} = spingVal;
            % 106 109
            % 107 109
            dampVal.Type = 'edit';
            dampVal.ObjectProperty = 'Damper_b';
            dampVal.Source = hItem;
            dampVal.Mode = true;
            dampVal.Enabled = true;
            stateData{rowIdx, 4.0} = dampVal;
            % 114 117
            % 115 117
            offsetVal.Type = 'edit';
            offsetVal.ObjectProperty = 'Offset_x0';
            offsetVal.Source = hItem;
            offsetVal.Mode = true;
            offsetVal.Enabled = true;
            stateData{rowIdx, 5.0} = offsetVal;
        else
            % 123 126
            % 124 126
            dumbVal.Type = 'edit';
            dumbVal.Source = hThis;
            dumbVal.ObjectProperty = 'DummyProp';
            dumbVal.Enabled = false;
            % 129 131
            stateData{rowIdx, 3.0} = dumbVal;
            stateData{rowIdx, 4.0} = dumbVal;
            stateData{rowIdx, 5.0} = dumbVal;
        end % if
        % 134 136
        switch hItem.Name(1.0)
        case 'P'
            % 137 140
            % 138 140
            posUnitVal.Type = 'combobox';
            posUnitVal.ObjectProperty = 'PositionUnits';
            posUnitVal.Source = hItem;
            posUnitVal.Mode = true;
            posUnitVal.Enabled = true;
            posUnitVal.Entries = hItem.PositionUnitsChoices;
            posUnitVal.Values = 1.0:length(hItem.PositionUnitsChoices);
            stateData{rowIdx, 6.0} = posUnitVal;
            % 147 150
            % 148 150
            velUnitVal.Type = 'combobox';
            velUnitVal.ObjectProperty = 'VelocityUnits';
            velUnitVal.Source = hItem;
            velUnitVal.Mode = true;
            velUnitVal.Enabled = true;
            velUnitVal.Entries = hItem.VelocityUnitsChoices;
            velUnitVal.Values = 1.0:length(hItem.VelocityUnitsChoices);
            stateData{rowIdx, 7.0} = velUnitVal;
            % 157 160
            % 158 160
            forceUnitVal.Type = 'combobox';
            forceUnitVal.ObjectProperty = 'ForceUnits';
            forceUnitVal.Source = hItem;
            forceUnitVal.Mode = true;
            forceUnitVal.Enabled = true;
            forceUnitVal.Entries = hItem.ForceUnitsChoices;
            forceUnitVal.Values = 1.0:length(hItem.ForceUnitsChoices);
            stateData{rowIdx, 8.0} = forceUnitVal;
        case 'R'
            % 168 170
            posUnitVal.Type = 'combobox';
            posUnitVal.ObjectProperty = 'AngleUnits';
            posUnitVal.Source = hItem;
            posUnitVal.Mode = true;
            posUnitVal.Enabled = true;
            posUnitVal.Entries = hItem.AngleUnitsChoices;
            posUnitVal.Values = 1.0:length(hItem.AngleUnitsChoices);
            stateData{rowIdx, 6.0} = posUnitVal;
            % 177 180
            % 178 180
            velUnitVal.Type = 'combobox';
            velUnitVal.ObjectProperty = 'AngleVelocityUnits';
            velUnitVal.Source = hItem;
            velUnitVal.Mode = true;
            velUnitVal.Enabled = true;
            velUnitVal.Entries = hItem.AngleVelocityUnitsChoices;
            velUnitVal.Values = 1.0:length(hItem.AngleVelocityUnitsChoices);
            stateData{rowIdx, 7.0} = velUnitVal;
            % 187 190
            % 188 190
            forceUnitVal.Type = 'combobox';
            forceUnitVal.ObjectProperty = 'TorqueUnits';
            forceUnitVal.Source = hItem;
            forceUnitVal.Mode = true;
            forceUnitVal.Enabled = true;
            forceUnitVal.Entries = hItem.TorqueUnitsChoices;
            forceUnitVal.Values = 1.0:length(hItem.TorqueUnitsChoices);
            stateData{rowIdx, 8.0} = forceUnitVal;
        otherwise
            % 198 201
            % 199 201
            dumbVal.Type = 'edit';
            dumbVal.Source = hThis;
            dumbVal.ObjectProperty = 'DummyProp';
            dumbVal.Enabled = false;
            % 204 206
            stateData{rowIdx, 6.0} = dumbVal;
            stateData{rowIdx, 7.0} = dumbVal;
            stateData{rowIdx, 8.0} = dumbVal;
        end % switch
    end % for
    % 210 212
    tableInfo.Data = stateData;
    tableInfo.Enabled = hThis.EnableStatus;
    % 213 215
    tablePanel.Source = hThis;
    tablePanel.Name = '';
    tablePanel.Type = 'panel';
    tablePanel.LayoutGrid = [1.0 1.0];
    tablePanel.ColSpan = [1.0 1.0];
    tablePanel.RowSpan = [1.0 1.0];
    tablePanel.Items = cellhorzcat(tableInfo);
    % 221 223
    schema = tablePanel;
function l_OnValueChangedCB(dlg, row, col, value)
    % 224 235
    % 225 235
    % 226 235
    % 227 235
    % 228 235
    % 229 235
    % 230 235
    % 231 235
    % 232 235
    % 233 235
    hMyDlgSrc = dlg.getDialogSource();
    hBldrObj = hMyDlgSrc.BuilderObj();
    matchList = hBldrObj.TagSearch('DynMechJointSpringPanel', 'Partial', 'First');
    if isempty(matchList)
        return;
    end % if
    % 240 244
    % 241 244
    % 242 244
    mappedIdx = matchList(1.0).Row2ItemMap(plus(row, 1.0));
    % 244 247
    % 245 247
    if eq(matchList(1.0).StateList(mappedIdx).Name(1.0), 'S')
        return;
    end % if
    % 249 251
    isAngle = eq(matchList(1.0).StateList(mappedIdx).Name(1.0), 'R');
    % 251 253
    needsRefresh = false;
    isEnabled = logical(matchList(1.0).StateList(mappedIdx).IsSet);
    autoSetEnable = false;
    % 255 257
    switch col
    case 1.0
        matchList(1.0).StateList(mappedIdx).IsSet = value;
    case 2.0
        matchList(1.0).StateList(mappedIdx).Spring_k = value;
        autoSetEnable = not(isEnabled);
    case 3.0
        matchList(1.0).StateList(mappedIdx).Damper_b = value;
        autoSetEnable = not(isEnabled);
    case 4.0
        matchList(1.0).StateList(mappedIdx).Offset_x0 = value;
        autoSetEnable = not(isEnabled);
    case 5.0
        if isAngle
            matchList(1.0).StateList(mappedIdx).AngleUnits = value;
        else
            matchList(1.0).StateList(mappedIdx).PositionUnits = value;
        end % if
    case 6.0
        if isAngle
            matchList(1.0).StateList(mappedIdx).AngleVelocityUnits = value;
        else
            matchList(1.0).StateList(mappedIdx).VelocityUnits = value;
        end % if
    case 7.0
        if isAngle
            matchList(1.0).StateList(mappedIdx).TorqueUnits = value;
        else
            matchList(1.0).StateList(mappedIdx).ForceUnits = value;
        end % if
    end % switch
    % 287 290
    % 288 290
    if autoSetEnable
        matchList(1.0).StateList(mappedIdx).IsSet = true;
        lChangeEnableCheckBox(matchList(1.0), dlg, row, 1.0, '1');
        needsRefresh = false;
    end % if
    % 294 297
    % 295 297
    if needsRefresh
        dlg.refresh();
    end % if
function lChangeEnableCheckBox(hObj, hDlg, row, col, valStr)
    % 300 304
    % 301 304
    % 302 304
    tablTag = horzcat(hObj.ObjId, '.', hObj.ParamName, '.Table');
    hDlg.setTableItemValue(tablTag, row, col, valStr);
