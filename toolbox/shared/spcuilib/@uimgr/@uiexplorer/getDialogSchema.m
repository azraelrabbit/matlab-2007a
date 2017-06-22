function dlgstruct = getDialogSchema(hExpl, arg)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    [items, treeType] = getTreeNames(hExpl);
    % 10 13
    % 11 13
    pNode = hExpl.dialogSelection;
    % 13 16
    % 14 16
    [hNode, cellAddr] = getChildFromPath(hExpl, pNode);
    if isempty(hNode)
        hNode = hExpl.hItem;
    end % if
    % 19 22
    % 20 22
    if isempty(items)
        % 22 24
        tree.Type = 'editarea';
        tree.Enabled = false;
        tree.Value = '(Nothing to display.)';
        tree.Tag = 'tree';
        tree.RowSpan = [1.0 1.0];
        tree.ColSpan = [1.0 1.0];
    else
        % 30 33
        % 31 33
        tree.Name = 'Select item in hierarchy';
        tree.Type = 'tree';
        tree.Tag = 'tree';
        tree.TreeItems = items;
        tree.UserData = 'my_data';
        tree.ObjectMethod = 'handleButtons';
        tree.MethodArgs = {'Select'};
        tree.ArgDataTypes = {'string'};
        tree.Tunable = 1.0;
        tree.RowSpan = [1.0 1.0];
        tree.ColSpan = [1.0 1.0];
        % 43 46
        % 44 46
        tree.Mode = 1.0;
        % 46 49
        % 47 49
    end % if
    % 49 53
    % 50 53
    % 51 53
    cellAddrFmt.Type = 'edit';
    cellAddrFmt.Tag = 'Address';
    cellAddrFmt.ToolTip = sprintf('Copy for use with findchild, sync,\nand other methods requiring a text address.');
    cellAddrFmt.Name = 'Address:';
    cellAddrFmt.Value = cellAddr;
    cellAddrFmt.RowSpan = [2.0 2.0];
    cellAddrFmt.ColSpan = [1.0 1.0];
    % 59 63
    % 60 63
    % 61 63
    cellAddrFmt.Mode = 1.0;
    cellAddrFmt.DialogRefresh = 1.0;
    % 64 67
    % 65 67
    details = getDetails(hNode);
    details.RowSpan = [1.0 1.0];
    details.ColSpan = [1.0 1.0];
    % 69 72
    % 70 72
    opt.Type = 'togglepanel';
    opt.Name = 'Selection details';
    opt.LayoutGrid = [1.0 1.0];
    opt.RowSpan = [3.0 3.0];
    opt.ColSpan = [1.0 1.0];
    opt.Items = cellhorzcat(details);
    % 77 81
    % 78 81
    % 79 81
    wblank.Type = 'text';
    wblank.Name = '';
    wblank.RowSpan = [1.0 1.0];
    wblank.ColSpan = [1.0 1.0];
    wblank.MinimumSize = [100.0 42.0];
    wblank.Alignment = 3.0;
    % 86 88
    wrefresh.Type = 'pushbutton';
    wrefresh.Name = 'Refresh';
    wrefresh.Tag = 'pushRefresh';
    wrefresh.RowSpan = [1.0 1.0];
    wrefresh.ColSpan = [2.0 2.0];
    wrefresh.ObjectMethod = 'handleButtons';
    wrefresh.MethodArgs = {'Refresh'};
    wrefresh.ArgDataTypes = {'string'};
    wrefresh.Alignment = 3.0;
    % 96 98
    wclose.Type = 'pushbutton';
    wclose.Name = 'Close';
    wclose.Tag = 'pushClose';
    wclose.RowSpan = [1.0 1.0];
    wclose.ColSpan = [3.0 3.0];
    wclose.ObjectMethod = 'handleButtons';
    wclose.MethodArgs = {'Close'};
    wclose.ArgDataTypes = {'string'};
    wclose.Alignment = 3.0;
    % 106 108
    wbuttonpanel.Type = 'panel';
    wbuttonpanel.Name = 'buttonPanel';
    wbuttonpanel.Tag = 'buttonpanel';
    wbuttonpanel.LayoutGrid = [1.0 3.0];
    wbuttonpanel.RowSpan = [4.0 4.0];
    wbuttonpanel.ColSpan = [1.0 1.0];
    wbuttonpanel.Items = cellhorzcat(wblank, wrefresh, wclose);
    wbuttonpanel.RowStretch = 1.0;
    wbuttonpanel.ColStretch = [1.0 0.0 0.0];
    % 116 120
    % 117 120
    % 118 120
    dlgstruct.RowStretch = [1.0 0.0 0.0 0.0];
    dlgstruct.ColStretch = 1.0;
    dlgstruct.LayoutGrid = [4.0 1.0];
    dlgstruct.Items = cellhorzcat(tree, cellAddrFmt, opt, wbuttonpanel);
    dlgstruct.DisplayIcon = '\toolbox\shared\dastudio\resources\MatlabIcon.png';
    dlgstruct.DialogTitle = horzcat('Explore ', treeType, ' Hierarchy');
    dlgstruct.StandaloneButtonSet = {''};
