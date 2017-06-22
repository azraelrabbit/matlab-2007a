function dlgStruct = getDialogSchema(this, dummy)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    description.Type = 'text';
    description.Name = this.Block.MaskDescription;
    description.Tag = 'description';
    description.WordWrap = 1.0;
    % 15 17
    descriptionPane = this.getContainerWidgetBase('group', this.Block.MaskType, 'descriptionPane');
    % 17 19
    descriptionPane.Items = cellhorzcat(description);
    descriptionPane.RowSpan = [1.0 1.0];
    descriptionPane.ColSpan = [1.0 1.0];
    % 21 27
    % 22 27
    % 23 27
    % 24 27
    % 25 27
    list = this.getLeafWidgetBase('listbox', this.getPortTitle('all'), 'PortList', this);
    % 27 29
    if this.DisableList
        list.Entries = {''};
    else
        list.Entries = this.getPortListData;
    end % if
    list.Graphical = true;
    list.MultiSelect = false;
    list.ObjectMethod = 'handleListSelection';
    list.MethodArgs = {'port','%value'};
    list.ArgDataTypes = {'string','mxArray'};
    list.FontFamily = 'Courier';
    list.RowSpan = [1.0 1.0];
    list.ColSpan = [1.0 5.0];
    list.DialogRefresh = 1.0;
    % 42 44
    if gt(this.CurPortRow, 0.0)
        list.Value = minus(this.CurPortRow, 1.0);
    end % if
    % 46 49
    % 47 49
    autoPopulate.Type = 'pushbutton';
    autoPopulate.Name = 'Auto Fill';
    autoPopulate.ObjectMethod = 'autoPopulate';
    autoPopulate.MethodArgs = {'%dialog'};
    autoPopulate.ArgDataTypes = {'handle'};
    autoPopulate.DialogRefresh = 1.0;
    autoPopulate.Mode = 1.0;
    autoPopulate.RowSpan = [1.0 1.0];
    % 56 59
    % 57 59
    addPort.Type = 'pushbutton';
    addPort.Name = 'New';
    addPort.ObjectMethod = 'addPortRow';
    addPort.MethodArgs = {'%dialog'};
    addPort.ArgDataTypes = {'handle'};
    addPort.DialogRefresh = 1.0;
    addPort.Mode = 1.0;
    addPort.RowSpan = [2.0 2.0];
    if gt(this.CurPortRow, 0.0)
        addPort.Enabled = 1.0;
    else
        addPort.Enabled = 0.0;
    end % if
    % 71 73
    deletePort.Type = 'pushbutton';
    deletePort.Name = 'Delete';
    deletePort.ObjectMethod = 'deletePortRow';
    deletePort.MethodArgs = {'%dialog'};
    deletePort.ArgDataTypes = {'handle'};
    deletePort.DialogRefresh = 1.0;
    deletePort.Mode = 1.0;
    deletePort.RowSpan = [3.0 3.0];
    if gt(this.CurPortRow, 0.0) && gt(this.NumPortRows, 1.0)
        deletePort.Enabled = 1.0;
    else
        deletePort.Enabled = 0.0;
    end % if
    % 85 87
    movePortUp.Type = 'pushbutton';
    movePortUp.Name = 'Up';
    movePortUp.ObjectMethod = 'movePortRow';
    movePortUp.MethodArgs = {'up','%dialog'};
    movePortUp.ArgDataTypes = {'string','handle'};
    movePortUp.DialogRefresh = 1.0;
    movePortUp.Mode = 1.0;
    movePortUp.RowSpan = [4.0 4.0];
    if gt(this.CurPortRow, 1.0)
        movePortUp.Enabled = 1.0;
    else
        movePortUp.Enabled = 0.0;
    end % if
    % 99 101
    movePortDown.Type = 'pushbutton';
    movePortDown.Name = 'Down';
    movePortDown.ObjectMethod = 'movePortRow';
    movePortDown.MethodArgs = {'down','%dialog'};
    movePortDown.ArgDataTypes = {'string','handle'};
    movePortDown.DialogRefresh = 1.0;
    movePortDown.Mode = 1.0;
    movePortDown.RowSpan = [5.0 5.0];
    if gt(this.CurPortRow, 0.0) && lt(this.CurPortRow, this.NumPortRows)
        movePorDown.Enabled = 1.0;
    else
        movePortDown.Enabled = 0.0;
    end % if
    % 113 116
    % 114 116
    portButtonPane = this.getContainerWidgetBase('panel', '', 'portButtonPanel');
    portButtonPane.Items = cellhorzcat(autoPopulate, addPort, deletePort, movePortUp, movePortDown);
    portButtonPane.RowSpan = [1.0 1.0];
    portButtonPane.ColSpan = [6.0 6.0];
    portButtonPane.LayoutGrid = [6.0 1.0];
    portButtonPane.RowStretch = [0.0 0.0 0.0 0.0 0.0 1.0];
    % 121 124
    % 122 124
    portPathEdit = this.getLeafWidgetBase('edit', this.getPortTitle('path'), 'PortPathEdit', this, 'PortPathEdit');
    % 124 127
    % 125 127
    portPathEdit.RowSpan = [2.0 2.0];
    portPathEdit.ColSpan = [1.0 1.0];
    portPathEdit.FontFamily = 'Courier';
    portPathEdit.NameLocation = 2.0;
    portPathEdit.Mode = 1.0;
    portPathEdit.MinimumSize = [0.0 0.0];
    % 132 134
    portModeEdit = this.getLeafWidgetBase('combobox', this.getPortTitle('mode'), 'PortModeEdit', this, 'PortModeEdit');
    % 134 137
    % 135 137
    portModeEdit.Entries = {'Input','Output'};
    portModeEdit.RowSpan = [2.0 2.0];
    portModeEdit.ColSpan = [2.0 2.0];
    portModeEdit.FontFamily = 'Courier';
    portModeEdit.NameLocation = 2.0;
    portModeEdit.ObjectMethod = 'twiddlePortTimeEdit';
    portModeEdit.MethodArgs = {'%dialog'};
    portModeEdit.ArgDataTypes = {'handle'};
    portModeEdit.Mode = 1.0;
    % 145 148
    % 146 148
    portTimeEdit = this.getLeafWidgetBase('edit', this.getPortTitle('time'), 'PortTimeEdit', this, 'PortTimeEdit');
    % 148 151
    % 149 151
    portTimeEdit.RowSpan = [2.0 2.0];
    portTimeEdit.ColSpan = [3.0 3.0];
    portTimeEdit.FontFamily = 'Courier';
    portTimeEdit.NameLocation = 2.0;
    portTimeEdit.Mode = 1.0;
    portTimeEdit.MinimumSize = [0.0 0.0];
    % 156 158
    portSignEdit = this.getLeafWidgetBase('combobox', this.getPortTitle('sign'), 'PortSignEdit', this, 'PortSignEdit');
    % 158 161
    % 159 161
    portSignEdit.Entries = ctranspose(set(this, 'PortSignEdit'));
    portSignEdit.RowSpan = [2.0 2.0];
    portSignEdit.ColSpan = [4.0 4.0];
    portSignEdit.FontFamily = 'Courier';
    portSignEdit.NameLocation = 2.0;
    portSignEdit.ObjectMethod = 'twiddlePortTimeEdit';
    portSignEdit.MethodArgs = {'%dialog'};
    portSignEdit.ArgDataTypes = {'handle'};
    portSignEdit.Mode = 1.0;
    % 169 172
    % 170 172
    portFracEdit = this.getLeafWidgetBase('edit', this.getPortTitle('frac'), 'PortFracEdit', this, 'PortFracEdit');
    % 172 175
    % 173 175
    portFracEdit.RowSpan = [2.0 2.0];
    portFracEdit.ColSpan = [5.0 5.0];
    portFracEdit.FontFamily = 'Courier';
    portFracEdit.NameLocation = 2.0;
    portFracEdit.Mode = 1.0;
    portFracEdit.MinimumSize = [0.0 0.0];
    % 180 183
    % 181 183
    portEditApply.Type = 'pushbutton';
    portEditApply.Name = 'Update';
    portEditApply.ObjectMethod = 'changePortRow';
    portEditApply.MethodArgs = {'%dialog'};
    portEditApply.ArgDataTypes = {'handle'};
    portEditApply.DialogRefresh = 1.0;
    portEditApply.Mode = 1.0;
    portEditApply.RowSpan = [2.0 2.0];
    portEditApply.ColSpan = [6.0 6.0];
    portEditApply.Alignment = 8.0;
    % 192 194
    if gt(this.CurPortRow, 0.0)
        if not(this.DisableList)
            [this.PortPathEdit, this.PortModeEdit, this.PortTimeEdit, this.PortSignEdit, this.PortFracEdit] = this.getPortEdits;
            % 196 198
        end % if
        portPathEdit.Enabled = 1.0;
        portModeEdit.Enabled = 1.0;
        switch this.PortModeEdit
        case 'Input'
            portTimeEdit.Enabled = 0.0;
            portSignEdit.Enabled = 0.0;
            portFracEdit.Enabled = 0.0;
        case 'Output'
            portTimeEdit.Enabled = 1.0;
            portSignEdit.Enabled = 1.0;
            if strcmp(this.PortSignEdit, 'Inherit')
                portFracEdit.Enabled = 0.0;
            else
                portFracEdit.Enabled = 1.0;
            end % if
        otherwise
            error('CoSim::getDialogSchema: invalid port mode');
        end % switch
        portEditApply.Enabled = 1.0;
    else
        portPathEdit.Enabled = 0.0;
        portModeEdit.Enabled = 0.0;
        portTimeEdit.Enabled = 0.0;
        portSignEdit.Enabled = 0.0;
        portFracEdit.Enabled = 0.0;
        portEditApply.Enabled = 0.0;
    end % if
    % 225 227
    items = cellhorzcat(list, portButtonPane, portPathEdit, portModeEdit, portTimeEdit, portSignEdit, portFracEdit, portEditApply);
    % 227 232
    % 228 232
    % 229 232
    % 230 232
    portPathHolder = this.getLeafWidgetBase('edit', '', 'PortPaths', 0.0, 'PortPaths');
    % 232 234
    portPathHolder.Visible = 0.0;
    % 234 236
    portModeHolder = this.getLeafWidgetBase('edit', '', 'PortModes', 0.0, 'PortModes');
    % 236 238
    portModeHolder.Visible = 0.0;
    % 238 240
    portTimeHolder = this.getLeafWidgetBase('edit', '', 'PortTimes', 0.0, 'PortTimes');
    % 240 242
    portTimeHolder.Visible = 0.0;
    % 242 244
    portSignHolder = this.getLeafWidgetBase('edit', '', 'PortSigns', 0.0, 'PortSigns');
    % 244 246
    portSignHolder.Visible = 0.0;
    % 246 248
    portFracHolder = this.getLeafWidgetBase('edit', '', 'PortFracLengths', 0.0, 'PortFracLengths');
    % 248 250
    portFracHolder.Visible = 0.0;
    % 250 252
    portCellArrayHolder = this.getLeafWidgetBase('edit', '', 'idxCellArray', 0.0, 'idxCellArray');
    % 252 254
    portCellArrayHolder.Visible = 0.0;
    % 254 256
    items = cat(2.0, items, cellhorzcat(portPathHolder, portModeHolder, portTimeHolder, portSignHolder, portFracHolder, portCellArrayHolder));
    % 256 260
    % 257 260
    % 258 260
    portsParamPane = this.getContainerWidgetBase('panel', '', 'portsParamPane');
    portsParamPane.Items = items;
    portsParamPane.LayoutGrid = [2.0 7.0];
    portsParamPane.ColStretch = [0.0 0.0 0.0 0.0 0.0 0.0 1.0];
    portsParamPane.RowStretch = [1.0 0.0];
    % 264 266
    portsPane = this.getContainerWidgetBase('panel', '', 'portsPane');
    portsPane.Items = cellhorzcat(portsParamPane);
    portsPane.LayoutGrid = [1.0 1.0];
    portsPane.RowStretch = 1.0;
    % 269 271
    portsTab.Name = 'Ports';
    portsTab.Items = cellhorzcat(portsPane);
    % 272 279
    % 273 279
    % 274 279
    % 275 279
    % 276 279
    % 277 279
    commLocal = this.getLeafWidgetBase('checkbox', 'the HDL simulator is running on this computer', 'CommLocal', this, 'CommLocal');
    % 279 282
    % 280 282
    commLocal.RowSpan = [1.0 1.0];
    commLocal.ColSpan = [1.0 1.0];
    commLocal.DialogRefresh = 1.0;
    % 284 287
    % 285 287
    commSharedMemory = this.getLeafWidgetBase('combobox', 'Connection method:', 'CommSharedMemory', this, 'CommSharedMemory');
    % 287 292
    % 288 292
    % 289 292
    % 290 292
    commSharedMemory.RowSpan = [2.0 2.0];
    commSharedMemory.ColSpan = [1.0 1.0];
    commSharedMemory.DialogRefresh = 1.0;
    commSharedMemory.Entries = ctranspose(set(this, 'CommSharedMemory'));
    if this.CommLocal
        commSharedMemory.Visible = 1.0;
    else
        commSharedMemory.Visible = 0.0;
    end % if
    % 300 303
    % 301 303
    commSharedMemoryNL = this.getLeafWidgetBase('combobox', 'Connection method:', 'CommSharedMemoryNL', 0.0);
    % 303 307
    % 304 307
    % 305 307
    commSharedMemoryNL.RowSpan = [2.0 2.0];
    commSharedMemoryNL.ColSpan = [1.0 1.0];
    commSharedMemoryNL.Entries = {'Socket'};
    commSharedMemoryNL.Enabled = 0.0;
    if this.CommLocal
        commSharedMemoryNL.Visible = 0.0;
    else
        commSharedMemoryNL.Visible = 1.0;
    end % if
    % 315 318
    % 316 318
    commHostName = this.getLeafWidgetBase('edit', 'Host name:', 'CommHostName', this, 'CommHostName');
    % 318 320
    commHostName.RowSpan = [3.0 3.0];
    commHostName.ColSpan = [1.0 1.0];
    if not(this.CommLocal)
        commHostName.Visible = 1.0;
    else
        commHostName.Visible = 0.0;
    end % if
    % 326 329
    % 327 329
    commHostNameLocal = this.getLeafWidgetBase('edit', 'Host name:', 'CommHostNameLocal', 0.0);
    % 329 331
    commHostNameLocal.RowSpan = [3.0 3.0];
    commHostNameLocal.ColSpan = [1.0 1.0];
    commHostNameLocal.Value = this.CommLocalHostName;
    commHostNameLocal.Enabled = 0.0;
    if this.CommLocal && strcmpi(this.CommSharedMemory, 'Socket')
        commHostNameLocal.Visible = 1.0;
    else
        commHostNameLocal.Visible = 0.0;
    end % if
    % 339 342
    % 340 342
    commPortNumber = this.getLeafWidgetBase('edit', 'Port number or service:', 'CommPortNumber', this, 'CommPortNumber');
    % 342 346
    % 343 346
    % 344 346
    commPortNumber.RowSpan = [4.0 4.0];
    commPortNumber.ColSpan = [1.0 1.0];
    % 347 350
    % 348 350
    if this.CommLocal && strcmpi(this.CommSharedMemory, 'Shared memory')
        commPortNumber.Visible = 0.0;
    else
        commPortNumber.Visible = 1.0;
    end % if
    % 354 357
    % 355 357
    commShowInfo = this.getLeafWidgetBase('checkbox', 'Show connection info on icon', 'CommShowInfo', this, 'CommShowInfo');
    % 357 360
    % 358 360
    commShowInfo.RowSpan = [6.0 6.0];
    commShowInfo.ColSpan = [1.0 1.0];
    % 361 364
    % 362 364
    cosimBypass = this.getLeafWidgetBase('radiobutton', 'Connection Mode', 'CosimBypass', this, 'CosimBypass');
    % 364 367
    % 365 367
    cosimBypass.Entries = {'Full Simulation','Confirm Interface Only','No Connection'};
    cosimBypass.RowSpan = [7.0 7.0];
    cosimBypass.ColSpan = [1.0 1.0];
    cosimBypass.ToolTip = sprintf('%s\n%s\n%s', 'Full Simulation: Confirm interface and run HDL simulation.', 'Confirm Interface Only: Check HDL simulator for proper signal names, dimensions, and datatypes, but do not run HDL simulation.', 'No Connection: Do not communicate with the HDL simulator.  The HDL simulator does not need to be started.');
    % 370 376
    % 371 376
    % 372 376
    % 373 376
    % 374 376
    commPane = this.getContainerWidgetBase('panel', '', 'commPane');
    commPane.Items = cellhorzcat(commLocal, commSharedMemory, commSharedMemoryNL, commHostName, commHostNameLocal, commPortNumber, commShowInfo, cosimBypass);
    % 377 381
    % 378 381
    % 379 381
    commPane.LayoutGrid = [7.0 1.0];
    commPane.RowStretch = [0.0 0.0 0.0 0.0 1.0 0.0];
    % 382 384
    commTab.Name = 'Connection';
    commTab.Items = cellhorzcat(commPane);
    % 385 391
    % 386 391
    % 387 391
    % 388 391
    % 389 391
    list = this.getLeafWidgetBase('listbox', this.getClockTitle('all'), 'ClockList', this);
    % 391 393
    if this.DisableList || eq(this.NumClockRows, 0.0)
        list.Entries = {''};
    else
        list.Entries = this.getClockListData;
    end % if
    list.Graphical = true;
    list.MultiSelect = false;
    list.ObjectMethod = 'handleListSelection';
    list.MethodArgs = {'clock','%value'};
    list.ArgDataTypes = {'string','mxArray'};
    list.FontFamily = 'Courier';
    list.RowSpan = [1.0 1.0];
    list.ColSpan = [1.0 3.0];
    list.DialogRefresh = 1.0;
    % 406 408
    if gt(this.CurClockRow, 0.0)
        list.Value = minus(this.CurClockRow, 1.0);
    end % if
    % 410 412
    addClock.Type = 'pushbutton';
    addClock.Name = 'New';
    addClock.ObjectMethod = 'addClockRow';
    addClock.MethodArgs = {'%dialog'};
    addClock.ArgDataTypes = {'handle'};
    addClock.DialogRefresh = 1.0;
    addClock.Mode = 1.0;
    addClock.RowSpan = [1.0 1.0];
    if gt(this.CurClockRow, 0.0) || eq(this.NumClockRows, 0.0)
        addClock.Enabled = 1.0;
    else
        addClock.Enabled = 0.0;
    end % if
    % 424 426
    deleteClock.Type = 'pushbutton';
    deleteClock.Name = 'Delete';
    deleteClock.ObjectMethod = 'deleteClockRow';
    deleteClock.MethodArgs = {'%dialog'};
    deleteClock.ArgDataTypes = {'handle'};
    deleteClock.DialogRefresh = 1.0;
    deleteClock.Mode = 1.0;
    deleteClock.RowSpan = [2.0 2.0];
    if gt(this.CurClockRow, 0.0)
        deleteClock.Enabled = 1.0;
    else
        deleteClock.Enabled = 0.0;
    end % if
    % 438 440
    moveClockUp.Type = 'pushbutton';
    moveClockUp.Name = 'Up';
    moveClockUp.ObjectMethod = 'moveClockRow';
    moveClockUp.MethodArgs = {'up','%dialog'};
    moveClockUp.ArgDataTypes = {'string','handle'};
    moveClockUp.DialogRefresh = 1.0;
    moveClockUp.Mode = 1.0;
    moveClockUp.RowSpan = [3.0 3.0];
    if gt(this.CurClockRow, 1.0)
        moveClockUp.Enabled = 1.0;
    else
        moveClockUp.Enabled = 0.0;
    end % if
    % 452 454
    moveClockDown.Type = 'pushbutton';
    moveClockDown.Name = 'Down';
    moveClockDown.ObjectMethod = 'moveClockRow';
    moveClockDown.MethodArgs = {'down','%dialog'};
    moveClockDown.ArgDataTypes = {'string','handle'};
    moveClockDown.DialogRefresh = 1.0;
    moveClockDown.Mode = 1.0;
    moveClockDown.RowSpan = [4.0 4.0];
    if gt(this.CurClockRow, 0.0) && lt(this.CurClockRow, this.NumClockRows)
        moveClockDown.Enabled = 1.0;
    else
        moveClockDown.Enabled = 0.0;
    end % if
    % 466 468
    clockButtonPane = this.getContainerWidgetBase('panel', '', 'clockButtonPanel');
    clockButtonPane.Items = cellhorzcat(addClock, deleteClock, moveClockUp, moveClockDown);
    clockButtonPane.RowSpan = [1.0 1.0];
    clockButtonPane.ColSpan = [4.0 4.0];
    clockButtonPane.LayoutGrid = [5.0 1.0];
    clockButtonPane.RowStretch = [0.0 0.0 0.0 0.0 1.0];
    % 473 476
    % 474 476
    clockPathEdit = this.getLeafWidgetBase('edit', this.getClockTitle('path'), 'ClockPathEdit', this, 'ClockPathEdit');
    % 476 479
    % 477 479
    clockPathEdit.RowSpan = [2.0 2.0];
    clockPathEdit.ColSpan = [1.0 1.0];
    clockPathEdit.FontFamily = 'Courier';
    clockPathEdit.NameLocation = 2.0;
    clockPathEdit.Mode = 1.0;
    % 483 485
    clockModeEdit = this.getLeafWidgetBase('combobox', this.getClockTitle('mode'), 'ClockModeEdit', this, 'ClockModeEdit');
    % 485 488
    % 486 488
    clockModeEdit.Entries = {'Falling','Rising'};
    clockModeEdit.RowSpan = [2.0 2.0];
    clockModeEdit.ColSpan = [2.0 2.0];
    clockModeEdit.FontFamily = 'Courier';
    clockModeEdit.NameLocation = 2.0;
    % 492 496
    % 493 496
    % 494 496
    clockModeEdit.Mode = 1.0;
    % 496 499
    % 497 499
    clockTimeEdit = this.getLeafWidgetBase('edit', this.getClockTitle('time'), 'ClockTimeEdit', this, 'ClockTimeEdit');
    % 499 502
    % 500 502
    clockTimeEdit.RowSpan = [2.0 2.0];
    clockTimeEdit.ColSpan = [3.0 3.0];
    clockTimeEdit.FontFamily = 'Courier';
    clockTimeEdit.NameLocation = 2.0;
    clockTimeEdit.Mode = 1.0;
    % 506 509
    % 507 509
    clockEditApply.Type = 'pushbutton';
    clockEditApply.Name = 'Update';
    clockEditApply.ObjectMethod = 'changeClockRow';
    clockEditApply.MethodArgs = {'%dialog'};
    clockEditApply.ArgDataTypes = {'handle'};
    clockEditApply.DialogRefresh = 1.0;
    clockEditApply.Mode = 1.0;
    clockEditApply.RowSpan = [2.0 2.0];
    clockEditApply.ColSpan = [4.0 4.0];
    clockEditApply.Alignment = 8.0;
    % 518 520
    if gt(this.CurClockRow, 0.0)
        if not(this.DisableList)
            [this.ClockPathEdit, this.ClockModeEdit, this.ClockTimeEdit] = this.getClockEdits;
            % 522 524
        end % if
        clockPathEdit.Enabled = 1.0;
        clockModeEdit.Enabled = 1.0;
        % 526 531
        % 527 531
        % 528 531
        % 529 531
        clockTimeEdit.Enabled = 1.0;
        clockEditApply.Enabled = 1.0;
    else
        clockPathEdit.Enabled = 0.0;
        clockModeEdit.Enabled = 0.0;
        clockTimeEdit.Enabled = 0.0;
        clockEditApply.Enabled = 0.0;
    end % if
    % 538 540
    items = cellhorzcat(list, clockButtonPane, clockPathEdit, clockModeEdit, clockTimeEdit, clockEditApply);
    % 540 545
    % 541 545
    % 542 545
    % 543 545
    clockPathHolder = this.getLeafWidgetBase('edit', '', 'ClockPaths', 0.0, 'ClockPaths');
    % 545 547
    clockPathHolder.Visible = 0.0;
    % 547 549
    clockModeHolder = this.getLeafWidgetBase('edit', '', 'ClockModes', 0.0, 'ClockModes');
    % 549 551
    clockModeHolder.Visible = 0.0;
    % 551 553
    clockTimeHolder = this.getLeafWidgetBase('edit', '', 'ClockTimes', 0.0, 'ClockTimes');
    % 553 555
    clockTimeHolder.Visible = 0.0;
    % 555 557
    items = cat(2.0, items, cellhorzcat(clockPathHolder, clockModeHolder, clockTimeHolder));
    % 557 561
    % 558 561
    % 559 561
    clocksParamPane = this.getContainerWidgetBase('panel', '', 'clocksParamPane');
    clocksParamPane.Items = items;
    clocksParamPane.LayoutGrid = [2.0 5.0];
    clocksParamPane.ColStretch = [0.0 0.0 0.0 0.0 1.0];
    clocksParamPane.RowStretch = [1.0 0.0];
    % 565 567
    clocksPane = this.getContainerWidgetBase('panel', '', 'clocksPane');
    clocksPane.Items = cellhorzcat(clocksParamPane);
    clocksPane.LayoutGrid = [1.0 1.0];
    clocksPane.RowStretch = 1.0;
    % 570 572
    clocksTab.Name = 'Clocks';
    clocksTab.Items = cellhorzcat(clocksPane);
    % 573 580
    % 574 580
    % 575 580
    % 576 580
    % 577 580
    % 578 580
    tclPreSimCommand = this.getLeafWidgetBase('editarea', 'Pre-simulation commands:', 'TclPreSimCommand', this, 'TclPreSimCommand');
    % 580 585
    % 581 585
    % 582 585
    % 583 585
    tclPreSimCommand.RowSpan = [1.0 1.0];
    tclPreSimCommand.ColSpan = [1.0 1.0];
    % 586 589
    % 587 589
    tclPostSimCommand = this.getLeafWidgetBase('editarea', 'Post-simulation commands:', 'TclPostSimCommand', this, 'TclPostSimCommand');
    % 589 594
    % 590 594
    % 591 594
    % 592 594
    tclPostSimCommand.RowSpan = [2.0 2.0];
    tclPostSimCommand.ColSpan = [1.0 1.0];
    % 595 597
    tclPane = this.getContainerWidgetBase('panel', '', 'tclPane');
    tclPane.Items = cellhorzcat(tclPreSimCommand, tclPostSimCommand);
    tclPane.LayoutGrid = [2.0 1.0];
    tclPane.RowStretch = [1.0 1.0];
    % 600 602
    tclTab.Name = 'Tcl';
    tclTab.Items = cellhorzcat(tclPane);
    % 603 610
    % 604 610
    % 605 610
    % 606 610
    % 607 610
    % 608 610
    dymmyrowLabel = this.getLeafWidgetBase('text', '', 'dymmyrowLabel', 0.0);
    % 610 614
    % 611 614
    % 612 614
    dymmyrowLabel.RowSpan = [1.0 1.0];
    dymmyrowLabel.ColSpan = [1.0 1.0];
    dymmyrowLabel.Alignment = 5.0;
    % 616 619
    % 617 619
    oneSecLabel = this.getLeafWidgetBase('text', '1 second in Simulink corresponds to', 'OneSecLabel', 0.0);
    % 619 623
    % 620 623
    % 621 623
    oneSecLabel.RowSpan = [2.0 2.0];
    oneSecLabel.ColSpan = [1.0 1.0];
    oneSecLabel.Alignment = 5.0;
    % 625 629
    % 626 629
    % 627 629
    timingScaleFactor = this.getLeafWidgetBase('edit', '', 'TimingScaleFactor', this, 'TimingScaleFactor');
    % 629 635
    % 630 635
    % 631 635
    % 632 635
    % 633 635
    timingScaleFactor.RowSpan = [2.0 2.0];
    timingScaleFactor.ColSpan = [2.0 2.0];
    timingScaleFactor.Alignment = 5.0;
    % 637 640
    % 638 640
    timingMode = this.getLeafWidgetBase('combobox', '', 'TimingMode', this, 'TimingMode');
    % 640 645
    % 641 645
    % 642 645
    % 643 645
    timingMode.Entries = transpose(set(this, 'TimingMode'));
    timingMode.RowSpan = [2.0 2.0];
    timingMode.ColSpan = [3.0 3.0];
    timingMode.Alignment = 5.0;
    % 648 650
    modLabel = this.getLeafWidgetBase('text', 'in the HDL simulator', 'modLabel', 0.0);
    % 650 654
    % 651 654
    % 652 654
    modLabel.RowSpan = [2.0 2.0];
    modLabel.ColSpan = [4.0 4.0];
    modLabel.Alignment = 5.0;
    % 656 658
    timingPane = this.getContainerWidgetBase('panel', '', 'timingPane');
    timingPane.Items = cellhorzcat(dymmyrowLabel, oneSecLabel, timingScaleFactor, timingMode, modLabel);
    % 659 665
    % 660 665
    % 661 665
    % 662 665
    % 663 665
    timingPane.LayoutGrid = [3.0 5.0];
    timingPane.RowStretch = [0.0 0.0 1.0];
    timingPane.ColStretch = [0.0 0.0 0.0 0.0 1.0];
    timingTab.Name = 'Timescales';
    timingTab.Items = cellhorzcat(timingPane);
    % 669 675
    % 670 675
    % 671 675
    % 672 675
    % 673 675
    tabbedPane = this.getContainerWidgetBase('tab', '', 'tabPane');
    tabbedPane.Tabs = cellhorzcat(portsTab, clocksTab, timingTab, commTab, tclTab);
    tabbedPane.RowSpan = [2.0 2.0];
    tabbedPane.ColSpan = [1.0 1.0];
    % 678 680
    tabbedPane.TabChangedCallback = 'cosimtabchange';
    % 680 686
    % 681 686
    % 682 686
    % 683 686
    % 684 686
    dirtyBox = this.getLeafWidgetBase('checkbox', '', 'DirtyWidget', 0.0);
    dirtyBox.Visible = 0.0;
    dirtyBox.RowSpan = [1.0 1.0];
    dirtyBox.ColSpan = [1.0 1.0];
    % 689 691
    mainPane = this.getContainerWidgetBase('panel', '', 'mainPane');
    mainPane.Items = cellhorzcat(descriptionPane, dirtyBox, tabbedPane);
    mainPane.Tag = 'mainPane';
    mainPane.LayoutGrid = [2.0 1.0];
    mainPane.RowStretch = [0.0 1.0];
    mainPane.RowSpan = [1.0 1.0];
    mainPane.ColSpan = [1.0 1.0];
    % 697 703
    % 698 703
    % 699 703
    % 700 703
    % 701 703
    title = this.Block.Name;
    % 703 705
    title(find(eq(double(title), 10.0))) = ' ';
    dlgStruct.DialogTitle = horzcat('Block Parameters: ', title);
    dlgStruct.HelpMethod = 'eval';
    dlgStruct.HelpArgs = cellhorzcat(this.Block.MaskHelp);
    dlgStruct.Items = cellhorzcat(mainPane);
    dlgStruct.DialogTag = this.Block.Name;
    dlgStruct.PreApplyMethod = 'preApply';
    dlgStruct.PreApplyArgs = {'%dialog'};
    dlgStruct.PreApplyArgsDT = {'handle'};
    dlgStruct.SmartApply = 0.0;
    dlgStruct.CloseMethod = 'closeCallback';
    dlgStruct.CloseMethodArgs = {'%dialog'};
    dlgStruct.CloseMethodArgsDT = {'handle'};
    dlgStruct.DefaultOk = false;
    % 718 720
    if any(strcmp(this.Root.SimulationStatus, {'running','paused'}))
        dlgStruct.DisableDialog = 1.0;
    end % if
