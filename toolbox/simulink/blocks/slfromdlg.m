function varargout = slfromdlg(varargin)
    % 1 18
    % 2 18
    % 3 18
    % 4 18
    % 5 18
    % 6 18
    % 7 18
    % 8 18
    % 9 18
    % 10 18
    % 11 18
    % 12 18
    % 13 18
    % 14 18
    % 15 18
    % 16 18
    hdl = -1.0;
    switch nargin
    case 1.0
        % 20 25
        % 21 25
        % 22 25
        % 23 25
        blkHdl = varargin{1.0};
        hdl = openDialog(blkHdl);
    case 2.0
        % 27 32
        % 28 32
        % 29 32
        % 30 32
        blkHdl = varargin{2.0};
        switch lower(varargin{1.0})
        case 'delete'
            doClose(blkHdl);
        case 'namechange'
            doUpdateName(blkHdl);
        otherwise
            error('Simulink:Dialog', sprintf(horzcat('Invalid command "', varargin{1.0}, '" for From block parameter dialog.')));
            % 39 42
            % 40 42
        end
    case 3.0
        % 43 45
        if strcmp(varargin{1.0}, 'get')
            blkHdl = varargin{2.0};
            hdl = get_param(blkHdl, 'Figure');
            ud = get(hdl, 'UserData');
            varargout = {};
            switch varargin{3.0}
            case 0.0
                varargout{1.0} = sl('deblankall', get(ud.gotoTagEdit, 'String'));
                % 52 54
            end
            return
        end
    case 4.0
        if strcmp(varargin{1.0}, 'set')
            blkHdl = varargin{2.0};
            hdl = get_param(blkHdl, 'Figure');
            ud = get(hdl, 'UserData');
            switch varargin{4.0}
            case 0.0
                set(ud.gotoTagEdit, 'String', sl('deblankall', varargin{3.0}));
                doGotoTag(ud.gotoTagEdit, []);
                % 65 67
            end
            return
        end
    otherwise
        error(horzcat('Invalid number of arguments ', num2str(nargin)));
    end
    % 72 74
    if nargout
        varargout{1.0} = hdl;
    end
