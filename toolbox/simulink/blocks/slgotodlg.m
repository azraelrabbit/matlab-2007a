function varargout = slgotodlg(varargin)
    % 1 19
    % 2 19
    % 3 19
    % 4 19
    % 5 19
    % 6 19
    % 7 19
    % 8 19
    % 9 19
    % 10 19
    % 11 19
    % 12 19
    % 13 19
    % 14 19
    % 15 19
    % 16 19
    % 17 19
    hdl = -1.0;
    switch nargin
    case 1.0
        % 21 26
        % 22 26
        % 23 26
        % 24 26
        blkHdl = varargin{1.0};
        hdl = openDialog(blkHdl);
    case 2.0
        % 28 33
        % 29 33
        % 30 33
        % 31 33
        blkHdl = varargin{2.0};
        switch lower(varargin{1.0})
        case 'delete'
            doClose(blkHdl);
        case 'namechange'
            doUpdateName(blkHdl);
        otherwise
            error('Simulink:Dialog', sprintf(horzcat('Invalid command "', varargin{1.0}, '" for Goto block parameter dialog.')));
            % 40 43
            % 41 43
        end
    case 3.0
        % 44 46
        if strcmp(varargin{1.0}, 'get')
            blkHdl = varargin{2.0};
            hdl = get_param(blkHdl, 'Figure');
            ud = get(hdl, 'UserData');
            varargout = {};
            switch varargin{3.0}
            case 0.0
                varargout{1.0} = sl('deblankall', get(ud.gotoTagEdit, 'String'));
            case 1.0
                % 54 57
                % 55 57
                varargout{1.0} = minus(get(ud.tagVisPopup, 'Value'), 1.0);
            end
            % 58 60
            return
        end
    case 4.0
        % 62 64
        if strcmp(varargin{1.0}, 'set')
            blkHdl = varargin{2.0};
            hdl = get_param(blkHdl, 'Figure');
            ud = get(hdl, 'UserData');
            switch varargin{4.0}
            case 0.0
                set(ud.gotoTagEdit, 'String', sl('deblankall', varargin{3.0}));
                doGotoTag(ud.gotoTagEdit, []);
            case 1.0
                % 72 76
                % 73 76
                % 74 76
                set(ud.tagVisPopup, 'Value', plus(varargin{3.0}, 1.0));
                doTagVis(ud.tagVisPopup, []);
            end
            % 78 80
            return
        end
    otherwise
        % 82 84
        error(horzcat('Invalid number of arguments ', num2str(nargin)));
    end
    % 85 87
    if nargout
        varargout{1.0} = hdl;
    end