end % function
function [s, t] = getTreeNames(h)
    % 128 133
    % 129 133
    % 130 133
    % 131 133
    if isHG(h.hItem)
        s = getTreeNames_hg(h.hItem);
        t = 'HG';
    else
        s = getTreeNames_uimgr(h.hItem);
        t = 'UIMGR';
    end % if
end % function
function y = isHG(hItem)
    % 141 143
    y = not(isa(hItem, 'uimgr.uiitem'));
end % function
function s = getTreeNames_hg(hParent)
    % 145 152
    % 146 152
    % 147 152
    % 148 152
    % 149 152
    % 150 152
    s = {};
    hChild = hParent;
    for i=1.0:numel(hChild)
        thisChild = hChild(i);
        % 155 159
        % 156 159
        % 157 159
        s{plus(end, 1.0)} = sprintf('%d:%s', i, get(thisChild, 'type'));
        % 159 163
        % 160 163
        % 161 163
        ch = flipud(get(thisChild, 'children'));
        if not(isempty(ch))
            s{plus(end, 1.0)} = getTreeNames_hg(ch);
        end % if
    end % for
end % function
function s = getTreeNames_uimgr(hParent)
    % 169 181
    % 170 181
    % 171 181
    % 172 181
    % 173 181
    % 174 181
    % 175 181
    % 176 181
    % 177 181
    % 178 181
    % 179 181
    s = {};
    hChild = hParent;
        while not(isempty(hChild))
        s{plus(end, 1.0)} = hChild.Name;
        if hChild.isGroup
            s{plus(end, 1.0)} = getTreeNames_uimgr(hChild.down);
        end % if
        hChild = hChild.right;
    end % while
end % function
function cAll = getDetails(this)
    % 191 201
    % 192 201
    % 193 201
    % 194 201
    % 195 201
    % 196 201
    % 197 201
    % 198 201
    % 199 201
    if isa(this, 'uimgr.uiitem') || isa(this, 'uimgr.uigroup')
        % 201 203
        infoStruct = GetCommonInfo_UIMGR(this);
    else
        % 204 206
        infoStruct = GetCommonInfo_HG(this);
    end % if
    % 207 213
    % 208 213
    % 209 213
    % 210 213
    % 211 213
    infoStruct = local_MergeGroups(infoStruct);
    infoStruct.Title = 'Details';
    % 214 218
    % 215 218
    % 216 218
    DDG_Group = {};
    Ngroups = numel(infoStruct);
    for i=1.0:Ngroups
        DDG_Group{1.0, i} = DDG2ColText(infoStruct(i).Title, infoStruct(i).Widgets, i);
        % 221 223
    end % for
    % 223 227
    % 224 227
    % 225 227
    cAll.Type = 'panel';
    cAll.Items = DDG_Group;
    cAll.LayoutGrid = horzcat(Ngroups, 1.0);
end % function
function group = local_MergeGroups(infoStruct)
    % 231 237
    % 232 237
    % 233 237
    % 234 237
    % 235 237
    w = {};
    for i=1.0:numel(infoStruct)
        w = vertcat(w, horzcat(infoStruct(i).Widgets));
    end % for
    group.Title = 'UIGroup Info';
    group.Widgets = w;