end
function hdl = createDialog(blkHdl)
    % 78 88
    % 79 88
    % 80 88
    % 81 88
    % 82 88
    % 83 88
    % 84 88
    % 85 88
    % 86 88
    objBGColor = get(0.0, 'defaultuicontrolbackgroundcolor');
    % 88 93
    % 89 93
    % 90 93
    % 91 93
    dialogPos = [1.0 1.0 400.0 300.0];
    % 93 95
    hdl = figure('numbertitle', 'off', 'name', horzcat('Block Parameters: ', get_param(blkHdl, 'name')), 'menubar', 'none', 'visible', 'off', 'HandleVisibility', 'callback', 'IntegerHandle', 'off', 'color', objBGColor, 'Units', 'pixels', 'Position', dialogPos, 'Resize', 'on');
    % 95 108
    % 96 108
    % 97 108
    % 98 108
    % 99 108
    % 100 108
    % 101 108
    % 102 108
    % 103 108
    % 104 108
    % 105 108
    % 106 108
    tmpText = uicontrol(hdl, 'style', 'text', 'fontunit', 'pixel', 'visible', 'off', 'string', 'www');
    % 108 112
    % 109 112
    % 110 112
    strExt = get(tmpText, 'extent');
    pixelRatio = mrdivide(get(tmpText, 'fontsize'), 10.667);
    delete(tmpText);
    dialogPos(3.0:4.0) = mtimes(dialogPos(3.0:4.0), pixelRatio);
    set(hdl, 'Position', dialogPos);
    % 116 119
    % 117 119
    set(hdl, 'KeyPressFcn', cellhorzcat(@returnKeyOK));
    set(hdl, 'DeleteFcn', cellhorzcat(@deleteFcn));
    % 120 123
    % 121 123
    ud.blkHdl = blkHdl;
    ud.hdl = hdl;
    % 124 127
    % 125 127
    ud.desc = uicontrol(hdl, 'style', 'frame', 'enable', 'inactive', 'backgroundcolor', objBGColor, 'foregroundcolor', [1.0 .984313725490196 .9411764705882353]);
    % 127 134
    % 128 134
    % 129 134
    % 130 134
    % 131 134
    % 132 134
    ud.descTitle = uicontrol(hdl, 'style', 'text', 'backgroundcolor', objBGColor, 'string', 'From');
    % 134 140
    % 135 140
    % 136 140
    % 137 140
    % 138 140
    descStr = 'Receive signals from the Goto block with the specified tag. If the tag is defined as ''scoped'' in the Goto block, then a Goto Tag Visibility block must be used to define the visibility of the tag.  After ''Update Diagram'', the block icon displays the selected tag name (local tags are enclosed in brackets, [], and scoped tag names are enclosed in braces, {}).';
    % 140 148
    % 141 148
    % 142 148
    % 143 148
    % 144 148
    % 145 148
    % 146 148
    ud.descText = uicontrol(hdl, 'style', 'text', 'backgroundcolor', objBGColor, 'max', 2.0, 'min', 0.0, 'horizontalalignment', 'left', 'value', [], 'string', sprintf(descStr));
    % 148 159
    % 149 159
    % 150 159
    % 151 159
    % 152 159
    % 153 159
    % 154 159
    % 155 159
    % 156 159
    % 157 159
    ud.param = uicontrol(hdl, 'style', 'frame', 'backgroundcolor', objBGColor, 'enable', 'inactive', 'foregroundcolor', [1.0 .984313725490196 .9411764705882353]);
    % 159 166
    % 160 166
    % 161 166
    % 162 166
    % 163 166
    % 164 166
    ud.paramTitle = uicontrol(hdl, 'style', 'text', 'backgroundcolor', objBGColor, 'string', 'Parameters');
    % 166 173
    % 167 173
    % 168 173
    % 169 173
    % 170 173
    % 171 173
    ud.gotoTagPrompt = uicontrol(hdl, 'style', 'text', 'backgroundcolor', objBGColor, 'string', 'Goto tag: ');
    % 173 179
    % 174 179
    % 175 179
    % 176 179
    % 177 179
    gotoTag = get_param(blkHdl, 'GotoTag');
    ud.gotoTagEdit = uicontrol(hdl, 'style', 'edit', 'backgroundcolor', [1.0 1.0 1.0], 'horizontalalignment', 'left', 'string', gotoTag, 'callback', cellhorzcat(@doGotoTag));
    % 180 189
    % 181 189
    % 182 189
    % 183 189
    % 184 189
    % 185 189
    % 186 189
    % 187 189
    ud.cmenu = uicontextmenu('Parent', hdl, 'Callback', cellhorzcat(@doContextMenu));
    % 189 192
    % 190 192
    ud.browseButton = uicontrol(hdl, 'Style', 'pushbutton', 'backgroundcolor', objBGColor, 'string', 'Select tag >>', 'Visible', 'on', 'Uicontextmenu', ud.cmenu, 'Callback', cellhorzcat(@doBrowse));
    % 192 202
    % 193 202
    % 194 202
    % 195 202
    % 196 202
    % 197 202
    % 198 202
    % 199 202
    % 200 202
    ud.gotoSrcPrompt = uicontrol(hdl, 'style', 'text', 'backgroundcolor', objBGColor, 'string', 'Goto source: ');
    % 202 208
    % 203 208
    % 204 208
    % 205 208
    % 206 208
    gotoSrc = get_param(blkHdl, 'GotoBlock');
    gotoSrcName = gotoSrc.name;
    if not(isempty(gotoSrc.name))
        gotoSrcName = strrep(gotoSrc.name, sprintf('\n'), ' ');
    end
    ud.gotoSrcEdit = uicontrol(hdl, 'style', 'text', 'horizontalalignment', 'left', 'Tooltip', 'Click to locate the block', 'Foregroundcolor', 'Blue', 'Enable', 'inactive', 'string', gotoSrcName);
    % 213 221
    % 214 221
    % 215 221
    % 216 221
    % 217 221
    % 218 221
    % 219 221
    if not(strcmp(get_param(bdroot(blkHdl), 'Lock'), 'on'))
        set(ud.gotoSrcEdit, 'ButtonDownFcn', cellhorzcat(@doFind));
    end
    % 223 226
    % 224 226
    ud.okButton = uicontrol(hdl, 'Style', 'pushbutton', 'backgroundcolor', objBGColor, 'String', 'OK', 'Callback', cellhorzcat(@doOK));
    % 226 233
    % 227 233
    % 228 233
    % 229 233
    % 230 233
    % 231 233
    ud.cancelButton = uicontrol(hdl, 'Style', 'pushbutton', 'Backgroundcolor', objBGColor, 'String', 'Cancel', 'Callback', cellhorzcat(@doCancel));
    % 233 240
    % 234 240
    % 235 240
    % 236 240
    % 237 240
    % 238 240
    ud.helpButton = uicontrol(hdl, 'Style', 'pushbutton', 'Backgroundcolor', objBGColor, 'Enable', 'on', 'String', 'Help', 'Callback', cellhorzcat(@doHelp));
    % 240 248
    % 241 248
    % 242 248
    % 243 248
    % 244 248
    % 245 248
    % 246 248
    ud.applyButton = uicontrol(hdl, 'Style', 'pushbutton', 'backgroundcolor', objBGColor, 'Enable', 'off', 'String', 'Apply', 'Callback', cellhorzcat(@doApply));
    % 248 257
    % 249 257
    % 250 257
    % 251 257
    % 252 257
    % 253 257
    % 254 257
    % 255 257
    ud.origSize = [0.0 0.0];
    ud.hilitedBlk.blkHdl = -1.0;
    ud.hilitedBlk.origHL = 'none';
    set(hdl, 'UserData', ud);
    % 260 263
    % 261 263
    doResize(hdl, []);
    % 263 266
    % 264 266
    set(hdl, 'Units', 'pixels');
    dialogPos = get(hdl, 'Position');
    bdPos = get_param(get_param(blkHdl, 'Parent'), 'Location');
    blkPos = get_param(blkHdl, 'Position');
    bdPos = horzcat(plus(bdPos(1.0:2.0), blkPos(1.0:2.0)), plus(plus(bdPos(1.0:2.0), blkPos(1.0:2.0)), blkPos(3.0:4.0)));
    % 270 272
    hgPos = sl('rectconv', bdPos, 'hg');
    dialogPos(1.0) = plus(hgPos(1.0), minus(hgPos(3.0), dialogPos(3.0)));
    dialogPos(2.0) = plus(hgPos(2.0), minus(hgPos(4.0), dialogPos(4.0)));
    % 274 277
    % 275 277
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
    % 296 303
    % 297 303
    % 298 303
    % 299 303
    % 300 303
    % 301 303
    UiControls = vertcat(horzcat(ud.gotoTagPrompt), horzcat(ud.gotoTagEdit), horzcat(ud.gotoSrcPrompt), horzcat(ud.browseButton), horzcat(ud.gotoSrcEdit), horzcat(ud.okButton), horzcat(ud.applyButton));
    % 303 305
    if strcmp(get_param(blkHdl, 'LinkStatus'), 'none') && not(strcmp(get_param(bdroot(blkHdl), 'Lock'), 'on'))
        % 305 307
        set_param(blkHdl, 'Figure', hdl);
    else
        set(UiControls, 'enable', 'off');
    end
