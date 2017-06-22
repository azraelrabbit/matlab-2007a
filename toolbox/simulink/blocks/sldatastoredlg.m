function varargout = sldatastoredlg(varargin)
    % 1 21
    % 2 21
    % 3 21
    % 4 21
    % 5 21
    % 6 21
    % 7 21
    % 8 21
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
    hdl = -1.0;
    switch nargin
    case 1.0
        % 23 28
        % 24 28
        % 25 28
        % 26 28
        blkHdl = varargin{1.0};
        hdl = openDialog(blkHdl);
    case 2.0
        % 30 35
        % 31 35
        % 32 35
        % 33 35
        blkHdl = varargin{2.0};
        blkType = get_param(blkHdl, 'BlockType');
        switch lower(varargin{1.0})
        case 'delete'
            doClose(blkHdl);
        case 'namechange'
            doUpdateName(blkHdl);
        otherwise
            error('SimulinkDialog:InternalError', horzcat('Invalid command "', varargin{1.0}, '" for Data Store ', blkType(10.0:end), ' block parameter dialog.'));
            % 43 47
            % 44 47
            % 45 47
        end
    case 3.0
        % 48 50
        if strcmp(varargin{1.0}, 'get')
            blkHdl = varargin{2.0};
            hdl = get_param(blkHdl, 'Figure');
            ud = get(hdl, 'UserData');
            varargout = {''};
            switch varargin{3.0}
            case 0.0
                varargout{1.0} = sl('deblankall', get(ud.dsNameEdit, 'String'));
            case 1.0
                varargout{1.0} = sl('deblankall', get(ud.tsEdit, 'String'));
            end
            return
        end
    case 4.0
        % 63 65
        if strcmp(varargin{1.0}, 'set')
            blkHdl = varargin{2.0};
            hdl = get_param(blkHdl, 'Figure');
            ud = get(hdl, 'UserData');
            switch varargin{4.0}
            case 0.0
                set(ud.dsNameEdit, 'String', sl('deblankall', varargin{3.0}));
                doDSName(ud.dsNameEdit, []);
            case 1.0
                set(ud.tsEdit, 'String', sl('deblankall', varargin{3.0}));
                doSampleTime(ud.tsEdit, []);
            end
            return
        end
    otherwise
        % 79 81
        error(horzcat('Invalid number of arguments ', num2str(nargin)));
    end
    % 82 84
    if nargout
        varargout{1.0} = hdl;
    end
