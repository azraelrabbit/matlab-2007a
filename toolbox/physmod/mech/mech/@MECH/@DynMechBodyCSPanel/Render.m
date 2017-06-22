function [retVal, schema] = Render(hThis, schema)
    % 1 17
    % 2 17
    % 3 17
    % 4 17
    % 5 17
    % 6 17
    % 7 17
    % 8 17
    % 9 17
    % 10 17
    % 11 17
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    RunningOnAslrtw = false;
    % 17 19
    retVal = true;
    % 19 26
    % 20 26
    % 21 26
    % 22 26
    % 23 26
    % 24 26
    posBarSchema = l_getButtonBarSchema(hThis, 'Pos');
    rotBarSchema = l_getButtonBarSchema(hThis, 'Rot');
    % 27 30
    % 28 30
    posTbl = l_getPositionTableSchema(hThis, RunningOnAslrtw);
    % 30 33
    % 31 33
    orientTbl = l_getOrientationTableSchema(hThis, RunningOnAslrtw);
    % 33 38
    % 34 38
    % 35 38
    % 36 38
    posBarSchema.ColSpan = [2.0 2.0];
    posBarSchema.RowSpan = [1.0 1.0];
    posBarSchema.Alignment = 1.0;
    % 40 42
    rotBarSchema.ColSpan = [2.0 2.0];
    rotBarSchema.RowSpan = [1.0 1.0];
    rotBarSchema.Alignment = 1.0;
    % 44 46
    posTblPanel.Source = hThis;
    posTblPanel.Name = '';
    posTblPanel.Type = 'panel';
    posTblPanel.LayoutGrid = [1.0 1.0];
    posTblPanel.ColSpan = [1.0 1.0];
    posTblPanel.RowSpan = [1.0 1.0];
    posTblPanel.Items = cellhorzcat(posTbl);
    % 52 54
    orienTblPanel.Source = hThis;
    orienTblPanel.Name = '';
    orienTblPanel.Type = 'panel';
    orienTblPanel.LayoutGrid = [1.0 1.0];
    orienTblPanel.ColSpan = [1.0 1.0];
    orienTblPanel.RowSpan = [1.0 1.0];
    orienTblPanel.Items = cellhorzcat(orientTbl);
    % 60 65
    % 61 65
    % 62 65
    % 63 65
    posTab.Name = xlate('Position');
    posTab.LayoutGrid = [1.0 2.0];
    posTab.Items = cellhorzcat(posTblPanel, posBarSchema);
    % 67 69
    orienTab.Name = xlate('Orientation');
    orienTab.LayoutGrid = [1.0 2.0];
    orienTab.Items = cellhorzcat(orienTblPanel, rotBarSchema);
    % 71 73
    tabContainer.Name = 'tabContainer';
    tabContainer.Tag = horzcat(hThis.ObjId, '.BodyCSTabContainer');
    tabContainer.Type = 'tab';
    tabContainer.Source = hThis;
    tabContainer.Tabs = cellhorzcat(posTab, orienTab);
    tabContainer.RowSpan = [1.0 1.0];
    tabContainer.ColSpan = [1.0 1.0];
    tabContainer.ActiveTab = hThis.FocusTab;
    tabContainer.TabChangedCallback = 'mech_ontabchanged';
    % 81 86
    % 82 86
    % 83 86
    % 84 86
    schema = tabContainer;