end
function applyNoError = doApply(applyButton, evd)
    % 312 321
    % 313 321
    % 314 321
    % 315 321
    % 316 321
    % 317 321
    % 318 321
    % 319 321
    hdl = get(applyButton, 'Parent');
    ud = get(hdl, 'UserData');
    % 322 325
    % 323 325
    ud.hilitedBlk = doUnHiliteBlocks(ud.hilitedBlk);
    errmsg = '';
    lasterr('');
    % 327 329
    applyNoError = 1.0;
    set_param(ud.blkHdl, 'Figure', -1.0);
    prevTag = get_param(ud.blkHdl, 'GotoTag');
    try
        set_param(ud.blkHdl, 'GotoTag', sl('deblankall', get(ud.gotoTagEdit, 'String')));
        % 333 335
        ud = doRefresh(ud);
    catch
        applyNoError = 0.0;
        try
            % 338 340
            set_param(ud.blkHdl, 'GotoTag', prevTag);
            % 340 342
        end % try
        errmsg = vertcat(errmsg, cellhorzcat(lasterr));
    end % try
    set_param(ud.blkHdl, 'Figure', hdl);
    % 345 347
    if applyNoError
        % 347 349
        toggleApply(applyButton, 'off');
    end
    % 350 352
    set(hdl, 'UserData', ud);
    if not(isempty(errmsg))
        errordlg(errmsg, 'Error message: Data Store Block', 'modal');
    end