end
function hdl = createDialog(blkHdl)
    % 91 101
    % 92 101
    % 93 101
    % 94 101
    % 95 101
    % 96 101
    % 97 101
    % 98 101
    % 99 101
    objBGColor = get(0.0, 'defaultuicontrolbackgroundcolor');
    % 101 106
    % 102 106
    % 103 106
    % 104 106
    dialogPos = [1.0 1.0 350.0 380.0];
    % 106 108
    hdl = figure('numbertitle', 'off', 'name', horzcat('Block Parameters: ', get_param(blkHdl, 'name')), 'menubar', 'none', 'visible', 'off', 'HandleVisibility', 'callback', 'IntegerHandle', 'off', 'color', objBGColor, 'Units', 'pixels', 'Position', dialogPos, 'Resize', 'on');
    % 108 121
    % 109 121
    % 110 121
    % 111 121
    % 112 121
    % 113 121
    % 114 121
    % 115 121
    % 116 121
    % 117 121
    % 118 121
    % 119 121
    tmpText = uicontrol(hdl, 'style', 'text', 'fontunit', 'pixel', 'visible', 'off', 'string', 'www');
    % 121 125
    % 122 125
    % 123 125
    strExt = get(tmpText, 'extent');
    pixelRatio = mrdivide(get(tmpText, 'fontsize'), 10.667);
    delete(tmpText);
    dialogPos(3.0:4.0) = mtimes(dialogPos(3.0:4.0), pixelRatio);
    set(hdl, 'Position', dialogPos);
    % 129 132
    % 130 132
    set(hdl, 'KeyPressFcn', cellhorzcat(@returnKeyOK));
    set(hdl, 'DeleteFcn', cellhorzcat(@deleteFcn));
    % 133 136
    % 134 136
    ud.blkHdl = blkHdl;
    ud.hdl = hdl;
    % 137 140
    % 138 140
    ud.desc = uicontrol(hdl, 'style', 'frame', 'backgroundcolor', objBGColor, 'enable', 'inactive', 'foregroundcolor', [1.0 .984313725490196 .9411764705882353]);
    % 140 147
    % 141 147
    % 142 147
    % 143 147
    % 144 147
    % 145 147
    ud.descTitle = uicontrol(hdl, 'style', 'text', 'backgroundcolor', objBGColor, 'string', 'Goto');
    % 147 153
    % 148 153
    % 149 153
    % 150 153
    % 151 153
    descStr = 'Send signals to From blocks that have the specified tag. If tag visibility is ''scoped'', then a Goto Tag Visibility block must be used to define the visibility of the tag. The block icon displays the selected tag name (local tags are enclosed in brackets, [], and scoped tag names are enclosed in braces, {}).';
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
    ud.param = uicontrol(hdl, 'style', 'frame', 'enable', 'inactive', 'backgroundcolor', objBGColor, 'foregroundcolor', [1.0 .984313725490196 .9411764705882353]);
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
    ud.gotoTagPrompt = uicontrol(hdl, 'style', 'text', 'backgroundcolor', objBGColor, 'string', 'Tag: ');
    % 184 190
    % 185 190
    % 186 190
    % 187 190
    % 188 190
    gotoTag = get_param(blkHdl, 'GotoTag');
    ud.gotoTagEdit = uicontrol(hdl, 'style', 'edit', 'backgroundcolor', [1.0 1.0 1.0], 'horizontalalignment', 'left', 'string', gotoTag, 'callback', cellhorzcat(@doGotoTag));
    % 191 200
    % 192 200
    % 193 200
    % 194 200
    % 195 200
    % 196 200
    % 197 200
    % 198 200
    ud.tagVisPrompt = uicontrol(hdl, 'style', 'text', 'backgroundcolor', objBGColor, 'string', 'Tag visibility: ');
    % 200 206
    % 201 206
    % 202 206
    % 203 206
    % 204 206
    ud.tagVisPopup = uicontrol(hdl, 'style', 'Popup', 'horizontalalignment', 'left', 'string', 'local|scoped|global', 'callback', cellhorzcat(@doTagVis));
    % 206 212
    % 207 212
    % 208 212
    % 209 212
    % 210 212
    if ispc
        set(ud.tagVisPopup, 'backgroundcolor', 'white');
    end
    % 214 217
    % 215 217
    ud.fromListPrompt = uicontrol(hdl, 'style', 'text', 'backgroundcolor', objBGColor, 'string', 'Corresponding From blocks: ');
    % 217 223
    % 218 223
    % 219 223
    % 220 223
    % 221 223
    ud.cmenu = uicontextmenu('Parent', hdl);
    ud.item = uimenu(ud.cmenu, 'Label', 'Refresh "Corresponding From blocks" list', 'Enable', 'on', 'callback', cellhorzcat(@doRefreshFromBlocksList));
    % 224 229
    % 225 229
    % 226 229
    % 227 229
    ud.item = uimenu(ud.cmenu, 'Label', 'Remove highlighting ', 'Enable', 'on', 'callback', cellhorzcat(@doUnHiliteBlocks));
    % 229 234
    % 230 234
    % 231 234
    % 232 234
    if not(strcmp(get_param(blkHdl, 'LinkStatus'), 'none')) || strcmp(get_param(bdroot(blkHdl), 'Lock'), 'on')
        % 234 236
        set(ud.item, 'Enable', 'off');
    end
    % 237 239
    fromSrcName = getFromBlocks(blkHdl);
    ud.fromList = uicontrol(hdl, 'style', 'listbox', 'backgroundcolor', objBGColor, 'String', fromSrcName, 'Tooltip', 'Double-click to locate selected block', 'Uicontextmenu', ud.cmenu, 'callback', cellhorzcat(@doFromBlocksSelection));
    % 240 260
    % 241 260
    % 242 260
    % 243 260
    % 244 260
    % 245 260
    % 246 260
    % 247 260
    % 248 260
    % 249 260
    % 250 260
    % 251 260
    % 252 260
    % 253 260
    % 254 260
    % 255 260
    % 256 260
    % 257 260
    % 258 260
    ud.okButton = uicontrol(hdl, 'Style', 'pushbutton', 'backgroundcolor', objBGColor, 'String', 'OK', 'Callback', cellhorzcat(@doOK));
    % 260 267
    % 261 267
    % 262 267
    % 263 267
    % 264 267
    % 265 267
    ud.cancelButton = uicontrol(hdl, 'Style', 'pushbutton', 'Backgroundcolor', objBGColor, 'String', 'Cancel', 'Callback', cellhorzcat(@doCancel));
    % 267 274
    % 268 274
    % 269 274
    % 270 274
    % 271 274
    % 272 274
    ud.helpButton = uicontrol(hdl, 'Style', 'pushbutton', 'Backgroundcolor', objBGColor, 'Enable', 'on', 'String', 'Help', 'Callback', cellhorzcat(@doHelp));
    % 274 282
    % 275 282
    % 276 282
    % 277 282
    % 278 282
    % 279 282
    % 280 282
    ud.applyButton = uicontrol(hdl, 'Style', 'pushbutton', 'backgroundcolor', objBGColor, 'Enable', 'off', 'String', 'Apply', 'Callback', cellhorzcat(@doApply));
    % 282 291
    % 283 291
    % 284 291
    % 285 291
    % 286 291
    % 287 291
    % 288 291
    % 289 291
    ud.origSize = [0.0 0.0];
    ud.hilitedBlk.blkHdl = -1.0;
    ud.hilitedBlk.origHL = 'none';
    set(hdl, 'UserData', ud);
    % 294 297
    % 295 297
    doResize(hdl, []);
    % 297 300
    % 298 300
    set(hdl, 'Units', 'pixels');
    dialogPos = get(hdl, 'Position');
    bdPos = get_param(get_param(blkHdl, 'Parent'), 'Location');
    blkPos = get_param(blkHdl, 'Position');
    bdPos = horzcat(plus(bdPos(1.0:2.0), blkPos(1.0:2.0)), plus(plus(bdPos(1.0:2.0), blkPos(1.0:2.0)), blkPos(3.0:4.0)));
    % 304 306
    hgPos = sl('rectconv', bdPos, 'hg');
    dialogPos(1.0) = plus(hgPos(1.0), minus(hgPos(3.0), dialogPos(3.0)));
    dialogPos(2.0) = plus(hgPos(2.0), minus(hgPos(4.0), dialogPos(4.0)));
    % 308 311
    % 309 311
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
    % 330 337
    % 331 337
    % 332 337
    % 333 337
    % 334 337
    % 335 337
    if strcmp(get_param(blkHdl, 'LinkStatus'), 'none') && not(strcmp(get_param(bdroot(blkHdl), 'Lock'), 'on'))
        % 337 339
        set_param(blkHdl, 'Figure', hdl)
    else
        UiControls = vertcat(horzcat(ud.gotoTagPrompt), horzcat(ud.gotoTagEdit), horzcat(ud.tagVisPrompt), horzcat(ud.tagVisPopup), horzcat(ud.fromListPrompt), horzcat(ud.fromList), horzcat(ud.okButton), horzcat(ud.applyButton));
        % 341 346
        % 342 346
        % 343 346
        % 344 346
        set(UiControls, 'enable', 'off');
    end