end
function posTbl = l_getPositionTableSchema(hThis, RunningOnAslrtw)
    % 88 91
    % 89 91
    nFrames = numel(hThis.WorkFrames);
    % 91 93
    posTbl.Name = '';
    posTbl.Type = 'table';
    posTbl.Tag = horzcat(hThis.ObjId, '.', hThis.ParamName, '.Position.Table');
    posTbl.RowSpan = [1.0 1.0];
    posTbl.ColSpan = [1.0 1.0];
    posTbl.Mode = true;
    posTbl.Source = hThis;
    posTbl.ValueChangedCallback = @l_OnBodyPosValueChangedCB;
    posTbl.CurrentItemChangedCallback = @l_OnBodyPosFocusChangedCB;
    posTbl.Grid = true;
    posTbl.HeaderVisibility = [1.0 1.0];
    posTbl.Size = horzcat(nFrames, 7.0);
    posTbl.ColHeader = cellhorzcat(sprintf('Show\n Port'), sprintf('  Port\n  Side'), sprintf(' Name'), sprintf('Origin Position\n Vector [x y z]'), sprintf(' Units'), sprintf('Translated from\n     Origin of'), sprintf(' Components in\n     Axes of'));
    % 105 113
    % 106 113
    % 107 113
    % 108 113
    % 109 113
    % 110 113
    % 111 113
    posTbl.ColumnCharacterWidth = [4.0 6.0 4.0 12.0 5.0 12.0 11.0];
    posTbl.ColumnHeaderHeight = 2.0;
    posTbl.ReadOnlyColumns = 2.0;
    % 115 118
    % 116 118
    if RunningOnAslrtw
        posTbl.RowHeaderWidth = 3.0;
        posTbl.HeaderVisibility = [1.0 1.0];
    else
        posTbl.HeaderVisibility = [0.0 1.0];
    end
    posTbl.Editable = true;
    % 124 126
    data = {};
    hThis.nPortsShown = 0.0;
    for idx=1.0:nFrames
        hItem = hThis.WorkFrames(idx);
        % 129 132
        % 130 132
        chkShowPort.Type = 'checkbox';
        chkShowPort.ObjectProperty = 'ShowPort';
        chkShowPort.Source = hItem;
        data{idx, 1.0} = chkShowPort;
        % 135 138
        % 136 138
        if hItem.ShowPort
            hThis.nPortsShown = plus(hThis.nPortsShown, 1.0);
        end
        % 140 143
        % 141 143
        [comboEntries, comboVals] = lGetPortSideItemsAndDefault(hThis);
        cmbPortSide.Type = 'combobox';
        cmbPortSide.Entries = comboEntries;
        cmbPortSide.Values = comboVals;
        cmbPortSide.Value = lMapLRPortSideToCurrentOrientation(hItem.Port);
        data{idx, 2.0} = cmbPortSide;
        % 148 151
        % 149 151
        strName.Type = 'edit';
        strName.ObjectProperty = 'Name';
        strName.Source = hItem;
        data{idx, 3.0} = strName;
        % 154 157
        % 155 157
        strOriginPos.Type = 'edit';
        strOriginPos.ObjectProperty = 'Position';
        strOriginPos.Source = hItem;
        data{idx, 4.0} = strOriginPos;
        % 160 163
        % 161 163
        cmbUnits.Type = 'combobox';
        cmbUnits.ObjectProperty = 'PositionUnits';
        cmbUnits.Source = hItem;
        cmbUnits.Entries = hItem.PositionUnitsChoices;
        cmbUnits.Values = 1.0:length(hItem.PositionUnitsChoices);
        data{idx, 5.0} = cmbUnits;
        % 168 170
        comboEntries = [];
        comboVals = [];
        [comboEntries, comboVals] = hThis.GetRefFrameComboItems(idx);
        % 172 175
        % 173 175
        cmbOrigin.Type = 'combobox';
        cmbOrigin.Entries = comboEntries;
        cmbOrigin.Values = comboVals;
        cmbOrigin.Value = lMapCSRefStringToComboVal(hItem.PositionOrigin, hThis);
        data{idx, 6.0} = cmbOrigin;
        % 179 182
        % 180 182
        cmbAxes.Type = 'combobox';
        cmbAxes.Entries = comboEntries;
        cmbAxes.Values = comboVals;
        cmbAxes.Value = lMapCSRefStringToComboVal(hItem.PositionReference, hThis);
        data{idx, 7.0} = cmbAxes;
        % 186 188
    end % for
    % 188 190
    posTbl.Data = data;
    posTbl.SelectedRow = hThis.FocusItem(1.0);
    % 191 195
    % 192 195
    % 193 195
    posTbl.Enabled = hThis.EnableStatus;
    % 195 197
