function simulinkPortControl(parentBlock, action, varargin)
    % 1 95
    % 2 95
    % 3 95
    % 4 95
    % 5 95
    % 6 95
    % 7 95
    % 8 95
    % 9 95
    % 10 95
    % 11 95
    % 12 95
    % 13 95
    % 14 95
    % 15 95
    % 16 95
    % 17 95
    % 18 95
    % 19 95
    % 20 95
    % 21 95
    % 22 95
    % 23 95
    % 24 95
    % 25 95
    % 26 95
    % 27 95
    % 28 95
    % 29 95
    % 30 95
    % 31 95
    % 32 95
    % 33 95
    % 34 95
    % 35 95
    % 36 95
    % 37 95
    % 38 95
    % 39 95
    % 40 95
    % 41 95
    % 42 95
    % 43 95
    % 44 95
    % 45 95
    % 46 95
    % 47 95
    % 48 95
    % 49 95
    % 50 95
    % 51 95
    % 52 95
    % 53 95
    % 54 95
    % 55 95
    % 56 95
    % 57 95
    % 58 95
    % 59 95
    % 60 95
    % 61 95
    % 62 95
    % 63 95
    % 64 95
    % 65 95
    % 66 95
    % 67 95
    % 68 95
    % 69 95
    % 70 95
    % 71 95
    % 72 95
    % 73 95
    % 74 95
    % 75 95
    % 76 95
    % 77 95
    % 78 95
    % 79 95
    % 80 95
    % 81 95
    % 82 95
    % 83 95
    % 84 95
    % 85 95
    % 86 95
    % 87 95
    % 88 95
    % 89 95
    % 90 95
    % 91 95
    % 92 95
    % 93 95
    try
        % 95 97
        switch lower(action)
        case 'enable'
            % 98 100
            i_checkSystem(parentBlock);
            % 100 103
            % 101 103
            block_ref = varargin{1.0};
            % 103 105
            state = varargin{2.0};
            % 105 108
            % 106 108
            [handle, type] = i_getBlockHandle(parentBlock, block_ref);
            % 108 110
            switch state
            case 0.0
                % 111 113
                i_disablePort(handle, type);
            case 'off'
                % 114 116
                i_disablePort(handle, type);
            case 1.0
                % 117 119
                i_enablePort(parentBlock, handle, type);
            case 'on'
                % 120 122
                i_enablePort(parentBlock, handle, type);
            otherwise
                i_handle_error('Unrecognised state');
            end
        otherwise
            error('Unrecognised action!');
        end
    catch
        if ~(strcmp(get_param(bdroot(parentBlock), 'BlockDiagramType'), 'library'))
            % 130 132
            rethrow(lasterror);
        end
    end % try
    return
end
function i_checkSystem(parentBlock)
    % 137 148
    % 138 148
    % 139 148
    % 140 148
    % 141 148
    % 142 148
    % 143 148
    % 144 148
    % 145 148
    % 146 148
    i_checkInports(parentBlock);
    i_checkOutports(parentBlock);
    % 149 151
    i_checkControlBlocks(parentBlock);
    % 151 154
    % 152 154
    i_updatePortNumbersForType(parentBlock, 'inport');
    i_updatePortNumbersForType(parentBlock, 'outport');
    return
end
function i_checkInports(parentBlock)
    % 158 163
    % 159 163
    % 160 163
    % 161 163
    handles = i_getInports(parentBlock);
    for i=1.0:length(handles)
        i_checkPort(parentBlock, handles(i), 'inport');
    end % for
    return
end
function i_checkOutports(parentBlock)
    % 169 174
    % 170 174
    % 171 174
    % 172 174
    handles = i_getOutports(parentBlock);
    for i=1.0:length(handles)
        i_checkPort(parentBlock, handles(i), 'outport');
    end % for
    return