end
function applyNoError = doApply(applyButton, evd)
    % 349 358
    % 350 358
    % 351 358
    % 352 358
    % 353 358
    % 354 358
    % 355 358
    % 356 358
    hdl = get(applyButton, 'Parent');
    ud = get(hdl, 'UserData');
    % 359 362
    % 360 362
    ud.hilitedBlk = doUnHiliteBlocks(ud.hilitedBlk, []);
    errmsg = '';
    lasterr('');
    % 364 366
    applyNoError = 1.0;
    set_param(ud.blkHdl, 'Figure', -1.0);
    prevTag = get_param(ud.blkHdl, 'GotoTag');
    prevTagVis = get_param(ud.blkHdl, 'TagVisibility');
    try
        set_param(ud.blkHdl, 'GotoTag', sl('deblankall', get(ud.gotoTagEdit, 'String')));
    catch
        applyNoError = 0.0;
        try
            % 374 376
            set_param(ud.blkHdl, 'GotoTag', prevTag);
            % 376 378
        end % try
        errmsg = vertcat(errmsg, cellhorzcat(lasterr));
    end % try
    % 380 382
    try
        tagVis = get(ud.tagVisPopup, 'String');
        set_param(ud.blkHdl, 'TagVisibility', tagVis(get(ud.tagVisPopup, 'value')));
    catch
        applyNoError = 0.0;
        try
            % 387 389
            set_param(ud.blkHdl, 'TagVisibility', prevTagVis);
            % 389 391
        end % try
        errmsg = vertcat(errmsg, cellhorzcat(lasterr));
    end % try
    set_param(ud.blkHdl, 'Figure', hdl);
    % 394 396
    if applyNoError
        try
            % 397 399
            doRefreshFromBlocksList(ud.item, []);
        catch
            errmsg = vertcat(errmsg, cellhorzcat(lasterr));
        end % try
        % 402 405
        % 403 405
        toggleApply(applyButton, 'off');
    end
    % 406 408
    set(hdl, 'UserData', ud);
    if not(isempty(errmsg))
        errordlg(errmsg, 'Error message: Goto Block', 'modal');
    end