end
function doBrowse(browseButton, evd)
    % 357 367
    % 358 367
    % 359 367
    % 360 367
    % 361 367
    % 362 367
    % 363 367
    % 364 367
    % 365 367
    hdl = get(browseButton, 'Parent');
    ud = get(hdl, 'UserData');
    % 368 370
    doContextMenu(ud.cmenu, []);
end
function doContextMenu(cmenu, evd)
    % 372 381
    % 373 381
    % 374 381
    % 375 381
    % 376 381
    % 377 381
    % 378 381
    % 379 381
    hdl = get(cmenu, 'Parent');
    ud = get(hdl, 'UserData');
    % 382 385
    % 383 385
    delete(get(ud.cmenu, 'Children'));
    % 385 387
    if strcmp(get_param(ud.blkHdl, 'LinkStatus'), 'none') && not(strcmp(get_param(bdroot(ud.blkHdl), 'Lock'), 'on'))
        % 387 389
        enableState = 'on';
        % 389 392
        % 390 392
        gotoBlks = find_system(bdroot(ud.blkHdl), 'LookUnderMasks', 'on', 'FollowLinks', 'on', 'BlockType', 'Goto');
        % 392 394
        currentGotoTag = get_param(ud.blkHdl, 'GotoTag');
        % 394 396
        for i=1.0:length(gotoBlks)
            gotoTag = get_param(gotoBlks(i), 'GotoTag');
            if isempty(findobj(ud.cmenu, 'Label', horzcat('   ', gotoTag)))
                item = uimenu(ud.cmenu, 'Label', horzcat('   ', gotoTag), 'Enable', enableState, 'callback', cellhorzcat(@doSelectTag));
                % 399 403
                % 400 403
                % 401 403
                if strcmp(currentGotoTag, gotoTag)
                    set(item, 'Checked', 'on');
                end
            end
        end % for
        % 407 409
        menuChildren = get(ud.cmenu, 'children');
        if gt(length(menuChildren), 1.0)
            [s, idx] = sort(get(menuChildren, 'Label'));
            set(ud.cmenu, 'children', menuChildren(flipud(idx)));
        else
            set(ud.cmenu, 'children', menuChildren);
        end
        % 415 418
        % 416 418
        prevUnit = get(ud.browseButton, 'Units');
        set(ud.browseButton, 'Units', 'pixels');
        browseButtonPos = get(ud.browseButton, 'Position');
        set(ud.cmenu, 'Position', plus(browseButtonPos(1.0:2.0), browseButtonPos(3.0:4.0)));
        set(ud.cmenu, 'Visible', 'on');
        set(ud.browseButton, 'Units', prevUnit);
    end