end
function i_checkPort(parentBlock, block, type)
    % 180 183
    % 181 183
    hPorts = get_param(block, 'PortHandles');
    switch lower(type)
    case 'inport'
        % 185 187
        hOutputLine = get_param(hPorts.Outport, 'Line');
        if eq(hOutputLine, -1.0)
            % 188 190
            i_handle_error('Inport is not connected!');
        end
        controlHandle = get_param(hOutputLine, 'DstBlockHandle');
        if eq(controlHandle, -1.0)
            % 193 195
            i_handle_error('Inport is not connected!');
        end
        if ne(length(controlHandle), 1.0)
            i_handle_error('Ports may only be connected to a single Control Block');
        end
        % 199 201
        [blockhandle, type] = i_getBlockHandle(parentBlock, controlHandle);
        switch type
        case 'inport'
        otherwise
            % 204 206
            i_handle_error('Inports must be connected to Inport Control Blocks.');
        end
    case 'outport'
        % 208 210
        hInputLine = get_param(hPorts.Inport, 'Line');
        if eq(hInputLine, -1.0)
            % 211 213
            i_handle_error('Outport port is not connected!');
        end
        controlHandle = get_param(hInputLine, 'SrcBlockHandle');
        if eq(controlHandle, -1.0)
            % 216 218
            i_handle_error('Outport port is not connected!');
        end
        if ne(length(controlHandle), 1.0)
            i_handle_error('Ports may only be connected to a single Control Block');
        end
        % 222 224
        [blockhandle, type] = i_getBlockHandle(parentBlock, controlHandle);
        switch type
        case 'outport'
        otherwise
            % 227 229
            i_handle_error('Outports must be connected to Outport Control Blocks.');
        end
    end
    return
end
function i_checkControlBlocks(parentBlock)
    % 234 238
    % 235 238
    % 236 238
    portNameCell = {};
    inportNumArray = [];
    outportNumArray = [];
    % 240 243
    % 241 243
    a = i_getNonConfigurableInportBlocks(parentBlock);
    % 243 245
    b = i_getConfigurableInportBlocks(parentBlock);
    % 245 247
    c = i_getNonConfigurableOutportBlocks(parentBlock);
    % 247 249
    d = i_getConfigurableOutportBlocks(parentBlock);
    % 249 252
    % 250 252
    controlBlocks = vertcat(a, b, c, d);
    % 252 255
    % 253 255
    for i=1.0:length(controlBlocks)
        % 255 258
        % 256 258
        if sscanf(get_param(controlBlocks(i), 'isInport'), '%d')
            % 258 263
            % 259 263
            % 260 263
            % 261 263
            inportNumArray(plus(length(inportNumArray), 1.0)) = sscanf(get_param(controlBlocks(i), 'portNum'), '%d');
            % 263 265
            portHandle = i_getHandleOfBlockToManipulate(controlBlocks(i), 'inport');
            if sscanf(get_param(controlBlocks(i), 'isConfigurable'), '%d')
                % 266 270
                % 267 270
                % 268 270
                switch get_param(portHandle, 'BlockType')
                case 'Ground'
                    % 271 273
                    i_setControlBlockEnabled(controlBlocks(i), 'off');
                case 'Inport'
                    % 274 276
                    i_setControlBlockEnabled(controlBlocks(i), 'on');
                otherwise
                    % 277 279
                    i_handle_error('Inport Control blocks must be connected to either Ground or Inport blocks.');
                end
            else
                % 281 285
                % 282 285
                % 283 285
                switch get_param(portHandle, 'BlockType')
                case 'Inport'
                otherwise
                    % 287 289
                    i_handle_error('Non-Configurable Inport Control Blocks must be connected to Inports.');
                end
            end
        else
            % 292 297
            % 293 297
            % 294 297
            % 295 297
            outportNumArray(plus(length(outportNumArray), 1.0)) = sscanf(get_param(controlBlocks(i), 'portNum'), '%d');
            % 297 299
            portHandle = i_getHandleOfBlockToManipulate(controlBlocks(i), 'outport');
            if sscanf(get_param(controlBlocks(i), 'isConfigurable'), '%d')
                % 300 304
                % 301 304
                % 302 304
                switch get_param(portHandle, 'BlockType')
                case 'Terminator'
                    % 305 307
                    i_setControlBlockEnabled(controlBlocks(i), 'off');
                case 'Outport'
                    % 308 310
                    i_setControlBlockEnabled(controlBlocks(i), 'on');
                otherwise
                    % 311 313
                    i_handle_error('Outport Control blocks must be connected to either Terminator or Outport blocks.');
                end
            else
                % 315 319
                % 316 319
                % 317 319
                switch get_param(portHandle, 'BlockType')
                case 'Outport'
                otherwise
                    % 321 323
                    i_handle_error('Non-Configurable Outport Control Blocks must be connected to Outports.');
                end
            end
        end
        % 326 329
        % 327 329
        if sscanf(get_param(controlBlocks(i), 'isConfigurable'), '%d')
            portNameCell{plus(length(portNameCell), 1.0)} = get_param(controlBlocks(i), 'portName');
        end
    end % for
    % 332 334
    if ne(length(inportNumArray), length(unique(inportNumArray)))
        i_handle_error('Inport Numbers in the subsystem are not unique.');
    end
    % 336 338
    if (ne(min(inportNumArray), 1.0)) | (ne(max(inportNumArray), length(inportNumArray)))
        i_handle_error('Inport Control blocks must be numbered consecutively from 1');
    end
    % 340 342
    if ne(length(outportNumArray), length(unique(outportNumArray)))
        i_handle_error('Outport Numbers in the subsystem are not unique.');
    end
    % 344 346
    if (ne(min(outportNumArray), 1.0)) | (ne(max(outportNumArray), length(outportNumArray)))
        i_handle_error('Outport Control blocks must be numbered consecutively from 1');
    end
    % 348 350
    if ne(length(portNameCell), length(unique(portNameCell)))
        i_handle_error('Port Names in the subsysem are not unique.');
    end
    return