end
function doCancel(cancelButton, evd)
    % 413 422
    % 414 422
    % 415 422
    % 416 422
    % 417 422
    % 418 422
    % 419 422
    % 420 422
    hdl = get(cancelButton, 'Parent');
    ud = get(hdl, 'UserData');
    % 423 426
    % 424 426
    ud.hilitedBlk = doUnHiliteBlocks(ud.hilitedBlk, []);
    % 426 428
    set(hdl, 'Visible', 'off');
    set(hdl, 'UserData', ud);
    % 429 431
    if not(strcmp(get_param(bdroot(ud.blkHdl), 'Lock'), 'on'))
        warningState = vertcat(warning, warning('query', 'backtrace'));
        warning('off', 'backtrace');
        warning('on');
        set_param(ud.blkHdl, 'Figure', -1.0);
        set(ud.gotoTagEdit, 'String', get_param(ud.blkHdl, 'GotoTag'));
        set(ud.tagVisPopup, 'Value', getPopupMatchingValue(ud.tagVisPopup, get_param(ud.blkHdl, 'TagVisibility')));
        % 437 440
        % 438 440
        set_param(ud.blkHdl, 'Figure', hdl);
        warning(warningState);
    end
end
function doClose(blkHdl)
    % 444 453
    % 445 453
    % 446 453
    % 447 453
    % 448 453
    % 449 453
    % 450 453
    % 451 453
    if ne(get_param(blkHdl, 'Figure'), -1.0)
        hdl = get_param(blkHdl, 'Figure');
        if not(isempty(hdl)) && ishandle(hdl)
            ud = get(hdl, 'UserData');
            % 456 459
            % 457 459
            ud.hilitedBlk = doUnHiliteBlocks(ud.hilitedBlk, []);
            if not(strcmp(get_param(bdroot(blkHdl), 'Lock'), 'on'))
                delete(hdl);
                set_param(blkHdl, 'Figure', -1.0);
            end
        end
    end