end
function doCancel(cancelButton, evd)
    % 426 435
    % 427 435
    % 428 435
    % 429 435
    % 430 435
    % 431 435
    % 432 435
    % 433 435
    hdl = get(cancelButton, 'Parent');
    ud = get(hdl, 'UserData');
    % 436 439
    % 437 439
    ud.hilitedBlk = doUnHiliteBlocks(ud.hilitedBlk);
    % 439 441
    set(hdl, 'Visible', 'off');
    set(hdl, 'UserData', ud);
    % 442 444
    if not(strcmp(get_param(bdroot(ud.blkHdl), 'Lock'), 'on'))
        warningState = vertcat(warning, warning('query', 'backtrace'));
        warning('off', 'backtrace');
        warning('on');
        set_param(ud.blkHdl, 'Figure', -1.0);
        set(ud.gotoTagEdit, 'String', get_param(ud.blkHdl, 'GotoTag'));
        set_param(ud.blkHdl, 'Figure', hdl);
        warning(warningState);
    end
end
function doClose(blkHdl)
    % 454 463
    % 455 463
    % 456 463
    % 457 463
    % 458 463
    % 459 463
    % 460 463
    % 461 463
    if ne(get_param(blkHdl, 'Figure'), -1.0)
        hdl = get_param(blkHdl, 'Figure');
        if not(isempty(hdl)) && ishandle(hdl)
            ud = get(hdl, 'UserData');
            % 466 469
            % 467 469
            ud.hilitedBlk = doUnHiliteBlocks(ud.hilitedBlk);
            % 469 471
            if not(strcmp(get_param(bdroot(blkHdl), 'Lock'), 'on'))
                delete(hdl);
                set_param(blkHdl, 'Figure', -1.0);
            end
        end
    end
end
function doFind(obj, evd)
    % 478 487
    % 479 487
    % 480 487
    % 481 487
    % 482 487
    % 483 487
    % 484 487
    % 485 487
    hdl = get(obj, 'Parent');
    ud = get(hdl, 'UserData');
    % 488 490
    if strcmp(get(hdl, 'SelectionType'), 'alt')
        % 490 492
        return
    end
    % 493 495
    ud.hilitedBlk = doUnHiliteBlocks(ud.hilitedBlk);
    % 495 497
    gotoSrc = get(ud.gotoSrcEdit, 'String');
    if not(isempty(deblank(gotoSrc)))
        try
            % 499 501
            ud.hilitedBlk.origHL = get_param(gotoSrc, 'HiliteAncestors');
            hilite_system(gotoSrc, 'find');
            ud.hilitedBlk.blkHdl = gotoSrc;
        catch
            msg = horzcat('Unable to find Goto block named: "', gotoSrc, '". ', lasterr);
            msgbox(msg, 'Goto Source Locating Message', 'modal');
        end % try
    end
    % 508 510
    set(hdl, 'UserData', ud);
end
function doGotoTag(gotoTag, evd)
    % 512 521
    % 513 521
    % 514 521
    % 515 521
    % 516 521
    % 517 521
    % 518 521
    % 519 521
    hdl = get(gotoTag, 'Parent');
    ud = get(hdl, 'UserData');
    % 522 525
    % 523 525
    if strcmp(get(ud.gotoTagEdit, 'String'), get_param(ud.blkHdl, 'GotoTag'))
        doRefresh(ud);
    end
    % 527 530
    % 528 530
    toggleApply(ud.applyButton);
end
function doHelp(helpButton, evd)
    % 532 541
    % 533 541
    % 534 541
    % 535 541
    % 536 541
    % 537 541
    % 538 541
    % 539 541
    hdl = get(helpButton, 'Parent');
    ud = get(hdl, 'UserData');
    slhelp(ud.blkHdl);