end
function orientTbl = l_getOrientationTableSchema(hThis, RunningOnAslrtw)
    % 198 200
    nFrames = numel(hThis.WorkFrames);
    % 200 202
    orientTbl.Name = '';
    orientTbl.Type = 'table';
    orientTbl.Tag = horzcat(hThis.ObjId, '.', hThis.ParamName, '.Orientation.Table');
    orientTbl.RowSpan = [1.0 1.0];
    orientTbl.ColSpan = [1.0 1.0];
    orientTbl.Mode = true;
    orientTbl.Source = hThis;
    orientTbl.ValueChangedCallback = @l_OnBodyOrientValueChangedCB;
    orientTbl.CurrentItemChangedCallback = @l_OnBodyOrientFocusChangedCB;
    orientTbl.Grid = true;
    orientTbl.HeaderVisibility = [1.0 1.0];
    orientTbl.Size = horzcat(nFrames, 7.0);
    orientTbl.RowHeader = {' ',' ',' '};
    orientTbl.ColHeader = cellhorzcat(sprintf('Show\n Port'), sprintf('  Port\n  Side'), sprintf(' Name'), sprintf('   Orientation\n      Vector'), sprintf(' Units'), sprintf('  Relative CS'), sprintf('Specified Using\n   Convention'));
    % 215 223
    % 216 223
    % 217 223
    % 218 223
    % 219 223
    % 220 223
    % 221 223
    if RunningOnAslrtw
        orientTbl.RowHeaderWidth = 3.0;
        orientTbl.HeaderVisibility = [1.0 1.0];
    else
        orientTbl.HeaderVisibility = [0.0 1.0];
    end
    orientTbl.ColumnCharacterWidth = [4.0 6.0 4.0 12.0 5.0 11.0 11.0];
    orientTbl.ColumnHeaderHeight = 2.0;
    orientTbl.ReadOnlyColumns = 2.0;
    % 231 233
    orientData = {};
    for idx=1.0:nFrames
        hItem = hThis.WorkFrames(idx);
        % 235 238
        % 236 238
        chkShowPort.Type = 'checkbox';
        chkShowPort.ObjectProperty = 'ShowPort';
        chkShowPort.Source = hItem;
        orientData{idx, 1.0} = chkShowPort;
        % 241 244
        % 242 244
        [comboEntries, comboVals] = lGetPortSideItemsAndDefault(hThis);
        cmbPortSide.Type = 'combobox';
        cmbPortSide.Entries = comboEntries;
        cmbPortSide.Values = comboVals;
        cmbPortSide.Value = lMapLRPortSideToCurrentOrientation(hItem.Port);
        orientData{idx, 2.0} = cmbPortSide;
        % 249 252
        % 250 252
        strName.Type = 'edit';
        strName.ObjectProperty = 'Name';
        strName.Source = hItem;
        orientData{idx, 3.0} = strName;
        % 255 258
        % 256 258
        strOriginOrient.Type = 'edit';
        strOriginOrient.ObjectProperty = 'Orientation';
        strOriginOrient.Source = hItem;
        orientData{idx, 4.0} = strOriginOrient;
        % 261 264
        % 262 264
        cmbOrientUnits.Type = 'combobox';
        cmbOrientUnits.ObjectProperty = 'OrientationUnits';
        cmbOrientUnits.Source = hItem;
        cmbOrientUnits.Entries = hItem.OrientationUnitsChoices;
        cmbOrientUnits.Values = 1.0:length(hItem.OrientationUnitsChoices);
        orientData{idx, 5.0} = cmbOrientUnits;
        % 269 272
        % 270 272
        comboEntries = [];
        comboVals = [];
        [comboEntries, comboVals] = hThis.GetRefFrameComboItems(idx);
        cmbOrigin.Type = 'combobox';
        cmbOrigin.Entries = comboEntries;
        cmbOrigin.Values = comboVals;
        cmbOrigin.Value = lMapCSRefStringToComboVal(hItem.OrientationFrame, hThis);
        orientData{idx, 6.0} = cmbOrigin;
        % 279 282
        % 280 282
        cmbOriginType.Type = 'combobox';
        cmbOriginType.ObjectProperty = 'OrientationType';
        cmbOriginType.Source = hItem;
        orientData{idx, 7.0} = cmbOriginType;
        % 285 287
    end % for
    % 287 289
    orientTbl.Editable = true;
    orientTbl.Data = orientData;
    orientTbl.SelectedRow = hThis.FocusItem(1.0);
    % 291 295
    % 292 295
    % 293 295
    orientTbl.Enabled = hThis.EnableStatus;
    % 295 297