end
function doRefreshFromBlocksList(item, evd)
    % 467 476
    % 468 476
    % 469 476
    % 470 476
    % 471 476
    % 472 476
    % 473 476
    % 474 476
    hdl = get(get(item, 'Parent'), 'Parent');
    ud = get(hdl, 'UserData');
    % 477 479
    fromSrcName = getFromBlocks(ud.blkHdl);
    if gt(get(ud.fromList, 'Value'), size(fromSrcName, 1.0))
        set(ud.fromList, 'Value', 1.0);
    end
    set(ud.fromList, 'String', fromSrcName);
end
function doFromBlocksSelection(fromList, evd)
    % 485 498
    % 486 498
    % 487 498
    % 488 498
    % 489 498
    % 490 498
    % 491 498
    % 492 498
    % 493 498
    % 494 498
    % 495 498
    % 496 498
    hdl = get(fromList, 'Parent');
    ud = get(hdl, 'UserData');
    % 499 501
    if strcmp(lower(get(hdl, 'SelectionType')), 'normal')
        % 501 503
        listStr = get(ud.fromList, 'String');
        if not(isempty(listStr)) && not(isempty(listStr(get(ud.fromList, 'Value'))))
            % 504 506
            toggleApply(ud.applyButton);
            % 506 509
            % 507 509
        end
    else
        if strcmp(lower(get(hdl, 'SelectionType')), 'open')
            doFind(fromList, []);
        end
    end
end
function doGotoTag(gotoTagEdit, evd)
    % 516 524
    % 517 524
    % 518 524
    % 519 524
    % 520 524
    % 521 524
    % 522 524
    hdl = get(gotoTagEdit, 'Parent');
    ud = get(hdl, 'UserData');
    % 525 528
    % 526 528
    toggleApply(ud.applyButton);
end
function doHelp(helpButton, evd)
    % 530 539
    % 531 539
    % 532 539
    % 533 539
    % 534 539
    % 535 539
    % 536 539
    % 537 539
    hdl = get(helpButton, 'Parent');
    ud = get(hdl, 'UserData');
    slhelp(ud.blkHdl);
end
function doTagVis(tagVisPopup, evd)
    % 543 552
    % 544 552
    % 545 552
    % 546 552
    % 547 552
    % 548 552
    % 549 552
    % 550 552
    hdl = get(tagVisPopup, 'Parent');
    ud = get(hdl, 'UserData');
    % 553 556
    % 554 556
    toggleApply(ud.applyButton);
end
function doFind(obj, evd)
    % 558 568
    % 559 568
    % 560 568
    % 561 568
    % 562 568
    % 563 568
    % 564 568
    % 565 568
    % 566 568
    hdl = get(obj, 'Parent');
    ud = get(hdl, 'UserData');
    % 569 571
    ud.hilitedBlk = doUnHiliteBlocks(ud.hilitedBlk, []);
    % 571 573
    listStr = get(ud.fromList, 'String');
    % 573 575
    if not(isempty(listStr))
        fromSrc = listStr{get(ud.fromList, 'Value')};
        if not(isempty(fromSrc))
            try
                % 578 580
                ud.hilitedBlk.origHL = get_param(fromSrc, 'HiliteAncestors');
                hilite_system(fromSrc, 'find');
                ud.hilitedBlk.blkHdl = fromSrc;
            catch
                msg = horzcat('Unable to find From block named: "', fromSrc, '". ', lasterr);
                msgbox(msg, 'Goto Source Locating Message', 'modal');
            end % try
        end
    end
    set(hdl, 'UserData', ud);
end
function doOK(okButton, evd)
    % 591 601
    % 592 601
    % 593 601
    % 594 601
    % 595 601
    % 596 601
    % 597 601
    % 598 601
    % 599 601
    hdl = get(okButton, 'Parent');
    ud = get(hdl, 'UserData');
    % 602 604
    if doApply(ud.applyButton, evd)
        % 604 606
        ud.hilitedBlk = doUnHiliteBlocks(ud.hilitedBlk, []);
        % 606 608
        set(hdl, 'Visible', 'off');
        set(hdl, 'UserData', ud);
    end