end
function i_handle_error(comment)
    % 355 358
    % 356 358
    error(comment);
    return
end
function i_updatePortNumbersForType(parentBlock, desiredPortType)
    % 361 366
    % 362 366
    % 363 366
    % 364 366
    portCounter = 1.0;
    % 366 369
    % 367 369
    switch desiredPortType
    case 'inport'
        nonConfig = i_getNonConfigurableInportBlocks(parentBlock);
        Config = i_getConfigurableInportBlocks(parentBlock);
    case 'outport'
        % 373 375
        nonConfig = i_getNonConfigurableOutportBlocks(parentBlock);
        Config = i_getConfigurableOutportBlocks(parentBlock);
    end
    % 377 381
    % 378 381
    % 379 381
    controlBlocks = vertcat(nonConfig, Config);
    % 381 383
    portNums = [];
    for i=1.0:length(controlBlocks)
        % 384 386
        portNums(plus(length(portNums), 1.0)) = get_param(controlBlocks(i), 'portNum');
    end % for
    % 387 390
    % 388 390
    [sortedPortNums, indices] = sort(portNums);
    % 390 393
    % 391 393
    for i=1.0:length(indices)
        index = indices(i);
        block = controlBlocks(index);
        port = i_getHandleOfBlockToManipulate(controlBlocks(index), desiredPortType);
        % 396 398
        if i_isControlBlockEnabled(block)
            % 398 401
            % 399 401
            set_param(port, 'Port', sprintf('%d', portCounter));
            portCounter = plus(portCounter, 1.0);
        end
    end % for
    return
end
function i_enablePort(parentBlock, block, type)
    % 407 411
    % 408 411
    % 409 411
    i_replaceBlock(block, 'enable', type);
    % 411 413
    i_setControlBlockEnabled(block, 'on')
    % 413 415
    i_updatePortNumbersForType(parentBlock, type);
    return
end
function i_disablePort(block, type)
    % 418 422
    % 419 422
    % 420 422
    i_replaceBlock(block, 'disable', type);
    % 422 424
    i_setControlBlockEnabled(block, 'off');
    % 424 426
    return