end
function l_OnBodyPosValueChangedCB(dlg, row, col, value)
    % 298 308
    % 299 308
    % 300 308
    % 301 308
    % 302 308
    % 303 308
    % 304 308
    % 305 308
    % 306 308
    hObj = l_FindSrcObj(dlg);
    % 308 310
    if isempty(hObj)
        error('SynMechBodyCSPanel:l_OnValueChangedCB:NullSource', 'Unexpected Null widget source.');
        % 311 313
    end
    if lt(row, 0.0) || ge(row, numel(hObj.WorkFrames))
        error('SynMechBodyCSPanel:l_OnValueChangedCB:BadIndex', 'Row index does not agree with number of data elements.');
        % 315 317
    end
    % 317 319
    hItem = hObj.WorkFrames(plus(row, 1.0));
    switch col
    case 0.0
        % 321 325
        % 322 325
        % 323 325
        if eq(hItem.ShowPort, value)
            return
        end
        % 327 329
        hItem.ShowPort = value;
        % 329 332
        % 330 332
        syncVal = 'true';
        % 332 335
        % 333 335
        if value
            hObj.nPortsShown = plus(hObj.nPortsShown, 1.0);
        else
            if eq(hObj.nPortsShown, 1.0)
                beep;
                errordlg('Must have atleast one CS visible within Body.');
                tableTagName = horzcat(hObj.ObjId, '.', hObj.ParamName, '.Position.Table');
                dlg.setTableItemValue(tableTagName, int32(row), int32(0.0), 'true');
                hItem.ShowPort = true;
            else
                hObj.nPortsShown = minus(hObj.nPortsShown, 1.0);
                syncVal = 'false';
            end
        end
        % 348 351
        % 349 351
        tableTagName = horzcat(hObj.ObjId, '.', hObj.ParamName, '.Orientation.Table');
        dlg.setTableItemValue(tableTagName, int32(row), int32(0.0), syncVal);
    case 1.0
        % 353 355
        h = findtype('PortSideEnum');
        valStr = h.Strings{value};
        % 356 359
        % 357 359
        if strcmpi(hItem.Port, valStr)
            return
        end
        hItem.Port = h.Strings{value};
        % 362 365
        % 363 365
        tableTagName = horzcat(hObj.ObjId, '.', hObj.ParamName, '.Orientation.Table');
        dlg.setTableItemValue(tableTagName, int32(row), int32(1.0), valStr);
    case 3.0
        % 367 369
        hItem.Position = value;
    case 4.0
        % 370 372
        hItem.PositionUnits = value;
    case 5.0
        % 373 375
        refString = lMapComboValToCSRefString(value, hObj);
        hItem.PositionOrigin = refString;
        % 376 380
        % 377 380
        % 378 380
        hItem.PositionReference = refString;
        tableTagName = horzcat(hObj.ObjId, '.', hObj.ParamName, '.Position.Table');
        dlg.setTableItemValue(tableTagName, int32(row), int32(6.0), refString);
    case 6.0
        % 383 385
        refString = lMapComboValToCSRefString(value, hObj);
        hItem.PositionReference = refString;
    end
end
function l_OnBodyOrientValueChangedCB(dlg, row, col, value)
    % 389 399
    % 390 399
    % 391 399
    % 392 399
    % 393 399
    % 394 399
    % 395 399
    % 396 399
    % 397 399
    hObj = l_FindSrcObj(dlg);
    % 399 401
    if isempty(hObj)
        error('SynMechBodyCSPanel:l_OnBodyOrientValueChangedCB:NullSource', 'Unexpected Null widget source.');
        % 402 404
    end
    if lt(row, 0.0) || ge(row, numel(hObj.WorkFrames))
        error('SynMechBodyCSPanel:l_OnBodyOrientValueChangedCB:BadIndex', 'Row index does not agree with number of data elements.');
        % 406 408
    end
    % 408 410
    hItem = hObj.WorkFrames(plus(row, 1.0));
    switch col
    case 0.0
        % 412 416
        % 413 416
        % 414 416
        if eq(hItem.ShowPort, value)
            return
        end
        % 418 420
        hItem.ShowPort = value;
        % 420 423
        % 421 423
        syncVal = 'true';
        % 423 426
        % 424 426
        if value
            hObj.nPortsShown = plus(hObj.nPortsShown, 1.0);
        else
            if eq(hObj.nPortsShown, 1.0)
                beep;
                errordlg('Must have atleast one CS visible within Body.');
                tableTagName = horzcat(hObj.ObjId, '.', hObj.ParamName, '.Position.Table');
                dlg.setTableItemValue(tableTagName, int32(row), int32(0.0), 'true');
                hItem.ShowPort = true;
            else
                hObj.nPortsShown = minus(hObj.nPortsShown, 1.0);
                syncVal = 'false';
            end
        end
        % 439 442
        % 440 442
        tableTagName = horzcat(hObj.ObjId, '.', hObj.ParamName, '.Position.Table');
        dlg.setTableItemValue(tableTagName, int32(row), int32(0.0), syncVal);
    case 1.0
        % 444 446
        h = findtype('PortSideEnum');
        valStr = h.Strings{value};
        % 447 450
        % 448 450
        if strcmpi(hItem.Port, valStr)
            return
        end
        hItem.Port = valStr;
        % 453 456
        % 454 456
        tableTagName = horzcat(hObj.ObjId, '.', hObj.ParamName, '.Position.Table');
        dlg.setTableItemValue(tableTagName, int32(row), int32(1.0), valStr);
    case 3.0
        % 458 460
        hItem.Orientation = value;
    case 4.0
        % 461 463
        hItem.OrientationUnits = value;
    case 5.0
        % 464 466
        refString = lMapComboValToCSRefString(value, hObj);
        hItem.OrientationFrame = refString;
    case 6.0
        % 468 470
        h = findtype('OrientTypeEnum');
        hItem.OrientationType = h.Strings{plus(value, 1.0)};
    end