end % function
function common_group = GetCommonInfo_HG(this)
    % 244 248
    % 245 248
    % 246 248
    common_group.Title = 'Common';
    common_group.Widgets = vertcat(cellhorzcat('Type', get(this, 'Type')), cellhorzcat('Tag', get(this, 'Tag')), cellhorzcat('Visible', get(this, 'Visible')));
    % 249 257
    % 250 257
    % 251 257
    % 252 257
    % 253 257
    % 254 257
    % 255 257
    switch get(this, 'type')
    case 'figure'
        ext = cellhorzcat('Name', get(this, 'Name'));
    case 'uiflowcontainer'
        ext = vertcat(cellhorzcat('FlowDir', get(this, 'flowdir')), cellhorzcat('Margin', sprintf('%d', get(this, 'margin'))));
    case 'uigridcontainer'
        % 262 264
        ext = vertcat(cellhorzcat('GridSize', mat2str(get(this, 'gridsize'))), cellhorzcat('Margin', sprintf('%d', get(this, 'margin'))));
    case 'uimenu'
        % 265 267
        ext = cellhorzcat('Label', get(this, 'label'));
    case {'uipushtool','uitoggletool'}
        % 268 271
        % 269 271
        sz = sprintf('%dx', size(get(this, 'cdata')));
        ext = vertcat(cellhorzcat('Tooltip', get(this, 'tooltip')), cellhorzcat('CData', sz(1.0:minus(end, 1.0))));
    case 'image'
        % 273 277
        % 274 277
        % 275 277
        sz = sprintf('%dx', size(get(this, 'cdata')));
        ext = cellhorzcat('CData', sz(1.0:minus(end, 1.0)));
    case 'text'
        ext = cellhorzcat('String', get(this, 'string'));
    case 'uicontrol'
        ext = vertcat(cellhorzcat('Style', get(this, 'style')), cellhorzcat('Tooltip', get(this, 'tooltip')));
    otherwise
        % 283 285
        ext = {'',''};
    end % switch
    % 286 290
    % 287 290
    % 288 290
    MaxRows = 2.0;
    ExtRows = size(ext, 1.0);
    PadRows = minus(MaxRows, ExtRows);
    if ne(PadRows, 0.0)
        if lt(PadRows, 0.0)
            error('ASSERT: Increase MaxRows in uiexplorer to %d', ExtRows);
        end % if
        ext = vertcat(ext, repmat({'',''}, PadRows, 1.0));
    end % if
    % 298 301
    % 299 301
    common_group.Widgets = vertcat(horzcat(common_group.Widgets), ext);
end % function
function common_group = GetCommonInfo_UIMGR(this)
    % 303 308
    % 304 308
    % 305 308
    % 306 308
    if isempty(this.WidgetFcn)
        has_widget = 'no';
    else
        if isempty(this.hWidget) || not(ishandle(this.hWidget))
            has_widget = 'yes (unrendered)';
        else
            has_widget = 'yes (rendered)';
        end % if
    end % if
    % 316 319
    % 317 319
    if isempty(this.SyncList)
        % 319 321
        sync = '';
    else
        sync = '';
        hSync = this.SyncList;
        N = numel(hSync.Fcn);
        if gt(N, 0.0)
            for i=1.0:N
                sync = horzcat(sync, hSync.DstName{i});
                if lt(i, N)
                    sync = horzcat(sync, ',');
                end % if
            end % for
            if gt(N, 1.0)
                sync = sprintf('[%s]', sync);
            end % if
        end % if
    end % if
    if this.isGroup
        sc = this.SelectionConstraint;
    else
        sc = '';
    end % if
    % 342 345
    % 343 345
    pStr = num2str(this.ActualPlacement);
    if this.AutoPlacement
        pType = ' (auto)';
    else
        pType = ' (manual)';
    end % if
    pStr = horzcat(pStr, pType);
    % 351 354
    % 352 354
    SepVisEna = sprintf('%s/%s/%s', this.Separator, this.Visible, this.Enable);
    % 354 357
    % 355 357
    common_group.Title = 'Common';
    common_group.Widgets = vertcat(cellhorzcat('Name', sprintf('%s', this.Name)), cellhorzcat('Class', class(this)), cellhorzcat('Widget', has_widget), cellhorzcat('Placement', pStr), cellhorzcat('Sep/Vis/Ena', SepVisEna), cellhorzcat('SyncList', sync), cellhorzcat('Constraint', sc), cellhorzcat('StateProp', this.StateName));
    % 358 366
    % 359 366
    % 360 366
    % 361 366
    % 362 366
    % 363 366
    % 364 366