end
function hdl = createDialog(blkHdl)
    % 88 98
    % 89 98
    % 90 98
    % 91 98
    % 92 98
    % 93 98
    % 94 98
    % 95 98
    % 96 98
    objBGColor = get(0.0, 'defaultuicontrolbackgroundcolor');
    % 98 100
    if findstr(get_param(blkHdl, 'BlockType'), 'Read')
        descStr = 'Read values from specified data store.';
        blkType = 'Data Store Read';
        blkTypeEnum = 1.0;
    else
        descStr = 'Write values to specified data store.';
        blkType = 'Data Store Write';
        blkTypeEnum = 0.0;
    end
    % 108 113
    % 109 113
    % 110 113
    % 111 113
    dialogPos = [1.0 1.0 350.0 340.0];
    % 113 115
    hdl = figure('numbertitle', 'off', 'name', horzcat('Block Parameters: ', get_param(blkHdl, 'name')), 'menubar', 'none', 'visible', 'off', 'HandleVisibility', 'callback', 'IntegerHandle', 'off', 'color', objBGColor, 'Units', 'pixels', 'Position', dialogPos, 'Resize', 'on');
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
    tmpText = uicontrol(hdl, 'style', 'text', 'fontunit', 'pixel', 'visible', 'off', 'string', 'www');
    % 128 132
    % 129 132
    % 130 132
    pixelRatio = mrdivide(get(tmpText, 'fontsize'), 10.667);
    delete(tmpText);
    dialogPos(3.0:4.0) = mtimes(dialogPos(3.0:4.0), pixelRatio);
    set(hdl, 'Position', dialogPos);
    % 135 138
    % 136 138
    set(hdl, 'KeyPressFcn', cellhorzcat(@returnKeyOK));
    set(hdl, 'DeleteFcn', cellhorzcat(@deleteFcn));
    % 139 142
    % 140 142
    ud.blkHdl = blkHdl;
    ud.hdl = hdl;
    % 143 146
    % 144 146
    ud.desc = uicontrol(hdl, 'style', 'frame', 'enable', 'inactive', 'backgroundcolor', objBGColor, 'foregroundcolor', [1.0 .984313725490196 .9411764705882353]);
    % 146 153
    % 147 153
    % 148 153
    % 149 153
    % 150 153
    % 151 153
    ud.descTitle = uicontrol(hdl, 'style', 'text', 'backgroundcolor', objBGColor, 'string', blkType);
    % 153 159
    % 154 159
    % 155 159
    % 156 159
    % 157 159
    ud.descText = uicontrol(hdl, 'style', 'text', 'backgroundcolor', objBGColor, 'max', 2.0, 'min', 0.0, 'horizontalalignment', 'left', 'value', [], 'string', sprintf(descStr));
    % 159 170
    % 160 170
    % 161 170
    % 162 170
    % 163 170
    % 164 170
    % 165 170
    % 166 170
    % 167 170
    % 168 170
    ud.param = uicontrol(hdl, 'style', 'frame', 'backgroundcolor', objBGColor, 'enable', 'inactive', 'foregroundcolor', [1.0 .984313725490196 .9411764705882353]);
    % 170 177
    % 171 177
    % 172 177
    % 173 177
    % 174 177
    % 175 177
    ud.paramTitle = uicontrol(hdl, 'style', 'text', 'backgroundcolor', objBGColor, 'string', 'Parameters');
    % 177 184
    % 178 184
    % 179 184
    % 180 184
    % 181 184
    % 182 184
    ud.dsNamePrompt = uicontrol(hdl, 'style', 'text', 'backgroundcolor', objBGColor, 'string', 'Data store name: ');
    % 184 190
    % 185 190
    % 186 190
    % 187 190
    % 188 190
    dsName = get_param(blkHdl, 'DataStoreName');
    ud.dsNameEdit = uicontrol(hdl, 'style', 'edit', 'backgroundcolor', [1.0 1.0 1.0], 'horizontalalignment', 'left', 'string', dsName, 'callback', cellhorzcat(@doDSName));
    % 191 200
    % 192 200
    % 193 200
    % 194 200
    % 195 200
    % 196 200
    % 197 200
    % 198 200
    ud.cmenu = uicontextmenu('Parent', hdl, 'Callback', cellhorzcat(@doContextMenu));
    % 200 203
    % 201 203
    ud.selectButton = uicontrol(hdl, 'style', 'pushbutton', 'backgroundcolor', objBGColor, 'string', 'Select data store name >> ', 'visible', 'on', 'uicontextmenu', ud.cmenu, 'tooltip', 'Setting data store name by selecting it from the list', 'callback', cellhorzcat(@doDSNameSelect));
    % 203 215
    % 204 215
    % 205 215
    % 206 215
    % 207 215
    % 208 215
    % 209 215
    % 210 215
    % 211 215
    % 212 215
    % 213 215
    ud.dsmSrcPrompt = uicontrol(hdl, 'style', 'text', 'backgroundcolor', objBGColor, 'string', 'Data store memory block: ');
    % 215 221
    % 216 221
    % 217 221
    % 218 221
    % 219 221
    dsmSrc = findMatchingDSMemBlock(ud.blkHdl, get(ud.dsNameEdit, 'String'));
    if not(isempty(dsmSrc))
        dsmSrc = strrep(dsmSrc, sprintf('\n'), ' ');
    end
    ud.dsmSrcEdit = uicontrol(hdl, 'style', 'text', 'horizontalalignment', 'left', 'Tooltip', 'Click to locate the block', 'Foregroundcolor', 'Blue', 'Enable', 'inactive', 'string', dsmSrc);
    % 225 234
    % 226 234
    % 227 234
    % 228 234
    % 229 234
    % 230 234
    % 231 234
    % 232 234
    if not(strcmp(get_param(bdroot(blkHdl), 'Lock'), 'on'))
        set(ud.dsmSrcEdit, 'ButtonDownFcn', cellhorzcat(@doLocateDSM));
    end
    % 236 239
    % 237 239
    if blkTypeEnum
        dsSrcPrompt = 'Data store write blocks: ';
    else
        dsSrcPrompt = 'Data store read blocks: ';
    end
    ud.srcListPrompt = uicontrol(hdl, 'style', 'text', 'backgroundcolor', objBGColor, 'string', dsSrcPrompt);
    % 244 250
    % 245 250
    % 246 250
    % 247 250
    % 248 250
    dsSrcName = getDSSrcBlocks(blkHdl);
    % 250 252
    ud.srcList = uicontrol(hdl, 'style', 'listbox', 'backgroundcolor', objBGColor, 'String', dsSrcName, 'Tooltip', sprintf('Double click to locate the selected block.\nClick Apply to refresh the list'), 'callback', cellhorzcat(@doDSSrcSelection));
    % 252 263
    % 253 263
    % 254 263
    % 255 263
    % 256 263
    % 257 263
    % 258 263
    % 259 263
    % 260 263
    % 261 263
    ud.tsPrompt = uicontrol(hdl, 'style', 'text', 'backgroundcolor', objBGColor, 'string', 'Sample time: ');
    % 263 269
    % 264 269
    % 265 269
    % 266 269
    % 267 269
    ts = get_param(blkHdl, 'SampleTime');
    ud.tsEdit = uicontrol(hdl, 'style', 'edit', 'backgroundcolor', [1.0 1.0 1.0], 'horizontalalignment', 'left', 'string', ts, 'callback', cellhorzcat(@doSampleTime));
    % 270 279
    % 271 279
    % 272 279
    % 273 279
    % 274 279
    % 275 279
    % 276 279
    % 277 279
    ud.okButton = uicontrol(hdl, 'Style', 'pushbutton', 'backgroundcolor', objBGColor, 'String', 'OK', 'Callback', cellhorzcat(@doOK));
    % 279 286
    % 280 286
    % 281 286
    % 282 286
    % 283 286
    % 284 286
    ud.cancelButton = uicontrol(hdl, 'Style', 'pushbutton', 'Backgroundcolor', objBGColor, 'String', 'Cancel', 'Callback', cellhorzcat(@doCancel));
    % 286 293
    % 287 293
    % 288 293
    % 289 293
    % 290 293
    % 291 293
    ud.helpButton = uicontrol(hdl, 'Style', 'pushbutton', 'Backgroundcolor', objBGColor, 'Enable', 'on', 'String', 'Help', 'Callback', cellhorzcat(@doHelp));
    % 293 301
    % 294 301
    % 295 301
    % 296 301
    % 297 301
    % 298 301
    % 299 301
    ud.applyButton = uicontrol(hdl, 'Style', 'pushbutton', 'backgroundcolor', objBGColor, 'Enable', 'off', 'String', 'Apply', 'Callback', cellhorzcat(@doApply));
    % 301 310
    % 302 310
    % 303 310
    % 304 310
    % 305 310
    % 306 310
    % 307 310
    % 308 310
    ud.origSize = [0.0 0.0];
    ud.hilitedBlk.blkHdl = -1.0;
    ud.hilitedBlk.origHL = 'none';
    ud.hilitedDSM.blkHdl = -1.0;
    ud.hilitedDSM.origHL = 'none';
    set(hdl, 'UserData', ud);
    % 315 318
    % 316 318
    doResize(hdl, []);
    % 318 321
    % 319 321
    set(hdl, 'Units', 'pixels');
    dialogPos = get(hdl, 'Position');
    bdPos = get_param(get_param(blkHdl, 'Parent'), 'Location');
    blkPos = get_param(blkHdl, 'Position');
    bdPos = horzcat(plus(bdPos(1.0:2.0), blkPos(1.0:2.0)), plus(plus(bdPos(1.0:2.0), blkPos(1.0:2.0)), blkPos(3.0:4.0)));
    % 325 327
    hgPos = sl('rectconv', bdPos, 'hg');
    dialogPos(1.0) = plus(hgPos(1.0), minus(hgPos(3.0), dialogPos(3.0)));
    dialogPos(2.0) = plus(hgPos(2.0), minus(hgPos(4.0), dialogPos(4.0)));
    % 329 332
    % 330 332
    units = get(0.0, 'Units');
    set(0.0, 'Units', 'pixel');
    screenSize = get(0.0, 'ScreenSize');
    set(0.0, 'Units', units);
    if lt(dialogPos(1.0), 0.0)
        dialogPos(1.0) = 1.0;
    else
        if gt(dialogPos(1.0), minus(screenSize(3.0), dialogPos(3.0)))
            dialogPos(1.0) = minus(screenSize(3.0), dialogPos(3.0));
        end
    end
    if lt(dialogPos(2.0), 0.0)
        dialogPos(2.0) = 1.0;
    else
        if gt(dialogPos(2.0), minus(screenSize(4.0), dialogPos(4.0)))
            dialogPos(2.0) = minus(screenSize(4.0), dialogPos(4.0));
        end
    end
    ud.origSize = dialogPos(3.0:4.0);
    set(hdl, 'Position', dialogPos, 'Units', 'normalized', 'UserData', ud, 'ResizeFcn', cellhorzcat(@doResize));
    % 351 358
    % 352 358
    % 353 358
    % 354 358
    % 355 358
    % 356 358
    if strcmp(get_param(blkHdl, 'LinkStatus'), 'none') && not(strcmp(get_param(bdroot(blkHdl), 'Lock'), 'on'))
        % 358 360
        set_param(blkHdl, 'Figure', hdl)
    else
        UiControls = vertcat(horzcat(ud.dsNamePrompt), horzcat(ud.dsNameEdit), horzcat(ud.selectButton), horzcat(ud.dsmSrcPrompt), horzcat(ud.dsmSrcEdit), horzcat(ud.srcListPrompt), horzcat(ud.srcList), horzcat(ud.tsPrompt), horzcat(ud.tsEdit), horzcat(ud.okButton), horzcat(ud.applyButton));
        % 362 365
        % 363 365
        set(UiControls, 'enable', 'off');
    end