end
function i_setControlBlockEnabled(block, enabled)
    % 428 433
    % 429 433
    % 430 433
    % 431 433
    switch enabled
    case 'on'
        set_param(block, 'isEnabled', '1');
    case 'off'
        set_param(block, 'isEnabled', '0');
    otherwise
        i_handle_error('State must be "on" or "off"');
    end
    return
end
function enabled = i_isControlBlockEnabled(block)
    % 443 449
    % 444 449
    % 445 449
    % 446 449
    % 447 449
    enabled = sscanf(get_param(block, 'isEnabled'), '%d');
    return
end
function portHandle = i_getHandleOfBlockToManipulate(block, type)
    % 452 456
    % 453 456
    % 454 456
    hPorts = get_param(block, 'PortHandles');
    switch lower(type)
    case 'inport'
        % 458 460
        hInputLine = get_param(hPorts.Inport, 'Line');
        if eq(hInputLine, -1.0)
            % 461 463
            i_handle_error('Input port is not connected!');
        end
        portHandle = get_param(hInputLine, 'SrcBlockHandle');
        if eq(portHandle, -1.0)
            % 466 468
            i_handle_error('Input port is not connected!');
        end
    case 'outport'
        % 470 472
        hOutputLine = get_param(hPorts.Outport, 'Line');
        if eq(hOutputLine, -1.0)
            % 473 475
            i_handle_error('Output port is not connected!');
        end
        portHandle = get_param(hOutputLine, 'DstBlockHandle');
        if eq(portHandle, -1.0)
            % 478 480
            i_handle_error('Output port is not connected!');
        end
    end
    if ne(length(portHandle), 1.0)
        i_handle_error('Control Blocks may only be connected to a single port');
    end
    return
end
function newBlockHandle = i_replaceBlock(block, action, type)
    % 488 496
    % 489 496
    % 490 496
    % 491 496
    % 492 496
    % 493 496
    % 494 496
    hThisBlk = i_getHandleOfBlockToManipulate(block, type);
    % 496 499
    % 497 499
    switch lower(action)
    case 'enable'
        switch lower(type)
        case 'inport'
            newBlkType = 'Inport';
        case 'outport'
            newBlkType = 'Outport';
        otherwise
            error('Unknown port type!');
        end
    case 'disable'
        switch lower(type)
        case 'inport'
            newBlkType = 'Ground';
        case 'outport'
            newBlkType = 'Terminator';
        otherwise
            error('Unknown port type!');
        end
    otherwise
        error('Unknown action!');
    end
    % 520 523
    % 521 523
    if strcmp(get_param(hThisBlk, 'BlockType'), newBlkType)
        % 523 526
        % 524 526
        newBlockHandle = hThisBlk;
        return
    end
    % 528 533
    % 529 533
    % 530 533
    % 531 533
    oldsettings.Sys = get_param(hThisBlk, 'Parent');
    oldsettings.Name = get_param(hThisBlk, 'Name');
    oldsettings.Pos = get_param(hThisBlk, 'Position');
    oldsettings.Orient = get_param(hThisBlk, 'Orientation');
    oldsettings.Place = get_param(hThisBlk, 'NamePlacement');
    % 537 540
    % 538 540
    delete_block(hThisBlk);
    % 540 543
    % 541 543
    newBlockHandle = add_block(horzcat('built-in/', newBlkType), horzcat(oldsettings.Sys, '/', oldsettings.Name), 'Position', oldsettings.Pos, 'Orientation', oldsettings.Orient, 'NamePlacement', oldsettings.Place);
    % 543 547
    % 544 547
    % 545 547
    return