end % function
function grp = DDG2ColText(groupName, entries, grpIdx)
    % 367 382
    % 368 382
    % 369 382
    % 370 382
    % 371 382
    % 372 382
    % 373 382
    % 374 382
    % 375 382
    % 376 382
    % 377 382
    % 378 382
    % 379 382
    % 380 382
    numEntries = size(entries, 1.0);
    allW = {};
    for i=1.0:numEntries
        % 384 393
        % 385 393
        % 386 393
        % 387 393
        % 388 393
        % 389 393
        % 390 393
        % 391 393
        if isempty(entries{i, 1.0})
            sepStr = '';
        else
            sepStr = ':';
        end % if
        % 397 400
        % 398 400
        w.Type = 'text';
        w.Name = horzcat(entries{i, 1.0}, sepStr);
        w.Alignment = 6.0;
        w.Bold = 1.0;
        w.RowSpan = horzcat(i, i);
        w.ColSpan = [1.0 1.0];
        allW = horzcat(allW, w);
        % 406 409
        % 407 409
        w.Type = 'text';
        w.Name = horzcat('  ', entries{i, 2.0});
        w.Alignment = 4.0;
        w.Bold = 0.0;
        w.RowSpan = horzcat(i, i);
        w.ColSpan = [2.0 2.0];
        allW = horzcat(allW, w);
    end % for
    % 416 420
    % 417 420
    % 418 420
    grp.Type = 'group';
    grp.Name = groupName;
    grp.Items = allW;
    grp.LayoutGrid = horzcat(numEntries, 2.0);
    grp.RowSpan = horzcat(grpIdx, grpIdx);
    grp.ColSpan = [1.0 1.0];
end % function
function [hChild, cellStr] = getChildFromPath(hExpl, treeNodeStr)
    % 427 436
    % 428 436
    % 429 436
    % 430 436
    % 431 436
    % 432 436
    % 433 436
    % 434 436
    this = hExpl.hItem;
    % 436 438
    if isempty(treeNodeStr)
        hChild = [];
        % 439 441
        cellStr = getChildFromCellStr('');
    else
        if isHG(hExpl.hItem)
            % 443 447
            % 444 447
            % 445 447
            r = textscan(treeNodeStr, '%s', 'delimiter', '/');
            r = r{1.0};
            % 448 450
            for i=1.0:numel(r)
                v(i) = sscanf(r{i}, '%d');
            end % for
            cellStr = mat2str(v);
            hChild = findchild_hg(this, v);
        else
            % 455 457
            r = textscan(treeNodeStr, '%s', 'delimiter', '/');
            % 457 460
            % 458 460
            r = r{1.0};
            cellStr = getChildFromCellStr(r);
            % 461 467
            % 462 467
            % 463 467
            % 464 467
            % 465 467
            N = numel(r);
            if lt(N, 2.0)
                hChild = [];
            else
                hChild = this.findchild(r{2.0:end});
            end % if
        end % if
    end % if
end % function
function hChild = findchild_hg(this, v)
    % 476 482
    % 477 482
    % 478 482
    % 479 482
    % 480 482
    hChild = this;
    if isempty(v)
        return;
    end % if
    hChild = hChild(v(1.0));
    v = v(2.0:end);
        while not(isempty(v))
        hChild = flipud(get(hChild, 'children'));
        hChild = hChild(v(1.0));
        v = v(2.0:end);
    end % while
end % function
function cellStr = getChildFromCellStr(r)
    % 494 500
    % 495 500
    % 496 500
    % 497 500
    % 498 500
    childNameStyle = 1.0;
    if eq(childNameStyle, 1.0)
        cellStr = getChildFromCellStr_path(r);
    else
        cellStr = getChildFromCellStr_address(r);
    end % if
end % function
function p = getChildFromCellStr_path(r)
    % 507 514
    % 508 514
    % 509 514
    % 510 514
    % 511 514
    % 512 514
    if isempty(r)
        p = '''''';
    else
        p = sprintf('%s/', r{:});
        if isempty(p)
            % 518 520
            p = '''''';
        else
            % 521 523
            p = horzcat('''', p(1.0:minus(end, 1.0)), '''');
        end % if
    end % if
end % function
function cellStr = getChildFromCellStr_address(r)
    % 527 541
    % 528 541
    % 529 541
    % 530 541
    % 531 541
    % 532 541
    % 533 541
    % 534 541
    % 535 541
    % 536 541
    % 537 541
    % 538 541
    % 539 541
    N = numel(r);
    cellStr = '{';
    for i=2.0:N
        cellStr = horzcat(cellStr, '''', r{i}, '''');
        if lt(i, N)
            cellStr = horzcat(cellStr, ',');
        end % if
    end % for
    cellStr = horzcat(cellStr, '}');
end % function