end
function applyNoError = doApply(applyButton, evd)
    % 368 377
    % 369 377
    % 370 377
    % 371 377
    % 372 377
    % 373 377
    % 374 377
    % 375 377
    hdl = get(applyButton, 'Parent');
    ud = get(hdl, 'UserData');
    % 378 380
    ud.hilitedBlk = doUnHiliteBlocks(ud.hilitedBlk);
    ud.hilitedDSM = doUnHiliteBlocks(ud.hilitedDSM);
    errmsg = '';
    lasterr('');
    % 383 385
    applyNoError = 1.0;
    set_param(ud.blkHdl, 'Figure', -1.0);
    prevDSName = get_param(ud.blkHdl, 'DataStoreName');
    prevTs = get_param(ud.blkHdl, 'SampleTime');
    try
        % 389 392
        % 390 392
        set_param(ud.blkHdl, 'DataStoreName', sl('deblankall', get(ud.dsNameEdit, 'String')));
    catch
        % 393 395
        applyNoError = 0.0;
        try
            % 396 398
            set_param(ud.blkHdl, 'DataStoreName', prevDSName);
            % 398 400
        end % try
        errmsg = vertcat(errmsg, cellhorzcat(lasterr));
    end % try
    % 402 404
    try
        % 404 407
        % 405 407
        set_param(ud.blkHdl, 'SampleTime', sl('deblankall', get(ud.tsEdit, 'String')));
    catch
        applyNoError = 0.0;
        try
            % 410 412
            set_param(ud.blkHdl, 'SampleTime', prevTs);
            % 412 414
        end % try
        errmsg = vertcat(errmsg, cellhorzcat(lasterr));
    end % try
    % 416 418
    set_param(ud.blkHdl, 'Figure', hdl);
    % 418 420
    if applyNoError
        try
            % 421 423
            doRefreshSrcList(ud.dsNameEdit, []);
        catch
            errmsg = vertcat(cellhorzcat(errmsg), cellhorzcat(lasterr));
        end % try
        % 426 429
        % 427 429
        toggleApply(applyButton, 'off');
    end
    % 430 432
    set(hdl, 'UserData', ud);
    if not(isempty(errmsg))
        errordlg(errmsg, 'Error message: Data Store Block', 'modal');
    end