end
function doOK(okButton, evd)
    % 545 555
    % 546 555
    % 547 555
    % 548 555
    % 549 555
    % 550 555
    % 551 555
    % 552 555
    % 553 555
    hdl = get(okButton, 'Parent');
    ud = get(hdl, 'UserData');
    % 556 558
    if doApply(ud.applyButton, evd)
        % 558 560
        ud.hilitedBlk = doUnHiliteBlocks(ud.hilitedBlk);
        % 560 562
        set(hdl, 'Visible', 'off');
        set(hdl, 'UserData', ud);
    end
end
function ud = doRefresh(ud)
    % 566 576
    % 567 576
    % 568 576
    % 569 576
    % 570 576
    % 571 576
    % 572 576
    % 573 576
    % 574 576
    set(ud.gotoTagEdit, 'String', get_param(ud.blkHdl, 'GotoTag'));
    % 576 579
    % 577 579
    gotoSrc = get_param(ud.blkHdl, 'GotoBlock');
    gotoSrcName = gotoSrc.name;
    if not(isempty(gotoSrc.name))
        gotoSrcName = strrep(gotoSrc.name, sprintf('\n'), ' ');
    end
    set(ud.gotoSrcEdit, 'String', gotoSrcName);
end
function doResize(hdl, evd)
    % 586 601
    % 587 601
    % 588 601
    % 589 601
    % 590 601
    % 591 601
    % 592 601
    % 593 601
    % 594 601
    % 595 601
    % 596 601
    % 597 601
    % 598 601
    % 599 601
    ud = get(hdl, 'UserData');
    % 601 603
    set(hdl, 'Units', 'pixels');
    figPos = get(hdl, 'Position');
    % 604 607
    % 605 607
    tmpText = uicontrol(hdl, 'style', 'text', 'visible', 'off', 'fontunit', 'pixel', 'string', 'www');
    % 607 609
    strExt = get(tmpText, 'extent');
    pixelRatio = mrdivide(get(tmpText, 'fontsize'), 10.667);
    delete(tmpText);
    if ne(ud.origSize, [0.0 0.0])
        if lt(figPos(3.0), ud.origSize(1.0)) || lt(figPos(4.0), mtimes(300.0, pixelRatio))
            set(hdl, 'Units', 'normalized');
            return
        end
    end
    % 617 619
    allHdls = horzcat(hdl, ud.desc, ud.descTitle, ud.descText, ud.param, ud.paramTitle, ud.gotoTagPrompt, ud.gotoTagEdit, ud.browseButton, ud.gotoSrcPrompt, ud.gotoSrcEdit, ud.okButton, ud.cancelButton, ud.helpButton, ud.applyButton);
    % 619 623
    % 620 623
    % 621 623
    set(allHdls, 'Units', 'characters');
    % 623 625
    offset = 1.0;
    btnWidth = 12.0;
    btnHeight = 1.75;
    txtMove = .5;
    % 628 630
    figPos = get(hdl, 'Position');
    % 630 633
    % 631 633
    posApply = horzcat(minus(minus(figPos(3.0), offset), btnWidth), offset, btnWidth, btnHeight);
    posHelp = posApply;
    posHelp(1.0) = minus(minus(posApply(1.0), mtimes(2.0, offset)), btnWidth);
    posCancel = posHelp;
    posCancel(1.0) = minus(minus(posHelp(1.0), mtimes(2.0, offset)), btnWidth);
    posOK = posCancel;
    posOK(1.0) = minus(minus(posCancel(1.0), mtimes(2.0, offset)), btnWidth);
    % 639 642
    % 640 642
    posDesc = horzcat(offset, minus(figPos(4.0), mtimes(8.0, offset)), minus(figPos(3.0), mtimes(2.0, offset)), mtimes(7.0, offset));
    strExt = get(ud.descTitle, 'extent');
    posDescTitle = horzcat(mtimes(3.0, offset), minus(plus(posDesc(2.0), posDesc(4.0)), mrdivide(strExt(4.0), 2.0)), strExt(3.0:4.0));
    % 644 646
    posDescText = horzcat(plus(posDesc(1.0), offset), plus(posDesc(2.0), .2), minus(posDesc(3.0), mtimes(2.0, offset)), minus(posDesc(4.0), offset));
    % 646 650
    % 647 650
    % 648 650
    posParam = horzcat(offset, plus(plus(posOK(2.0), posOK(4.0)), offset), minus(figPos(3.0), mtimes(2.0, offset)), minus(minus(posDesc(2.0), posOK(4.0)), mtimes(3.0, offset)));
    % 650 653
    % 651 653
    strExt = get(ud.paramTitle, 'extent');
    posParamTitle = horzcat(mtimes(3.0, offset), minus(plus(posParam(2.0), posParam(4.0)), mrdivide(strExt(4.0), 2.0)), strExt(3.0:4.0));
    % 654 658
    % 655 658
    % 656 658
    strExt = get(ud.gotoTagPrompt, 'extent');
    posGotoTagPrompt = horzcat(plus(posParam(1.0), offset), minus(minus(plus(posParam(4.0), posParam(2.0)), txtMove), strExt(4.0)), strExt(3.0:4.0));
    % 659 663
    % 660 663
    % 661 663
    strExt = get(ud.gotoTagEdit, 'extent');
    posGotoTagEdit = horzcat(posGotoTagPrompt(1.0), minus(posGotoTagPrompt(2.0), btnHeight), minus(posParam(3.0), mtimes(3.0, offset)), btnHeight);
    % 664 669
    % 665 669
    % 666 669
    % 667 669
    strExt = get(ud.browseButton, 'extent');
    posBrowseButton = horzcat(plus(plus(posGotoTagEdit(1.0), posGotoTagEdit(3.0)), offset), posGotoTagEdit(2.0), strExt(3.0), btnHeight);
    % 670 672
    posGotoTagEdit(3.0) = minus(posGotoTagEdit(3.0), strExt(3.0));
    posBrowseButton(1.0) = minus(posBrowseButton(1.0), strExt(3.0));
    % 673 676
    % 674 676
    strExt = get(ud.gotoSrcPrompt, 'extent');
    posGotoSrcPrompt = horzcat(posGotoTagEdit(1.0), minus(minus(posGotoTagEdit(2.0), strExt(4.0)), txtMove), strExt(3.0:4.0));
    % 677 681
    % 678 681
    % 679 681
    strExt = get(ud.gotoSrcEdit, 'extent');
    posGotoSrcEdit = horzcat(plus(posGotoSrcPrompt(1.0), posGotoSrcPrompt(3.0)), posGotoSrcPrompt(2.0), minus(minus(figPos(3.0), mtimes(5.0, offset)), posGotoSrcPrompt(3.0)), posGotoSrcPrompt(4.0));
    % 682 687
    % 683 687
    % 684 687
    % 685 687
    set(ud.desc, 'Position', posDesc);
    set(ud.descTitle, 'Position', posDescTitle);
    set(ud.descText, 'Position', posDescText);
    set(ud.param, 'Position', posParam);
    set(ud.paramTitle, 'Position', posParamTitle);
    set(ud.gotoTagPrompt, 'Position', posGotoTagPrompt);
    set(ud.gotoTagEdit, 'Position', posGotoTagEdit);
    set(ud.browseButton, 'Position', posBrowseButton);
    set(ud.gotoSrcPrompt, 'Position', posGotoSrcPrompt);
    set(ud.gotoSrcEdit, 'Position', posGotoSrcEdit);
    set(ud.okButton, 'Position', posOK);
    set(ud.cancelButton, 'Position', posCancel);
    set(ud.helpButton, 'Position', posHelp);
    set(ud.applyButton, 'Position', posApply);
    % 700 702
    set(allHdls, 'Units', 'normalized');
