function listeners(this, eventData, fcn, varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    feval(fcn, this, eventData, varargin{:});
end
function responsetype_listener(this, eventData)
    % 10 14
    % 11 14
    % 12 14
    hFig = get(this, 'FigureHandle');
    p = getptr(hFig);
    setptr(hFig, 'watch');
    % 16 18
    setup_designmethods(this);
    oldDM = get(this, 'CurrentDesignMethod');
    buildcurrent(this);
    if isequal(this.CurrentDesignMethod, oldDM)
        currentdesignmethod_listener(this);
    end
    % 23 25
    set(this, 'isDesigned', 0.0);
    sendfiledirty(this);
    % 26 28
    set(hFig, p{:});
end
function designmethod_listener(this, eventData)
    % 30 35
    % 31 35
    % 32 35
    % 33 35
    hFig = get(this, 'FigureHandle');
    p = getptr(hFig);
    setptr(hFig, 'watch');
    % 37 40
    % 38 40
    buildcurrent(this);
    set(this, 'isDesigned', 0.0);
    sendfiledirty(this);
    % 42 44
    set(hFig, p{:});
end
function orderrequested_listener(this, eventData)
    % 46 49
    % 47 49
    hSrc = get(eventData, 'Source');
    % 49 51
    hFO = getcomponent(this, '-class', 'siggui.filterorder');
    setorder(hSrc, get(hFO, 'Order'));
end
function staticresponse_listener(this, eventdata)
    % 54 58
    % 55 58
    % 56 58
    visState = get(this, 'Visible');
    % 58 61
    % 59 61
    if strcmpi(visState, 'On')
        visState = get(this, 'StaticResponse');
    end
    % 63 65
    hax = findobj(this.FigureHandle, 'type', 'axes', 'tag', 'staticresponse_axes');
    % 65 67
    set(hax, 'Visible', visState);
    set(allchild(hax), 'Visible', visState);
    % 68 70
    if strcmpi(visState, 'Off')
        clrStaticResponse(this);
    end
    % 72 74
    lclStaticResponse(this);
end
function usermodifiedspecs_listener(this, eventData)
    % 76 80
    % 77 80
    % 78 80
    if isempty(get(this, 'CurrentDesignMethod'))
        % 80 82
        freqstate = getstate(this.Frames(3.0));
        magstate = getstate(this.Frames(4.0));
        % 83 85
        hcomp = this.ActiveComponents;
        hcomp(3.0) = fdadesignpanel.lpfreqpassstop;
        hcomp(4.0) = fdadesignpanel.lpmag;
        set(hcomp(3.0), 'Fpass', freqstate.Values{1.0}, 'Fstop', freqstate.Values{2.0}, 'Fs', freqstate.Fs, 'freqUnit', freqstate.Units);
        % 88 93
        % 89 93
        % 90 93
        % 91 93
        set(hcomp(4.0), 'IRType', 'FIR', 'magUnits', magstate.FIRunits)
        if strcmpi(magstate.FIRunits, 'db')
            set(hcomp(4.0), 'Apass', magstate.Values{1.0}, 'Astop', magstate.Values{2.0});
        end
        % 96 98
        render(hcomp(3.0), this.Frames, this.FigureHandle);
        render(hcomp(4.0), this.Frames, this.FigureHandle);
        setcomponentstate(this, this.PreviousState, hcomp(3.0));
        setcomponentstate(this, this.PreviousState, hcomp(4.0));
        % 101 103
        set(hcomp(3.0:4.0), 'Visible', this.Visible);
        % 103 105
        this.ActiveComponents = hcomp;
        % 105 107
        addcomponent(this, hcomp(3.0:4.0));
        % 107 109
        buildcurrent(this);
        % 109 111
        set(this, 'isDesigned', 0.0);
        return
    end
    % 113 115
    hSrc = get(eventData, 'Source');
    % 115 117
    if isa(hSrc, 'schema.prop')
        hSrc = get(eventData, 'AffectedObject');
    end
    if isa(hSrc, 'siggui.abstractfilterorder') || isa(hSrc, 'siggui.firwinoptionsframe')
        currentdesignmethod_listener(this, eventData);
    else
        staticresponse_listener(this, eventData);
    end
    set(this, 'isDesigned', 0.0);
    sendfiledirty(this);
    if ~(this.isLoading)
        sendstatus(this, 'Ready');
    end
end
function currentdesignmethod_listener(this, eventData)
    % 131 135
    % 132 135
    % 133 135
    hFig = get(this, 'FigureHandle');
    p = getptr(hFig);
    setptr(hFig, 'watch');
    % 137 139
    hDM = get(this, 'CurrentDesignMethod');
    if isempty(hDM)
        buildcurrent(this);
        set(hFig, p{:});
        return
    end
    % 144 146
    if isa(hDM, 'filtdes.fir1')
        updateForFIR1(this);
    end
    % 148 150
    mode = getmode(this);
    % 150 152
    if isvisprop(hDM, 'orderMode')
        set(hDM, 'orderMode', mode);
    end
    % 154 156
    frames = whichframes(hDM);
    % 156 158
    [hfound, hnot] = parsecomponents(this, frames);
    % 158 161
    % 159 161
    disablehnots(hnot);
    % 161 163
    hfound = synccomps_w_frames(this, hfound, frames);
    % 163 165
    addlisteners2components(this);
    % 165 168
    % 166 168
    set_unused_off(this, hfound);
    set(hfound, 'Visible', this.Visible);
    % 169 171
    set(this, 'ActiveComponents', hfound);
    % 171 173
    lclStaticResponse(this);
    % 173 175
    set(hFig, p{:});
    if ~(this.isLoading)
        sendstatus(this, 'Ready');
    end
end
function updateForFIR1(this)
    % 180 187
    % 181 187
    % 182 187
    % 183 187
    % 184 187
    % 185 187
    hFW = getcomponent(this, '-class', 'siggui.firwinoptionsframe');
    if ~(isempty(hFW))
        % 188 192
        % 189 192
        % 190 192
        hFW = hFW(1.0);
        % 192 194
        if ~(isminordersupported(hFW))
            setMode(this, 'Specify');
        end
        % 196 198
        mode = getmode(this);
        if strcmpi(mode, 'minimum')
            isminord = 1.0;
        else
            isminord = 0.0;
        end
        set(hFW, 'isminorder', isminord);
        % 204 206
        set(this.CurrentDesignMethod, 'Window', get(hFW, 'Window'));
    end
end
function lclStaticResponse(this)
    % 209 212
    % 210 212
    hFig = get(this, 'FigureHandle');
    % 212 214
    if strcmpi(this.Visible, 'on') && strcmpi(this.StaticResponse, 'On')
        % 214 216
        hax = findobj(this.FigureHandle, 'type', 'axes', 'tag', 'staticresponse_axes');
        % 216 218
        h = get(this, 'Handles');
        hDM = get(this, 'CurrentDesignMethod');
        % 219 221
        clrStaticResponse(this);
        oldaxes = get(hFig, 'CurrentAxes');
        % 222 224
        set(hFig, 'CurrentAxes', hax);
        % 224 226
        if isempty(hDM)
            staticremezlp(hax);
        else
            [package, method] = strtok(get(this, 'DesignMethod'), '.');
            method(1.0) = [];
            % 230 232
            staticres(hax, get(this, 'SubType'), method, getActiveFrames(this));
            set(hFig, 'CurrentAxes', oldaxes);
        end
    else
        setzoomstate(hFig);
    end
end
function clrStaticResponse(this)
    % 239 242
    % 240 242
    h = get(this, 'Handles');
    hax = findobj(this.FigureHandle, 'type', 'axes', 'tag', 'staticresponse_axes');
    delete(allchild(hax));
    set(hax, 'XTick', [], 'YTick', []);
end
function setup_designmethods(this, eventData)
    % 247 250
    % 248 250
    filtertype = get(this, 'ResponseType');
    % 250 252
    if isempty(filtertype)
        return
    end
    at = get(this, 'AvailableTypes');
    % 255 258
    % 256 258
    indx = find(strcmp(cellhorzcat(at.(filtertype).tag), this.SubType));
    if isempty(indx)
        iir = [];
        fir = [];
    else
        iir = at.(filtertype)(indx).iir;
        fir = at.(filtertype)(indx).fir;
    end
    % 265 267
    hDM = getcomponent(this, '-class', 'siggui.selector', 'Name', 'Design Method');
    % 267 270
    % 268 270
    if ~(isempty(iir))
        % 270 273
        % 271 273
        enableselection(hDM, 'iir');
        % 273 275
        alltags = get(hDM, 'Identifiers');
        allstrs = get(hDM, 'Strings');
        % 276 278
        alltags{1.0} = cellhorzcat('iir', iir.tag);
        allstrs{1.0} = cellhorzcat('IIR', iir.name);
        % 279 281
        set(hDM, 'Identifiers', alltags);
        set(hDM, 'Strings', allstrs);
    end
    % 283 286
    % 284 286
    if ~(isempty(fir))
        % 286 289
        % 287 289
        enableselection(hDM, 'fir');
        % 289 292
        % 290 292
        alltags = get(hDM, 'Identifiers');
        allstrs = get(hDM, 'Strings');
        % 293 295
        alltags{2.0} = cellhorzcat('fir', fir.tag);
        allstrs{2.0} = cellhorzcat('FIR', fir.name);
        % 296 298
        set(hDM, 'Identifiers', alltags);
        set(hDM, 'Strings', allstrs);
    end
    % 300 302
    if isempty(iir)
        disableselection(hDM, 'iir');
    end
    if isempty(fir)
        disableselection(hDM, 'fir');
    end
end
function set_unused_off(this, hfound)
    for indx=1.0:length(hfound)
        if isa(hfound(indx), 'fdadesignpanel.abstractfiltertype')
            hfound(indx) = allchild(hfound(indx));
        end
    end % for
    % 314 316
    hframes = get(this, 'Frames');
    hframes = setdiff(hframes, hfound);
    % 317 320
    % 318 320
    set(hframes, 'Visible', 'Off');
end
function hfound = synccomps_w_frames(this, hfound, frames)
    % 322 326
    % 323 326
    % 324 326
    hframes = get(this, 'Frames');
    % 326 328
    hFig = get(this, 'FigureHandle');
    hv = get(hFig, 'HandleVisibility');
    set(hFig, 'HandleVisibility', 'On');
    % 330 332
    for i=1.0:length(hfound)
        if isempty(hfound{i})
            % 333 336
            % 334 336
            hfound{i} = feval(frames(i).constructor);
            % 336 338
            setcomponentstate(this, this.PreviousState, hfound{i});
            % 338 341
            % 339 341
            addcomponent(this, hfound{i});
            % 341 343
            if isa(hfound{i}, 'fdadesignpanel.abstractfiltertype')
                % 343 347
                % 344 347
                % 345 347
                hnewframes = render(hfound{i}, hframes, hFig);
                % 347 350
                % 348 350
                if isempty(hnewframes)
                    hc = allchild(hfound{i});
                    if eq(length(hc), 1.0)
                        set(hfound{i}, 'Visible', get(hc, 'Visible'));
                    end
                else
                    addtoframes(this, hnewframes);
                    % 356 358
                end
            else
                % 359 361
                render(hfound{i}, hFig);
                addtoframes(this, hfound{i});
            end
            if isempty(frames(i).setops)
                set(hfound{i}, 'Enable', this.Enable);
            else
                set(hfound{i}, 'Enable', this.Enable, frames(i).setops{:});
            end
        else
            % 369 371
            if isempty(frames(i).setops)
                set(hfound{i}, 'Enable', this.Enable);
            else
                set(hfound{i}, 'Enable', this.Enable, frames(i).setops{:});
            end
            % 375 377
            if isa(hfound{i}, 'fdadesignpanel.abstractfiltertype')
                associate(hfound{i}, hframes, hFig);
            end
        end
    end % for
    % 381 383
    set(hFig, 'HandleVisibility', hv);
    % 383 385
    hfound = horzcat(hfound{:});
end
function disablehnots(hnot)
    % 387 391
    % 388 391
    % 389 391
    for i=1.0:length(hnot)
        if isa(hnot(i), 'fdadesignpanel.abstractfiltertype')
            disassociate(hnot(i));
            % 393 397
            % 394 397
            % 395 397
            set(hnot(i), 'Visible', 'Off');
        end
    end % for
end
function [hfound, hnot] = parsecomponents(this, frames)
    % 401 405
    % 402 405
    % 403 405
    hfound = cell(1.0, length(frames));
    % 405 408
    % 406 408
    hnot = allchild(this);
    if ~(isempty(hnot))
        for indx=1.0:length(frames)
            hfound{indx} = getcomponent(this, '-class', frames(indx).constructor);
            if gt(length(hfound{indx}), 1.0)
                disconnect(hfound{indx}(1.0));
                hfound{indx} = hfound{indx}(2.0);
            end
            % 415 419
            % 416 419
            % 417 419
            if isempty(hfound{indx})
                hfound{indx} = [];
            end
        end % for
        hnot = setdiff(hnot, horzcat(hfound{:}));
    end
end
function h = getActiveFrames(this)
    % 426 434
    % 427 434
    % 428 434
    % 429 434
    % 430 434
    % 431 434
    % 432 434
    ha = get(this, 'ActiveComponents');
    % 434 436
    count = 0.0;
    for indx=1.0:length(ha)
        if isa(ha(indx), 'fdadesignpanel.abstractfiltertype')
            hindx = allchild(ha(indx));
            if ~(isempty(hindx))
                count = plus(count, 1.0);
                h(count) = hindx;
            end
        else
            count = plus(count, 1.0);
            % 445 447
            h(count) = ha(indx);
        end
    end % for
end
function boolflag = isvisprop(h, prop)
    % 451 454
    % 452 454
    err = lasterror;
    try
        v = get(h, prop);
        boolflag = 1.0;
        if strcmpi(get(h.findprop(prop), 'Visible'), 'off')
            boolflag = 0.0;
        end
    catch
        lasterror(err);
        boolflag = 0.0;
    end % try
end
function mode = getmode(this)
    % 466 470
    % 467 470
    % 468 470
    mode = 'minimum';
    hFO = find(getActiveFrames(this), '-isa', 'siggui.abstractfilterorder');
    if ~(isempty(hFO))
        mode = get(hFO, 'Mode');
    end
end
function setMode(this, newMode)
    % 476 479
    % 477 479
    hDM = get(this, 'CurrentDesignMethod');
    if isvisprop(hDM, 'ordermode')
        set(hDM, 'OrderMode', newMode);
    end
    % 482 484
    hFO = find(getActiveFrames(this), '-isa', 'siggui.abstractfilterorder');
    if ~(isempty(hFO))
        set(hFO, 'Mode', newMode);
    end
end
function addlisteners2components(this, varargin)
    % 489 496
    % 490 496
    % 491 496
    % 492 496
    % 493 496
    % 494 496
    hFrames = get(this, 'Frames');
    % 496 498
    listener = vertcat(handle.listener(union(hFrames, allchild(this)), 'UserModifiedSpecs', cellhorzcat(@listeners, 'usermodifiedspecs_listener')), handle.listener(union(hFrames, allchild(this)), 'OrderRequested', cellhorzcat(@listeners, 'orderrequested_listener')));
    % 498 505
    % 499 505
    % 500 505
    % 501 505
    % 502 505
    % 503 505
    set(listener, 'CallbackTarget', this);
    set(this, 'UserModifiedListener', listener);
end
function addtoframes(this, hnew)
    % 508 511
    % 509 511
    sz = gui_sizes(this);
    % 511 513
    figpos = mtimes([770.0 549.0], sz.pixf);
    % 513 515
    resizefcn(hnew, figpos);
    % 515 517
    hframes = get(this, 'Frames');
    % 517 519
    if isempty(hframes)
        hframes = hnew;
    else
        hframes(plus(end, 1.0)) = hnew;
    end
    % 523 525
    set(this, 'Frames', hframes);
end
function staticremezlp(hax)
    % 527 531
    % 528 531
    % 529 531
    xlim = [0.0 1.1];
    ylim = [0.0 1.7];
    % 532 534
    xtick = 1.0;
    xticklabel = 'Fs/2';
    % 535 537
    ytick = [-1.0 1.0];
    yticklabel = 0.0;
    % 538 540
    set(hax, 'Color', 'white', 'Xlim', xlim, 'Ylim', ylim, 'Xtick', xtick, 'Xticklabel', xticklabel, 'Ytick', ytick, 'Yticklabel', yticklabel, 'Box', 'off', 'Clipping', 'off', 'Layer', 'Top', 'Plotboxaspectratio', [2.0 .8 1.0]);
    % 540 553
    % 541 553
    % 542 553
    % 543 553
    % 544 553
    % 545 553
    % 546 553
    % 547 553
    % 548 553
    % 549 553
    % 550 553
    % 551 553
    x = [0.0 0.0 -.0075 0.0 .0075 0.0 0.0];
    y = [1.7 1.62 1.62 1.7 1.62 1.62 1.7];
    % 554 556
    patch(x, y, [.8 .8 .8], 'erasemode', 'none', 'facecolor', [0.0 0.0 0.0], 'edgecolor', 'black', 'clipping', 'off', 'Parent', hax);
    % 556 565
    % 557 565
    % 558 565
    % 559 565
    % 560 565
    % 561 565
    % 562 565
    % 563 565
    x = [1.1 1.07333333333333 1.07333333333333 1.1 1.07333333333333 1.07333333333333 1.1];
    % 565 567
    y = [0.0 0.0 .0262 0.0 -.0262 0.0 0.0];
    % 567 569
    patch(x, y, [.8 .8 .8], 'erasemode', 'none', 'facecolor', [0.0 0.0 0.0], 'edgecolor', 'black', 'clipping', 'off', 'Parent', hax);
    % 569 578
    % 570 578
    % 571 578
    % 572 578
    % 573 578
    % 574 578
    % 575 578
    % 576 578
    text(.01, -.1, '0', 'Parent', hax);
    % 578 580
    xaxStr = 'f (Hz)';
    yaxStr = 'Mag. (dB)';
    text(1.1, -.1, xaxStr, 'Parent', hax);
    text(.015, 1.5999999999999999, yaxStr, 'Parent', hax);
    % 583 588
    % 584 588
    % 585 588
    % 586 588
    x = [0.0 .4 .4 0.0];
    y = [1.1 1.1 1.25 1.25];
    faceColor = mtimes(get(0.0, 'defaultuicontrolbackgroundcolor'), 1.07);
    faceColor(gt(faceColor, 1.0)) = 1.0;
    eraseMode = 'background';
    patch(x, y, [.8 .8 .8], 'erasemode', eraseMode, 'facecolor', faceColor, 'edgecolor', 'black', 'Parent', hax);
    % 593 599
    % 594 599
    % 595 599
    % 596 599
    % 597 599
    line(horzcat(x(1.0), x(2.0)), horzcat(y(3.0), y(3.0)), 'color', 'white', 'Parent', hax);
    % 599 602
    % 600 602
    y = [0.0 0.0 .9 .9];
    patch(x, y, [.8 .8 .8], 'erasemode', eraseMode, 'facecolor', faceColor, 'edgecolor', 'black', 'Parent', hax);
    % 603 609
    % 604 609
    % 605 609
    % 606 609
    % 607 609
    line(horzcat(x(1.0), x(2.0)), horzcat(y(1.0), y(1.0)), 'color', 'white', 'Parent', hax);
    % 609 612
    % 610 612
    x = [1.0 .5 .5 1.0];
    y = [.1 .1 .25 .25];
    patch(x, y, [.8 .8 .8], 'erasemode', eraseMode, 'facecolor', faceColor, 'edgecolor', 'black', 'Parent', hax);
    % 614 620
    % 615 620
    % 616 620
    % 617 620
    % 618 620
    line(horzcat(x(1.0), x(2.0)), horzcat(y(3.0), y(3.0)), 'color', 'white', 'Parent', hax);
    % 620 624
    % 621 624
    % 622 624
    ytop = 1.1;
    ybot = .9;
    String = 'A_{pass}';
    xpos = .52;
    hl1 = line(horzcat(minus(xpos, .02), plus(xpos, .02)), horzcat(ytop, ytop), 'Parent', hax);
    x = [.52 .52 .515 .52 .525 .52 .52];
    y = [.6 .83 .83 .9 .83 .83 .6];
    patch(x, y, [.8 .8 .8], 'erasemode', 'none', 'facecolor', [0.0 0.0 0.0], 'edgecolor', 'black', 'clipping', 'off', 'Parent', hax);
    % 631 640
    % 632 640
    % 633 640
    % 634 640
    % 635 640
    % 636 640
    % 637 640
    % 638 640
    y = [1.3 1.17 1.17 1.1 1.17 1.17 1.3];
    patch(x, y, [.8 .8 .8], 'erasemode', 'none', 'facecolor', [0.0 0.0 0.0], 'edgecolor', 'black', 'clipping', 'off', 'Parent', hax);
    % 641 650
    % 642 650
    % 643 650
    % 644 650
    % 645 650
    % 646 650
    % 647 650
    % 648 650
    hl2 = line(horzcat(minus(xpos, .02), plus(xpos, .02)), horzcat(ybot, ybot), 'Parent', hax);
    set(horzcat(hl1, hl2), 'color', 'black');
    text(plus(xpos, .03), .98, String, 'Parent', hax)
    % 652 654
    xpos = .85;
    % 654 656
    ytop = 1.0;
    String = 'A_{stop}';
    hl1 = line(horzcat(minus(xpos, .02), plus(xpos, .02)), horzcat(ytop, ytop), 'Parent', hax);
    set(hl1, 'color', 'black');
    % 659 661
    x = [.85 .85 .845 .85 .855 .85 .85];
    y = [.65 .93 .93 1.0 .93 .93 .65];
    % 662 664
    patch(x, y, [.8 .8 .8], 'erasemode', 'none', 'facecolor', [0.0 0.0 0.0], 'edgecolor', 'black', 'clipping', 'off', 'Parent', hax);
    % 664 673
    % 665 673
    % 666 673
    % 667 673
    % 668 673
    % 669 673
    % 670 673
    % 671 673
    y = [.45 .18 .18 .11 .18 .18 .45];
    patch(x, y, [.8 .8 .8], 'erasemode', 'none', 'facecolor', [0.0 0.0 0.0], 'edgecolor', 'black', 'clipping', 'off', 'Parent', hax);
    % 674 683
    % 675 683
    % 676 683
    % 677 683
    % 678 683
    % 679 683
    % 680 683
    % 681 683
    text(minus(xpos, .02), .55, String, 'Parent', hax);
    % 683 685
    fpassStr0 = 'F_{pass}';
    fpass = .4;
    text(minus(fpass, .0022), 0.0, '|', 'Parent', hax);
    text(minus(fpass, .035), -.17, fpassStr0, 'Parent', hax);
    fstop = .5;
    fstopStr0 = 'F_{stop}';
    text(minus(fstop, .0025), 0.0, '|', 'Parent', hax);
    text(minus(fstop, .025), -.17, fstopStr0, 'Parent', hax);
end