end
function doCancel(cancelButton, evd)
    % 437 446
    % 438 446
    % 439 446
    % 440 446
    % 441 446
    % 442 446
    % 443 446
    % 444 446
    hdl = get(cancelButton, 'Parent');
    ud = get(hdl, 'UserData');
    % 447 449
    ud.hilitedBlk = doUnHiliteBlocks(ud.hilitedBlk);
    ud.hilitedDSM = doUnHiliteBlocks(ud.hilitedDSM);
    % 450 452
    set(hdl, 'Visible', 'off');
    set(hdl, 'UserData', ud);
    % 453 455
    if not(strcmp(get_param(bdroot(ud.blkHdl), 'Lock'), 'on'))
        warningState = vertcat(warning, warning('query', 'backtrace'));
        warning('off', 'backtrace');
        warning('on');
        set_param(ud.blkHdl, 'Figure', -1.0);
        set(ud.dsNameEdit, 'String', get_param(ud.blkHdl, 'DataStoreName'));
        set(ud.tsEdit, 'String', get_param(ud.blkHdl, 'SampleTime'));
        set_param(ud.blkHdl, 'Figure', hdl);
        warning(warningState);
    end
end
function doClose(blkHdl)
    % 466 475
    % 467 475
    % 468 475
    % 469 475
    % 470 475
    % 471 475
    % 472 475
    % 473 475
    if ne(get_param(blkHdl, 'Figure'), -1.0)
        hdl = get_param(blkHdl, 'Figure');
        if not(isempty(hdl)) && ishandle(hdl)
            ud = get(hdl, 'UserData');
            % 478 481
            % 479 481
            ud.hilitedBlk = doUnHiliteBlocks(ud.hilitedBlk);
            ud.hilitedDSM = doUnHiliteBlocks(ud.hilitedDSM);
            % 482 484
            if not(strcmp(get_param(bdroot(blkHdl), 'Lock'), 'on'))
                delete(hdl);
                try
                    set_param(blkHdl, 'Figure', -1.0);
                    % 487 489
                end % try
            end
        end
    end
end
function doRefreshSrcList(obj, evd)
    % 494 503
    % 495 503
    % 496 503
    % 497 503
    % 498 503
    % 499 503
    % 500 503
    % 501 503
    hdl = get(obj, 'Parent');
    ud = get(hdl, 'UserData');
    % 504 506
    srcName = getDSSrcBlocks(ud.blkHdl);
    if gt(get(ud.srcList, 'Value'), size(srcName, 1.0))
        set(ud.srcList, 'Value', 1.0);
    end
    set(ud.srcList, 'String', srcName);
    % 510 512
    dsmSrc = findMatchingDSMemBlock(ud.blkHdl, get(ud.dsNameEdit, 'String'));
    if not(isempty(dsmSrc))
        dsmSrc = strrep(dsmSrc, sprintf('\n'), ' ');
    end
    set(ud.dsmSrcEdit, 'String', dsmSrc);
end
function doDSSrcSelection(srcList, evd)
    % 518 528
    % 519 528
    % 520 528
    % 521 528
    % 522 528
    % 523 528
    % 524 528
    % 525 528
    % 526 528
    hdl = get(srcList, 'Parent');
    ud = get(hdl, 'UserData');
    % 529 531
    if strcmp(lower(get(hdl, 'SelectionType')), 'normal')
        % 531 533
        listStr = get(ud.srcList, 'String');
        % 533 535
        if not(isempty(listStr))
            % 535 537
            toggleApply(ud.applyButton);
        end
    else
        if strcmp(lower(get(hdl, 'SelectionType')), 'open')
            doFind(ud.srcList, []);
        end
    end