end
function doResize(hdl, evd)
    % 612 627
    % 613 627
    % 614 627
    % 615 627
    % 616 627
    % 617 627
    % 618 627
    % 619 627
    % 620 627
    % 621 627
    % 622 627
    % 623 627
    % 624 627
    % 625 627
    ud = get(hdl, 'UserData');
    % 627 629
    set(hdl, 'Units', 'pixels');
    figPos = get(hdl, 'Position');
    % 630 633
    % 631 633
    tmpText = uicontrol(hdl, 'style', 'text', 'visible', 'off', 'fontunit', 'pixel', 'string', 'www');
    % 633 635
    strExt = get(tmpText, 'extent');
    pixelRatio = mrdivide(get(tmpText, 'fontsize'), 10.667);
    delete(tmpText);
    if ne(ud.origSize, [0.0 0.0])
        if lt(figPos(3.0), ud.origSize(1.0)) || lt(figPos(4.0), mtimes(350.0, pixelRatio))
            set(hdl, 'Units', 'normalized');
            return
        end
    end
    % 643 646
    % 644 646
    allHdls = horzcat(hdl, ud.desc, ud.descTitle, ud.descText, ud.param, ud.paramTitle, ud.gotoTagPrompt, ud.gotoTagEdit, ud.tagVisPrompt, ud.tagVisPopup, ud.fromListPrompt, ud.fromList, ud.okButton, ud.cancelButton, ud.helpButton, ud.applyButton);
    % 646 650
    % 647 650
    % 648 650
    set(allHdls, 'Units', 'characters');
    % 650 652
    offset = 1.0;
    btnWidth = 12.0;
    btnHeight = 1.75;
    txtMove = .5;
    % 655 657
    figPos = get(hdl, 'Position');
    % 657 660
    % 658 660
    posApply = horzcat(minus(minus(figPos(3.0), offset), btnWidth), offset, btnWidth, btnHeight);
    posHelp = posApply;
    posHelp(1.0) = minus(minus(posApply(1.0), mtimes(2.0, offset)), btnWidth);
    posCancel = posHelp;
    posCancel(1.0) = minus(minus(posHelp(1.0), mtimes(2.0, offset)), btnWidth);
    posOK = posCancel;
    posOK(1.0) = minus(minus(posCancel(1.0), mtimes(2.0, offset)), btnWidth);
    % 666 669
    % 667 669
    posDesc = horzcat(offset, minus(figPos(4.0), mtimes(8.0, offset)), minus(figPos(3.0), mtimes(2.0, offset)), mtimes(7.0, offset));
    strExt = get(ud.descTitle, 'extent');
    posDescTitle = horzcat(mtimes(3.0, offset), minus(plus(posDesc(2.0), posDesc(4.0)), mrdivide(strExt(4.0), 2.0)), strExt(3.0:4.0));
    % 671 673
    posDescText = horzcat(plus(posDesc(1.0), offset), plus(posDesc(2.0), .2), minus(posDesc(3.0), mtimes(2.0, offset)), minus(posDesc(4.0), offset));
    % 673 677
    % 674 677
    % 675 677
    posParam = horzcat(offset, plus(plus(posOK(2.0), posOK(4.0)), offset), minus(figPos(3.0), mtimes(2.0, offset)), minus(minus(posDesc(2.0), posOK(4.0)), mtimes(3.0, offset)));
    % 677 680
    % 678 680
    strExt = get(ud.paramTitle, 'extent');
    posParamTitle = horzcat(mtimes(3.0, offset), minus(plus(posParam(2.0), posParam(4.0)), mrdivide(strExt(4.0), 2.0)), strExt(3.0:4.0));
    % 681 684
    % 682 684
    strExt = get(ud.gotoTagPrompt, 'extent');
    posGotoTagPrompt = horzcat(plus(posParam(1.0), offset), minus(minus(plus(posParam(4.0), posParam(2.0)), txtMove), strExt(4.0)), strExt(3.0:4.0));
    % 685 689
    % 686 689
    % 687 689
    strExt = get(ud.gotoTagEdit, 'extent');
    posGotoTagEdit = horzcat(posGotoTagPrompt(1.0), minus(posGotoTagPrompt(2.0), btnHeight), minus(posParam(3.0), mtimes(2.0, offset)), btnHeight);
    % 690 695
    % 691 695
    % 692 695
    % 693 695
    strExt = get(ud.tagVisPrompt, 'extent');
    posTagVisPrompt = horzcat(plus(posParam(1.0), offset), minus(minus(posGotoTagEdit(2.0), offset), btnHeight), strExt(3.0), btnHeight);
    % 696 700
    % 697 700
    % 698 700
    tmpText = uicontrol(hdl, 'style', 'text', 'units', 'char', 'string', 'wwwwwwww');
    strExt = get(tmpText, 'extent');
    posTagVisPopup = horzcat(plus(posTagVisPrompt(1.0), posTagVisPrompt(3.0)), posTagVisPrompt(2.0), strExt(3.0), mtimes(1.2, posTagVisPrompt(4.0)));
    % 702 706
    % 703 706
    % 704 706
    delete(tmpText);
    % 706 709
    % 707 709
    strExt = get(ud.fromListPrompt, 'extent');
    posFromListPrompt = horzcat(posTagVisPrompt(1.0), minus(minus(posTagVisPrompt(2.0), strExt(4.0)), txtMove), strExt(3.0:4.0));
    % 710 714
    % 711 714
    % 712 714
    posFromList = horzcat(posFromListPrompt(1.0), plus(posParam(2.0), offset), minus(figPos(3.0), mtimes(4.0, offset)), minus(minus(posFromListPrompt(2.0), posParam(2.0)), offset));
    % 714 721
    % 715 721
    % 716 721
    % 717 721
    % 718 721
    % 719 721
    set(ud.desc, 'Position', posDesc);
    set(ud.descTitle, 'Position', posDescTitle);
    set(ud.descText, 'Position', posDescText);
    set(ud.param, 'Position', posParam);
    set(ud.paramTitle, 'Position', posParamTitle);
    set(ud.gotoTagPrompt, 'Position', posGotoTagPrompt);
    set(ud.gotoTagEdit, 'Position', posGotoTagEdit);
    set(ud.tagVisPrompt, 'Position', posTagVisPrompt);
    set(ud.tagVisPopup, 'Position', posTagVisPopup);
    set(ud.fromListPrompt, 'Position', posFromListPrompt);
    set(ud.fromList, 'Position', posFromList);
    % 731 733
    set(ud.okButton, 'Position', posOK);
    set(ud.cancelButton, 'Position', posCancel);
    set(ud.helpButton, 'Position', posHelp);
    set(ud.applyButton, 'Position', posApply);
    % 736 738
    set(allHdls, 'Units', 'normalized');