end
function doUpdateName(blkHdl)
    % 704 714
    % 705 714
    % 706 714
    % 707 714
    % 708 714
    % 709 714
    % 710 714
    % 711 714
    % 712 714
    hdl = get_param(blkHdl, 'Figure');
    % 714 716
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
    % 726 736
    % 727 736
    % 728 736
    % 729 736
    % 730 736
    % 731 736
    % 732 736
    % 733 736
    % 734 736
    if ne(hilitedBlk.blkHdl, -1.0)
        try
            set_param(hilitedBlk.blkHdl, 'HiliteAncestors', hilitedBlk.origHL);
            % 738 741
            % 739 741
        end % try
        hilitedBlk.blkHdl = -1.0;
        hilitedBlk.origHL = 'none';
    end
end
function doSelectTag(item, evd)
    % 746 755
    % 747 755
    % 748 755
    % 749 755
    % 750 755
    % 751 755
    % 752 755
    % 753 755
    hdl = get(get(item, 'Parent'), 'Parent');
    ud = get(hdl, 'UserData');
    % 756 758
    set(ud.gotoTagEdit, 'String', sl('deblankall', get(item, 'Label')));
    % 758 761
    % 759 761
    if strcmp(get(ud.gotoTagEdit, 'String'), get_param(ud.blkHdl, 'GotoTag'))
        doRefresh(ud);
    else
        set(ud.gotoSrcEdit, 'String', '');
    end
    % 765 768
    % 766 768
    toggleApply(ud.applyButton);