end
function doDSName(dsNameEdit, evd)
    % 545 553
    % 546 553
    % 547 553
    % 548 553
    % 549 553
    % 550 553
    % 551 553
    hdl = get(dsNameEdit, 'Parent');
    ud = get(hdl, 'UserData');
    % 554 557
    % 555 557
    doRefreshSrcList(ud.dsNameEdit, []);
    % 557 560
    % 558 560
    toggleApply(ud.applyButton);
end
function doHelp(helpButton, evd)
    % 562 571
    % 563 571
    % 564 571
    % 565 571
    % 566 571
    % 567 571
    % 568 571
    % 569 571
    hdl = get(helpButton, 'Parent');
    ud = get(hdl, 'UserData');
    slhelp(ud.blkHdl);
end
function doDSNameSelect(obj, evd)
    % 575 584
    % 576 584
    % 577 584
    % 578 584
    % 579 584
    % 580 584
    % 581 584
    % 582 584
    hdl = get(obj, 'Parent');
    ud = get(hdl, 'UserData');
    % 585 587
    doContextMenu(ud.cmenu, []);
end
function doContextMenu(cmenu, evd)
    % 589 598
    % 590 598
    % 591 598
    % 592 598
    % 593 598
    % 594 598
    % 595 598
    % 596 598
    hdl = get(cmenu, 'Parent');
    ud = get(hdl, 'UserData');
    % 599 602
    % 600 602
    delete(get(ud.cmenu, 'Children'));
    % 602 604
    if strcmp(get_param(ud.blkHdl, 'LinkStatus'), 'none') && not(strcmp(get_param(bdroot(ud.blkHdl), 'Lock'), 'on'))
        % 604 606
        currentDsmStr = get_param(ud.blkHdl, 'DataStoreName');
        % 606 608
        dsmBlks = find_system(bdroot(ud.blkHdl), 'BlockType', 'DataStoreMemory');
        for i=1.0:length(dsmBlks)
            dsNameStr = get_param(dsmBlks(i), 'DataStoreName');
            if isempty(findobj(ud.cmenu, 'Label', horzcat('   ', dsNameStr)))
                item = uimenu(ud.cmenu, 'Label', horzcat('   ', dsNameStr), 'Enable', 'on', 'callback', cellhorzcat(@doSelectTag));
                % 612 616
                % 613 616
                % 614 616
                if strcmp(currentDsmStr, dsNameStr)
                    set(item, 'Checked', 'on');
                end
            end
        end % for
        % 620 623
        % 621 623
        prevUnit = get(ud.selectButton, 'Units');
        set(ud.selectButton, 'Units', 'pixels');
        selectButtonPos = get(ud.selectButton, 'Position');
        set(ud.cmenu, 'Position', plus(selectButtonPos(1.0:2.0), selectButtonPos(3.0:4.0)));
        set(ud.cmenu, 'Visible', 'on');
        set(ud.selectButton, 'Units', prevUnit);
    end
end
function doSelectTag(item, evd)
    % 631 640
    % 632 640
    % 633 640
    % 634 640
    % 635 640
    % 636 640
    % 637 640
    % 638 640
    hdl = get(get(item, 'Parent'), 'Parent');
    ud = get(hdl, 'UserData');
    % 641 643
    set(ud.dsNameEdit, 'String', sl('deblankall', get(item, 'Label')));
    % 643 646
    % 644 646
    if strcmp(get(ud.dsNameEdit, 'String'), get_param(ud.blkHdl, 'DataStoreName'))
        doRefreshSrcList(ud.dsNameEdit, []);
    end
    % 648 651
    % 649 651
    toggleApply(ud.applyButton);
    % 651 653
    set(hdl, 'UserData', ud);