end
function barSchema = l_getButtonBarSchema(hThis, barTag)
    % 474 477
    % 475 477
    iconPath = fullfile(matlabroot, 'toolbox', 'physmod', 'pm_util', 'pm_util', 'dlg_resources');
    % 477 479
    AddButnTag = horzcat('AddButnTag', barTag);
    DelButnTag = horzcat('DelButnTag', barTag);
    UpButnTag = horzcat('UpButnTag', barTag);
    DownButnTag = horzcat('DownButnTag', barTag);
    % 482 485
    % 483 485
    hThis.(AddButnTag) = horzcat(hThis.ObjId, '.', hThis.ParamName, '.AddButton.', barTag);
    hThis.(DelButnTag) = horzcat(hThis.ObjId, '.', hThis.ParamName, '.DelButton.', barTag);
    hThis.(UpButnTag) = horzcat(hThis.ObjId, '.', hThis.ParamName, '.UpButton.', barTag);
    hThis.(DownButnTag) = horzcat(hThis.ObjId, '.', hThis.ParamName, '.DownButton.', barTag);
    % 488 491
    % 489 491
    butnStatus = hThis.GetSetButtonStatus();
    % 491 493
    newButn.FilePath = fullfile(iconPath, 'insert_row.png');
    newButn.Tag = hThis.(AddButnTag);
    newButn.Enabled = butnStatus(1.0).enabled;
    newButn.ToolTip = 'Add';
    newButn.Type = 'pushbutton';
    newButn.RowSpan = [1.0 1.0];
    newButn.ColSpan = [1.0 1.0];
    newButn.MinimumSize = [25.0 25.0];
    newButn.MaximumSize = [25.0 25.0];
    newButn.Source = hThis;
    newButn.ObjectMethod = 'OnAddButton';
    newButn.MethodArgs = {'%dialog','%source','%tag','%value'};
    newButn.ArgDataTypes = {'handle','handle','string','mxArray'};
    % 505 507
    delButn.FilePath = fullfile(iconPath, 'delete.png');
    delButn.Tag = hThis.(DelButnTag);
    delButn.Enabled = butnStatus(2.0).enabled;
    delButn.ToolTip = 'Delete';
    delButn.Type = 'pushbutton';
    delButn.RowSpan = [2.0 2.0];
    delButn.ColSpan = [1.0 1.0];
    delButn.MinimumSize = [25.0 25.0];
    delButn.MaximumSize = [25.0 25.0];
    delButn.Source = hThis;
    delButn.ObjectMethod = 'OnDelButton';
    delButn.MethodArgs = {'%dialog','%source','%tag','%value'};
    delButn.ArgDataTypes = {'handle','handle','string','mxArray'};
    % 519 521
    movUpButn.FilePath = fullfile(iconPath, 'arrow_move_up_lg.png');
    movUpButn.Tag = hThis.(UpButnTag);
    movUpButn.Enabled = butnStatus(3.0).enabled;
    movUpButn.ToolTip = 'Move Up';
    movUpButn.Type = 'pushbutton';
    movUpButn.RowSpan = [3.0 3.0];
    movUpButn.ColSpan = [1.0 1.0];
    movUpButn.MinimumSize = [25.0 25.0];
    movUpButn.MaximumSize = [25.0 25.0];
    movUpButn.Source = hThis;
    movUpButn.ObjectMethod = 'OnUpButton';
    movUpButn.MethodArgs = {'%dialog','%source','%tag','%value'};
    movUpButn.ArgDataTypes = {'handle','handle','string','mxArray'};
    % 533 535
    movDownButn.FilePath = fullfile(iconPath, 'arrow_move_down_lg.png');
    movDownButn.Tag = hThis.(DownButnTag);
    movDownButn.Enabled = butnStatus(4.0).enabled;
    movDownButn.ToolTip = 'Move Down';
    movDownButn.Type = 'pushbutton';
    movDownButn.RowSpan = [4.0 4.0];
    movDownButn.ColSpan = [1.0 1.0];
    movDownButn.MinimumSize = [25.0 25.0];
    movDownButn.MaximumSize = [25.0 25.0];
    movDownButn.Source = hThis;
    movDownButn.ObjectMethod = 'OnDownButton';
    movDownButn.MethodArgs = {'%dialog','%source','%tag','%value'};
    movDownButn.ArgDataTypes = {'handle','handle','string','mxArray'};
    % 547 549
    sub_butnBar.Type = 'panel';
    sub_butnBar.LayoutGrid = [4.0 1.0];
    sub_butnBar.Items = cellhorzcat(newButn, delButn, movUpButn, movDownButn);
    sub_butnBar.RowSpan = [1.0 1.0];
    sub_butnBar.ColSpan = [1.0 1.0];
    sub_butnBar.RowStretch = [0.0 0.0 0.0 0.0];
    barSchema = sub_butnBar;