end
function doUpdateName(blkHdl)
    % 740 750
    % 741 750
    % 742 750
    % 743 750
    % 744 750
    % 745 750
    % 746 750
    % 747 750
    % 748 750
    hdl = get_param(blkHdl, 'Figure');
    % 750 752
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
function hilitedBlk = doUnHiliteBlocks(obj, evd)
    % 762 771
    % 763 771
    % 764 771
    % 765 771
    % 766 771
    % 767 771
    % 768 771
    % 769 771
    if not(isstruct(obj))
        hdl = get(obj, 'Parent');
        ud = get(hdl, 'UserData');
        if isempty(ud)
            % 774 776
            hdl = get(get(obj, 'Parent'), 'Parent');
            ud = get(hdl, 'UserData');
        end
        hilitedBlk = ud.hilitedBlk;
    else
        hilitedBlk = obj;
    end
    % 782 785
    % 783 785
    if ne(hilitedBlk.blkHdl, -1.0)
        try
            set_param(hilitedBlk.blkHdl, 'HiliteAncestors', hilitedBlk.origHL);
            % 787 790
            % 788 790
        end % try
        hilitedBlk.blkHdl = -1.0;
        hilitedBlk.origHL = 'none';
    end
end
function deleteFcn(fig, evd)
    % 795 804
    % 796 804
    % 797 804
    % 798 804
    % 799 804
    % 800 804
    % 801 804
    % 802 804
    ud = get(fig, 'UserData');
    doClose(ud.blkHdl);