end
function doLocateDSM(item, evd)
    % 655 664
    % 656 664
    % 657 664
    % 658 664
    % 659 664
    % 660 664
    % 661 664
    % 662 664
    hdl = get(item, 'Parent');
    ud = get(hdl, 'UserData');
    % 665 667
    if strcmp(get(hdl, 'SelectionType'), 'alt')
        % 667 669
        return
    end
    % 670 674
    % 671 674
    % 672 674
    dsmBlk = findMatchingDSMemBlock(ud.blkHdl, get(ud.dsNameEdit, 'String'));
    if not(isempty(dsmBlk))
        try
            ud.hilitedDSM = doUnHiliteBlocks(ud.hilitedDSM);
            ud.hilitedDSM.origHL = get_param(dsmBlk, 'HiliteAncestors');
            hilite_system(dsmBlk, 'find');
            ud.hilitedDSM.blkHdl = dsmBlk;
        catch
            errordlg(lasterr);
        end % try
    else
        errordlg(horzcat('Data store memory block for data store block ', '''', get_param(ud.blkHdl, 'Name'), '''  was not found.'));
        % 685 687
    end
    % 687 689
    set(hdl, 'UserData', ud);
end
function doFind(obj, evd)
    % 691 701
    % 692 701
    % 693 701
    % 694 701
    % 695 701
    % 696 701
    % 697 701
    % 698 701
    % 699 701
    hdl = get(obj, 'Parent');
    ud = get(hdl, 'UserData');
    % 702 705
    % 703 705
    ud.hilitedBlk = doUnHiliteBlocks(ud.hilitedBlk);
    % 705 707
    listStr = get(ud.srcList, 'String');
    % 707 709
    if not(isempty(listStr))
        listSrc = listStr{get(ud.srcList, 'Value')};
        if not(isempty(listSrc))
            try
                % 712 714
                ud.hilitedBlk.origHL = get_param(listSrc, 'HiliteAncestors');
                hilite_system(listSrc, 'find');
                ud.hilitedBlk.blkHdl = listSrc;
            catch
                msg = horzcat('Unable to find Data Store block named: "', listSrc, '". ', lasterr);
                msgbox(msg, 'Data Store Source Locating Message', 'modal');
            end % try
        end
    end
    set(hdl, 'UserData', ud);
end
function doOK(okButton, evd)
    % 725 735
    % 726 735
    % 727 735
    % 728 735
    % 729 735
    % 730 735
    % 731 735
    % 732 735
    % 733 735
    hdl = get(okButton, 'Parent');
    ud = get(hdl, 'UserData');
    % 736 738
    if doApply(ud.applyButton, evd)
        ud.hilitedBlk = doUnHiliteBlocks(ud.hilitedBlk);
        ud.hilitedDSM = doUnHiliteBlocks(ud.hilitedDSM);
        % 740 742
        set(hdl, 'Visible', 'off');
        set(hdl, 'UserData', ud);
    end
end
function doResize(hdl, evd)
    % 746 761
    % 747 761
    % 748 761
    % 749 761
    % 750 761
    % 751 761
    % 752 761
    % 753 761
    % 754 761
    % 755 761
    % 756 761
    % 757 761
    % 758 761
    % 759 761
    ud = get(hdl, 'UserData');
    % 761 763
    set(hdl, 'Units', 'pixels');
    figPos = get(hdl, 'Position');
    % 764 767
    % 765 767
    tmpText = uicontrol(hdl, 'style', 'text', 'fontunit', 'pixel', 'string', 'www');
    % 767 769
    pixelRatio = mrdivide(get(tmpText, 'fontsize'), 10.667);
    delete(tmpText);
    if ne(ud.origSize, [0.0 0.0])
        if lt(figPos(3.0), ud.origSize(1.0)) || lt(figPos(4.0), mtimes(310.0, pixelRatio))
            set(hdl, 'Units', 'normalized');
            return
        end
    end
    % 776 778
    allHdls = horzcat(hdl, ud.desc, ud.descTitle, ud.descText, ud.param, ud.paramTitle, ud.dsNamePrompt, ud.dsNameEdit, ud.selectButton, ud.dsmSrcPrompt, ud.dsmSrcEdit, ud.srcListPrompt, ud.srcList, ud.tsPrompt, ud.tsEdit, ud.okButton, ud.cancelButton, ud.helpButton, ud.applyButton);
    % 778 783
    % 779 783
    % 780 783
    % 781 783
    set(allHdls, 'Units', 'characters');
    % 783 785
    offset = 1.0;
    btnWidth = 12.0;
    btnHeight = 1.75;
    txtMove = .5;
    % 788 790
    figPos = get(hdl, 'Position');
    % 790 793
    % 791 793
    posApply = horzcat(minus(minus(figPos(3.0), offset), btnWidth), offset, btnWidth, btnHeight);
    posHelp = posApply;
    posHelp(1.0) = minus(minus(posApply(1.0), mtimes(2.0, offset)), btnWidth);
    posCancel = posHelp;
    posCancel(1.0) = minus(minus(posHelp(1.0), mtimes(2.0, offset)), btnWidth);
    posOK = posCancel;
    posOK(1.0) = minus(minus(posCancel(1.0), mtimes(2.0, offset)), btnWidth);
    % 799 802
    % 800 802
    posDesc = horzcat(offset, minus(figPos(4.0), mtimes(3.5, offset)), minus(figPos(3.0), mtimes(2.0, offset)), mtimes(2.5, offset));
    strExt = get(ud.descTitle, 'extent');
    posDescTitle = horzcat(mtimes(3.0, offset), minus(plus(posDesc(2.0), posDesc(4.0)), mrdivide(strExt(4.0), 2.0)), strExt(3.0:4.0));
    % 804 806
    posDescText = horzcat(plus(posDesc(1.0), offset), plus(posDesc(2.0), .2), minus(posDesc(3.0), mtimes(2.0, offset)), minus(posDesc(4.0), offset));
    % 806 810
    % 807 810
    % 808 810
    posParam = horzcat(offset, plus(plus(posOK(2.0), posOK(4.0)), offset), minus(figPos(3.0), mtimes(2.0, offset)), minus(minus(posDesc(2.0), posOK(4.0)), mtimes(3.0, offset)));
    % 810 813
    % 811 813
    strExt = get(ud.paramTitle, 'extent');
    posParamTitle = horzcat(mtimes(3.0, offset), minus(plus(posParam(2.0), posParam(4.0)), mrdivide(strExt(4.0), 2.0)), strExt(3.0:4.0));
    % 814 817
    % 815 817
    strExt = get(ud.dsNamePrompt, 'extent');
    posDSNamePrompt = horzcat(plus(posParam(1.0), offset), minus(minus(plus(posParam(4.0), posParam(2.0)), offset), strExt(4.0)), strExt(3.0:4.0));
    % 818 822
    % 819 822
    % 820 822
    strExt = get(ud.dsNameEdit, 'extent');
    posDSNameEdit = horzcat(posDSNamePrompt(1.0), minus(posDSNamePrompt(2.0), btnHeight), minus(posParam(3.0), mtimes(2.0, offset)), btnHeight);
    % 823 828
    % 824 828
    % 825 828
    % 826 828
    strExt = get(ud.selectButton, 'extent');
    posSelectButton = horzcat(minus(plus(posDSNameEdit(1.0), posDSNameEdit(3.0)), strExt(3.0)), posDSNameEdit(2.0), strExt(3.0), btnHeight);
    % 829 833
    % 830 833
    % 831 833
    posDSNameEdit(3.0) = minus(minus(posDSNameEdit(3.0), strExt(3.0)), offset);
    % 833 836
    % 834 836
    strExt = get(ud.dsmSrcPrompt, 'extent');
    posDsmSrcPrompt = horzcat(posDSNameEdit(1.0), minus(minus(posDSNameEdit(2.0), strExt(4.0)), txtMove), strExt(3.0:4.0));
    % 837 840
    % 838 840
    posDsmSrcEdit = horzcat(plus(posDsmSrcPrompt(1.0), posDsmSrcPrompt(3.0)), posDsmSrcPrompt(2.0), minus(minus(posParam(3.0), mtimes(2.0, offset)), posDsmSrcPrompt(3.0)), posDsmSrcPrompt(4.0));
    % 840 846
    % 841 846
    % 842 846
    % 843 846
    % 844 846
    posTsEdit = horzcat(plus(posParam(1.0), offset), plus(posParam(2.0), offset), minus(posParam(3.0), mtimes(2.0, offset)), btnHeight);
    % 846 849
    % 847 849
    strExt = get(ud.tsPrompt, 'extent');
    posTsPrompt = horzcat(posTsEdit(1.0), plus(posTsEdit(2.0), posTsEdit(4.0)), strExt(3.0:4.0));
    % 850 853
    % 851 853
    strExt = get(ud.srcListPrompt, 'extent');
    posSrcListPrompt = horzcat(posDsmSrcPrompt(1.0), minus(minus(posDsmSrcPrompt(2.0), strExt(4.0)), txtMove), strExt(3.0:4.0));
    % 854 859
    % 855 859
    % 856 859
    % 857 859
    strExt = get(ud.srcList, 'extent');
    % 859 861
    posSrcList = horzcat(posSrcListPrompt(1.0), plus(plus(posTsPrompt(2.0), posTsPrompt(4.0)), txtMove), minus(figPos(3.0), mtimes(4.0, offset)), minus(minus(minus(posSrcListPrompt(2.0), posTsPrompt(2.0)), posTsPrompt(4.0)), txtMove));
    % 861 867
    % 862 867
    % 863 867
    % 864 867
    % 865 867
    set(ud.desc, 'Position', posDesc);
    set(ud.descTitle, 'Position', posDescTitle);
    set(ud.descText, 'Position', posDescText);
    set(ud.param, 'Position', posParam);
    set(ud.paramTitle, 'Position', posParamTitle);
    set(ud.dsNamePrompt, 'Position', posDSNamePrompt);
    set(ud.dsNameEdit, 'Position', posDSNameEdit);
    set(ud.selectButton, 'Position', posSelectButton);
    set(ud.dsmSrcPrompt, 'Position', posDsmSrcPrompt);
    set(ud.dsmSrcEdit, 'Position', posDsmSrcEdit);
    set(ud.srcListPrompt, 'Position', posSrcListPrompt);
    set(ud.srcList, 'Position', posSrcList);
    set(ud.tsPrompt, 'Position', posTsPrompt);
    set(ud.tsEdit, 'Position', posTsEdit);
    set(ud.okButton, 'Position', posOK);
    set(ud.cancelButton, 'Position', posCancel);
    set(ud.helpButton, 'Position', posHelp);
    set(ud.applyButton, 'Position', posApply);
    % 884 886
    set(allHdls, 'Units', 'normalized');
end
function doUpdateName(blkHdl)
    % 888 898
    % 889 898
    % 890 898
    % 891 898
    % 892 898
    % 893 898
    % 894 898
    % 895 898
    % 896 898
    hdl = get_param(blkHdl, 'Figure');
    % 898 900
    if ne(hdl, -1.0)
        ud = get(hdl, 'UserData');
        set(hdl, 'Name', horzcat('Block Parameters: ', get_param(blkHdl, 'name')));
        ud.blkHdl = blkHdl;
        set(hdl, 'UserData', ud);
        if strcmp(get_param(blkHdl, 'LinkStatus'), 'none')
            set_param(blkHdl, 'Figure', hdl);
        end
    end
end
function hilitedBlk = doUnHiliteBlocks(hilitedBlk)
    % 910 920
    % 911 920
    % 912 920
    % 913 920
    % 914 920
    % 915 920
    % 916 920
    % 917 920
    % 918 920
    if ne(hilitedBlk.blkHdl, -1.0)
        try
            set_param(hilitedBlk.blkHdl, 'HiliteAncestors', hilitedBlk.origHL);
            % 922 925
            % 923 925
        end % try
        hilitedBlk.blkHdl = -1.0;
        hilitedBlk.origHL = 'none';
    end
end
function doSampleTime(ts, evd)
    % 930 939
    % 931 939
    % 932 939
    % 933 939
    % 934 939
    % 935 939
    % 936 939
    % 937 939
    hdl = get(ts, 'Parent');
    ud = get(hdl, 'UserData');
    % 940 943
    % 941 943
    toggleApply(ud.applyButton);
end
function deleteFcn(fig, evd)
    % 945 954
    % 946 954
    % 947 954
    % 948 954
    % 949 954
    % 950 954
    % 951 954
    % 952 954
    ud = get(fig, 'UserData');
    % 954 956
    doClose(ud.blkHdl);
end
function dsmBlk = findMatchingDSMemBlock(blk, dsName)
    % 958 967
    % 959 967
    % 960 967
    % 961 967
    % 962 967
    % 963 967
    % 964 967
    % 965 967
    dsmBlk = find_system(get_param(blk, 'Parent'), 'SearchDepth', 1.0, 'BlockType', 'DataStoreMemory', 'DataStoreName', dsName);
    % 967 971
    % 968 971
    % 969 971
    if not(isempty(dsmBlk))
        dsmBlk = dsmBlk{1.0};
    else
        blk = get_param(blk, 'Parent');
        if not(strcmp(bdroot(blk), blk))
            dsmBlk = findMatchingDSMemBlock(blk, dsName);
        end
    end
end
function srcName = getDSSrcBlocks(blkHdl)
    % 980 990
    % 981 990
    % 982 990
    % 983 990
    % 984 990
    % 985 990
    % 986 990
    % 987 990
    % 988 990
    dsSrc = get_param(blkHdl, 'DSReadOrWriteSource');
    % 990 992
    srcName = '';
    if gt(length(dsSrc), 0.0)
        for i=1.0:length(dsSrc)
            srcName = vertcat(srcName, cellhorzcat(dsSrc(i).name));
        end % for
    end
end
function hdl = openDialog(blkHdl)
    % 999 1011
    % 1000 1011
    % 1001 1011
    % 1002 1011
    % 1003 1011
    % 1004 1011
    % 1005 1011
    % 1006 1011
    % 1007 1011
    % 1008 1011
    % 1009 1011
    updateDataOnly = 0.0;
    hdl = get_param(blkHdl, 'Figure');
    if not(isempty(hdl)) && ishandle(hdl) && ne(hdl, -1.0)
        figure(hdl);
        updateDataOnly = 1.0;
    end
    % 1016 1021
    % 1017 1021
    % 1018 1021
    % 1019 1021
    if not(updateDataOnly)
        hdl = createDialog(blkHdl);
    end
    % 1023 1025
    ud = get(hdl, 'UserData');
    % 1025 1027
    if not(strcmp(get_param(bdroot(blkHdl), 'Lock'), 'on'))
        % 1027 1029
        set(ud.dsNameEdit, 'String', get_param(blkHdl, 'DataStoreName'));
        % 1029 1032
        % 1030 1032
        doRefreshSrcList(ud.dsNameEdit, []);
    end
    % 1033 1036
    % 1034 1036
    set(hdl, 'visible', 'on');
end
function returnKeyOK(fig, evd)
    % 1038 1048
    % 1039 1048
    % 1040 1048
    % 1041 1048
    % 1042 1048
    % 1043 1048
    % 1044 1048
    % 1045 1048
    % 1046 1048
    ud = get(fig, 'UserData');
    % 1048 1050
    if not(isempty(get(fig, 'CurrentChar')))
        if eq(abs(get(fig, 'CurrentChar')), 13.0)
            if strcmp(get(ud.okButton, 'Enable'), 'on')
                doOK(ud.okButton, []);
            end
        end
    end
end
function toggleApply(varargin)
    % 1058 1067
    % 1059 1067
    % 1060 1067
    % 1061 1067
    % 1062 1067
    % 1063 1067
    % 1064 1067
    % 1065 1067
    if eq(nargin, 1.0)
        set(varargin{1.0}, 'Enable', 'on');
    else
        if eq(nargin, 2.0)
            set(varargin{1.0}, 'Enable', varargin{2.0});
        end
    end
end