end
function l_OnBodyPosFocusChangedCB(hDlg, iRow, iCol)
    % 557 559
    hObj = l_FindSrcObj(hDlg);
    if eq(hObj, 0.0)
        return
    end
    hObj.FocusItem = horzcat(iRow, iCol);
    % 563 576
    % 564 576
    % 565 576
    % 566 576
    % 567 576
    % 568 576
    % 569 576
    % 570 576
    % 571 576
    % 572 576
    % 573 576
    % 574 576
    hObj.GetSetButtonStatus(hDlg);
end
function l_OnBodyOrientFocusChangedCB(hDlg, iRow, iCol)
    % 578 580
    l_OnBodyPosFocusChangedCB(hDlg, iRow, iCol)
end
function hSrcObj = l_FindSrcObj(hDADlg)
    % 582 584
    hSrcObj = 0.0;
    hMyDlgSrc = hDADlg.getDialogSource();
    hBldrObj = hMyDlgSrc.BuilderObj();
    matchList = hBldrObj.TagSearch('DynMechBodyCSPanel', 'Partial', 'First');
    if isempty(matchList)
        return
    end
    hSrcObj = matchList(1.0);
end
function retStr = lMapComboValToCSRefString(value, hObj)
    % 593 601
    % 594 601
    % 595 601
    % 596 601
    % 597 601
    % 598 601
    % 599 601
    retStr = '';
    switch value
    case -2.0
        retStr = 'World';
    case -1.0
        retStr = 'Adjoining';
    otherwise
        retStr = hObj.WorkFrames(value).Name;
    end
end
function retVal = lMapCSRefStringToComboVal(refStr, hObj)
    % 611 618
    % 612 618
    % 613 618
    % 614 618
    % 615 618
    % 616 618
    retStr = '';
    switch lower(refStr)
    case {'world','inertial'}
        retVal = -2.0;
    case {'adjoining'}
        retVal = -1.0;
    otherwise
        retVal = -2.0;
        for idx=1.0:numel(hObj.WorkFrames)
            if strcmpi(hObj.WorkFrames(idx).Name, refStr)
                retVal = idx;
                break
            end
        end % for
    end
end
function [comboItems, comboVals] = lGetPortSideItemsAndDefault(hThis)
    % 634 639
    % 635 639
    % 636 639
    % 637 639
    hBlock = pm_getsl_dblhandle(hThis.BlockHandle);
    blkOrient = get_param(hBlock, 'Orientation');
    switch lower(blkOrient)
    case 'left'
        comboItems = {'Left','Right'};
        comboVals = [1.0 2.0];
    case 'right'
        comboItems = {'Left','Right'};
        comboVals = [2.0 1.0];
    case 'up'
        comboItems = {'Top','Bottom'};
        comboVals = [1.0 2.0];
    case 'down'
        comboItems = {'Top','Bottom'};
        comboVals = [2.0 1.0];
    otherwise
        comboItems = {'Left','Right'};
        comboVals = [1.0 2.0];
    end
end
function comboVal = lMapLRPortSideToCurrentOrientation(side)
    % 659 663
    % 660 663
    % 661 663
    h = findtype('PortSideEnum');
    comboVal = find(strcmpi(side, h.Strings));
    if isempty(comboVal)
        disp(xlate('Warning: Unexpected value in port side mapping.'));
        comboVal = -1.0;
    end
end