end
function [blockhandle, type] = i_getControlBlockWithBlockRef(parentBlock, blockref)
    % 549 553
    % 550 553
    % 551 553
    inportControlBlock = find_system(parentBlock, 'FollowLinks', 'on', 'SearchDepth', 1.0, 'LookUnderMasks', 'all', 'MaskType', 'Configurable Inport Control', 'portName', blockref);
    % 553 559
    % 554 559
    % 555 559
    % 556 559
    % 557 559
    outportControlBlock = find_system(parentBlock, 'FollowLinks', 'on', 'SearchDepth', 1.0, 'LookUnderMasks', 'all', 'MaskType', 'Configurable Outport Control', 'portName', blockref);
    % 559 565
    % 560 565
    % 561 565
    % 562 565
    % 563 565
    if ne(plus(length(inportControlBlock), length(outportControlBlock)), 1.0)
        % 565 567
        i_handle_error(horzcat('A single Control block with Port Name "', blockref, '" must be in the subsystem!'));
    end
    if eq(length(inportControlBlock), 1.0)
        % 569 571
        blockhandle = inportControlBlock;
        type = 'inport';
    else
        % 573 575
        blockhandle = outportControlBlock;
        type = 'outport';
    end
    return
end
function [blockhandle, type, configurable] = i_getBlockHandle(parentBlock, blockref)
    % 580 584
    % 581 584
    % 582 584
    if ishandle(blockref)
        % 584 586
        blockhandle = blockref;
        maskType = get_param(blockhandle, 'MaskType');
        switch maskType
        case 'Configurable Inport Control'
            type = 'inport';
            configurable = 1.0;
        case 'Configurable Outport Control'
            type = 'outport';
            configurable = 1.0;
        case 'Non-Configurable Inport Control'
            type = 'inport';
            configurable = 0.0;
        case 'Non-Configurable Outport Control'
            type = 'outport';
            configurable = 0.0;
        otherwise
            i_handle_error('Could not resolve the blockreference to a valid Control Block');
        end
    else
        if ischar(blockref)
            % 605 607
            [blockhandle, type] = i_getControlBlockWithBlockRef(parentBlock, blockref);
            configurable = 1.0;
            return
        else
            i_handle_error('blockref must be a handle or Port Name string');
        end
    end
    return
end
function handles = i_getNonConfigurableInportBlocks(parentBlock)
    % 616 621
    % 617 621
    % 618 621
    % 619 621
    handles = find_system(parentBlock, 'FollowLinks', 'on', 'SearchDepth', 1.0, 'LookUnderMasks', 'all', 'MaskType', 'Non-Configurable Inport Control');
    % 621 625
    % 622 625
    % 623 625
    return
end
function handles = i_getNonConfigurableOutportBlocks(parentBlock)
    handles = find_system(parentBlock, 'FollowLinks', 'on', 'SearchDepth', 1.0, 'LookUnderMasks', 'all', 'MaskType', 'Non-Configurable Outport Control');
    % 628 632
    % 629 632
    % 630 632
    return
end
function handles = i_getConfigurableInportBlocks(parentBlock)
    handles = find_system(parentBlock, 'FollowLinks', 'on', 'SearchDepth', 1.0, 'LookUnderMasks', 'all', 'MaskType', 'Configurable Inport Control');
    % 635 639
    % 636 639
    % 637 639
    return
end
function handles = i_getConfigurableOutportBlocks(parentBlock)
    handles = find_system(parentBlock, 'FollowLinks', 'on', 'SearchDepth', 1.0, 'LookUnderMasks', 'all', 'MaskType', 'Configurable Outport Control');
    % 642 646
    % 643 646
    % 644 646
    return
end
function handles = i_getInports(parentBlock)
    handles = find_system(parentBlock, 'FollowLinks', 'on', 'SearchDepth', 1.0, 'LookUnderMasks', 'all', 'BlockType', 'Inport');
    % 649 653
    % 650 653
    % 651 653
    return
end
function handles = i_getOutports(parentBlock)
    handles = find_system(parentBlock, 'FollowLinks', 'on', 'SearchDepth', 1.0, 'LookUnderMasks', 'all', 'BlockType', 'Outport');
    % 656 660
    % 657 660
    % 658 660
    return
end