end
function hdl = openDialog(blkHdl)
    % 770 782
    % 771 782
    % 772 782
    % 773 782
    % 774 782
    % 775 782
    % 776 782
    % 777 782
    % 778 782
    % 779 782
    % 780 782
    updateDataOnly = 0.0;
    hdl = get_param(blkHdl, 'Figure');
    if not(isempty(hdl)) && ishandle(hdl) && ne(hdl, -1.0)
        updateDataOnly = 1.0;
    end
    % 786 791
    % 787 791
    % 788 791
    % 789 791
    if not(updateDataOnly)
        hdl = createDialog(blkHdl);
    end
    % 793 795
    ud = get(hdl, 'UserData');
    if not(strcmp(get_param(bdroot(blkHdl), 'Lock'), 'on'))
        % 796 798
        ud = doRefresh(ud);
    end
    set(hdl, 'UserData', ud);
    % 800 803
    % 801 803
    set(hdl, 'visible', 'on');
end
function deleteFcn(fig, evd)
    % 805 814
    % 806 814
    % 807 814
    % 808 814
    % 809 814
    % 810 814
    % 811 814
    % 812 814
    ud = get(fig, 'UserData');
    % 814 816
    doClose(ud.blkHdl);
end
function returnKeyOK(fig, evd)
    % 818 828
    % 819 828
    % 820 828
    % 821 828
    % 822 828
    % 823 828
    % 824 828
    % 825 828
    % 826 828
    ud = get(fig, 'UserData');
    % 828 830
    if not(isempty(get(fig, 'CurrentChar')))
        if eq(abs(get(fig, 'CurrentChar')), 13.0)
            if strcmp(get(ud.okButton, 'Enable'), 'on')
                doOK(ud.okButton, []);
            end
        end
    end
end
function toggleApply(varargin)
    % 838 847
    % 839 847
    % 840 847
    % 841 847
    % 842 847
    % 843 847
    % 844 847
    % 845 847
    if eq(nargin, 1.0)
        set(varargin{1.0}, 'Enable', 'on');
    else
        if eq(nargin, 2.0)
            set(varargin{1.0}, 'Enable', varargin{2.0});
        end
    end
end