end
function fromSrcName = getFromBlocks(blkHdl)
    % 807 817
    % 808 817
    % 809 817
    % 810 817
    % 811 817
    % 812 817
    % 813 817
    % 814 817
    % 815 817
    fromSrc = get_param(blkHdl, 'FromBlocks');
    fromSrcName = '';
    if gt(length(fromSrc), 0.0)
        for i=1.0:length(fromSrc)
            fromSrcName = vertcat(fromSrcName, cellhorzcat(fromSrc(i).name));
        end % for
    end
end
function hdl = openDialog(blkHdl)
    % 825 837
    % 826 837
    % 827 837
    % 828 837
    % 829 837
    % 830 837
    % 831 837
    % 832 837
    % 833 837
    % 834 837
    % 835 837
    updateDataOnly = 0.0;
    hdl = get_param(blkHdl, 'Figure');
    if not(isempty(hdl)) && ishandle(hdl) && ne(hdl, -1.0)
        figure(hdl);
        updateDataOnly = 1.0;
    end
    % 842 847
    % 843 847
    % 844 847
    % 845 847
    if not(updateDataOnly)
        hdl = createDialog(blkHdl);
    end
    % 849 851
    ud = get(hdl, 'UserData');
    % 851 853
    if not(strcmp(get_param(bdroot(blkHdl), 'Lock'), 'on'))
        set_param(ud.blkHdl, 'Figure', -1.0);
        try
            % 855 857
            set(ud.gotoTagEdit, 'String', get_param(ud.blkHdl, 'GotoTag'));
            % 857 860
            % 858 860
            set(ud.tagVisPopup, 'Value', getPopupMatchingValue(ud.tagVisPopup, get_param(ud.blkHdl, 'TagVisibility')));
        catch
            % 861 864
            % 862 864
            % 863 865
            errordlg(lasterr);
        end % try
        set_param(ud.blkHdl, 'Figure', hdl);
        % 867 870
        % 868 870
        doRefreshFromBlocksList(ud.item, []);
    end
    % 871 874
    % 872 874
    set(hdl, 'visible', 'on');
end
function returnKeyOK(fig, evd)
    % 876 886
    % 877 886
    % 878 886
    % 879 886
    % 880 886
    % 881 886
    % 882 886
    % 883 886
    % 884 886
    ud = get(fig, 'UserData');
    % 886 888
    if not(isempty(get(fig, 'CurrentChar')))
        if eq(abs(get(fig, 'CurrentChar')), 13.0)
            if strcmp(get(ud.okButton, 'Enable'), 'on')
                doOK(ud.okButton, []);
            end
        end
    end
end
function toggleApply(varargin)
    % 896 905
    % 897 905
    % 898 905
    % 899 905
    % 900 905
    % 901 905
    % 902 905
    % 903 905
    if eq(nargin, 1.0)
        set(varargin{1.0}, 'Enable', 'on');
    else
        if eq(nargin, 2.0)
            set(varargin{1.0}, 'Enable', varargin{2.0});
        end
    end
end
function val = getPopupMatchingValue(popupItem, str)
    % 913 920
    % 914 920
    % 915 920
    % 916 920
    % 917 920
    % 918 920
    val = 1.0;
    popupStr = get(popupItem, 'String');
    for i=1.0:size(popupStr, 1.0)
        if strcmp(sl('deblankall', popupStr(i, :)), str)
            val = i;
            break
        end
    end % for
end
