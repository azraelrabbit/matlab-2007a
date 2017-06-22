function varargout = sptprefs(varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    if ~(isstr(varargin{1.0}))
        action = 'init';
        prefs = varargin{1.0};
    else
        action = varargin{1.0};
    end
    % 13 15
    switch action
    case 'init'
        % 16 18
        SPTfig = gcf;
        % 18 20
        if gt(nargin, 1.0)
            panelInd = varargin{2.0};
        else
            panelInd = 1.0;
        end
        % 24 26
        figname = 'Preferences for SPTool';
        okstring = 'OK';
        cancelstring = 'Cancel';
        fus = 5.0;
        ffs = 8.0;
        uh = 24.0;
        listw = 175.0;
        lw = 170.0;
        bw = 110.0;
        bw1 = 90.0;
        uw = 250.0;
        lfs = 5.0;
        lbs = 3.0;
        lh = 16.0;
        % 39 41
        fp = get(0.0, 'defaultfigureposition');
        w = plus(plus(plus(plus(plus(plus(mtimes(2.0, ffs), listw), fus), mtimes(2.0, fus)), lbs), lw), uw);
        h = plus(plus(plus(mtimes(8.0, plus(fus, uh)), lh), mtimes(2.0, fus)), uh);
        fp = horzcat(15.0, minus(plus(fp(2.0), fp(4.0)), h), w, h);
        % 44 46
        fig_props = cellhorzcat('name', figname, 'resize', 'off', 'numbertitle', 'off', 'windowstyle', 'modal', 'createfcn', '', 'position', fp, 'closerequestfcn', 'sbswitch(''sptprefs'',''cancel'')', 'color', get(0.0, 'defaultuicontrolbackgroundcolor'), 'units', 'pixels', 'dockcontrols', 'off', 'handlevisibility', 'callback');
        % 46 59
        % 47 59
        % 48 59
        % 49 59
        % 50 59
        % 51 59
        % 52 59
        % 53 59
        % 54 59
        % 55 59
        % 56 59
        % 57 59
        fig = figure(fig_props{:});
        % 59 61
        cancel_btn = uicontrol('style', 'pushbutton', 'units', 'pixels', 'string', cancelstring, 'position', horzcat(minus(minus(fp(3.0), ffs), bw1), ffs, bw1, uh), 'tag', 'cancelButton', 'callback', 'sbswitch(''sptprefs'',''cancel'')');
        % 61 67
        % 62 67
        % 63 67
        % 64 67
        % 65 67
        ud.ok_btn = uicontrol('style', 'pushbutton', 'units', 'pixels', 'string', okstring, 'enable', 'off', 'tag', 'okButton', 'position', horzcat(minus(minus(minus(minus(fp(3.0), ffs), bw1), fus), bw1), ffs, bw1, uh), 'callback', 'applyfilt(''ok'')');
        % 67 75
        % 68 75
        % 69 75
        % 70 75
        % 71 75
        % 72 75
        % 73 75
        ud.list = uicontrol('style', 'listbox', 'units', 'pixels', 'string', cellhorzcat(prefs.panelDescription), 'value', panelInd, 'tag', 'listbox', 'position', horzcat(ffs, plus(plus(ffs, fus), uh), listw, minus(minus(minus(fp(4.0), mtimes(2.0, ffs)), fus), uh)), 'callback', 'sbswitch(''sptprefs'',''list'')', 'backgroundcolor', 'w');
        % 75 84
        % 76 84
        % 77 84
        % 78 84
        % 79 84
        % 80 84
        % 81 84
        % 82 84
        ud.helpButton = uicontrol('style', 'pushbutton', 'units', 'pixels', 'tag', 'helpButton', 'string', 'Help...', 'position', horzcat(ffs, ffs, listw, uh), 'callback', 'sbswitch(''sptprefs'',''help'')');
        % 84 91
        % 85 91
        % 86 91
        % 87 91
        % 88 91
        % 89 91
        ud.prefs = prefs;
        % 91 93
        ud.factory = uicontrol('style', 'pushbutton', 'units', 'pixels', 'string', 'Factory Settings', 'tag', 'factoryButton', 'position', horzcat(plus(plus(ffs, fus), listw), ffs, bw, uh), 'callback', 'sbswitch(''sptprefs'',''factory'')');
        % 93 99
        % 94 99
        % 95 99
        % 96 99
        % 97 99
        ud.revert = uicontrol('style', 'pushbutton', 'units', 'pixels', 'string', 'Revert Panel', 'tag', 'revertButton', 'position', horzcat(plus(plus(plus(plus(ffs, fus), listw), fus), bw), ffs, bw, uh), 'callback', 'sbswitch(''sptprefs'',''revert'')');
        % 99 107
        % 100 107
        % 101 107
        % 102 107
        % 103 107
        % 104 107
        % 105 107
        pf_pos = horzcat(plus(plus(ffs, fus), listw), plus(mtimes(2.0, fus), uh), plus(plus(plus(mtimes(2.0, fus), lbs), lw), uw), plus(mtimes(8.0, plus(uh, fus)), mrdivide(lh, 2.0)));
        ud.panelFrame = uicontrol('style', 'frame', 'units', 'pixels', 'tag', 'panelFrame', 'position', pf_pos);
        % 108 112
        % 109 112
        % 110 112
        ud.panelLabel = uicontrol('style', 'text', 'units', 'pixels', 'tag', 'panelLabel', 'position', horzcat(plus(pf_pos(1.0), 10.0), minus(plus(pf_pos(2.0), pf_pos(4.0)), mrdivide(lh, 2.0)), lw, lh), 'string', ud.prefs(panelInd).panelDescription);
        % 112 117
        % 113 117
        % 114 117
        % 115 117
        minwidthLeft(ud.panelLabel)
        % 117 119
        ud.panelControls = cell(length(prefs), 1.0);
        % 119 121
        ud.panelControls{panelInd} = createPanel(prefs(panelInd), pf_pos, fus, lbs, lw, lh, uw, uh);
        % 121 124
        % 122 124
        ud.whichControl = [];
        ud.changedFlags = zeros(length(ud.prefs), 1.0);
        ud.flag = '';
        set(fig, 'userdata', ud)
        setEnable(panelInd, ud.prefs, ud.panelControls, ud.factory, ud.revert)
        % 128 131
        % 129 131
        if isequal(panelInd, 5.0)
            if eq(nargin, 3.0) && eq(varargin{3.0}, 1.0)
                filterPanelEnable(panelInd, ud);
            else
                set(horzcat(ud.panelControls{panelInd}{:}), 'Enable', 'off');
            end
        end
        setEnable(panelInd, ud.prefs, ud.panelControls, ud.factory, ud.revert);
        % 138 142
        % 139 142
        % 140 142
        if isequal(panelInd, 5.0)
            if eq(nargin, 3.0) && eq(varargin{3.0}, 0.0)
                set(ud.factory, 'Enable', 'off');
            end
        end
        % 146 148
        done = 0.0;
        while ~(done)
            waitfor(fig, 'userdata')
            % 150 152
            ud = get(fig, 'userdata');
            % 152 154
            switch ud.flag
            case 'list'
                oldPanelInd = panelInd;
                panelInd = get(ud.list, 'value');
                % 157 159
                if ne(panelInd, oldPanelInd)
                    % 159 161
                    set(ud.panelLabel, 'string', ud.prefs(panelInd).panelDescription);
                    minwidthLeft(ud.panelLabel)
                    % 162 165
                    % 163 165
                    set(horzcat(ud.panelControls{oldPanelInd}{:}), 'visible', 'off')
                    % 165 168
                    % 166 168
                    if isempty(ud.panelControls{panelInd})
                        ud.panelControls{panelInd} = createPanel(prefs(panelInd), pf_pos, fus, lbs, lw, lh, uw, uh);
                    else
                        % 170 172
                        set(horzcat(ud.panelControls{panelInd}{:}), 'visible', 'on')
                    end
                    % 173 177
                    % 174 177
                    % 175 177
                    if isequal(panelInd, 5.0)
                        if eq(nargin, 3.0) && eq(varargin{3.0}, 1.0)
                            filterPanelEnable(panelInd, ud);
                        else
                            set(horzcat(ud.panelControls{panelInd}{:}), 'Enable', 'off');
                        end
                    end
                    setEnable(panelInd, ud.prefs, ud.panelControls, ud.factory, ud.revert);
                    % 184 188
                    % 185 188
                    % 186 188
                    if isequal(panelInd, 5.0)
                        if eq(nargin, 3.0) && eq(varargin{3.0}, 0.0)
                            set(ud.factory, 'Enable', 'off');
                        end
                    end
                    % 192 194
                end
            case 'change'
                % 195 198
                % 196 198
                if strcmp('radiobutton', get(ud.panelControls{panelInd}{ud.whichControl}(1.0), 'style'))
                    % 198 200
                    radioTag = ud.prefs(panelInd).controls{ud.whichControl, 4.0};
                    if ~(isempty(radioTag))
                        u = findobj('style', 'radiobutton', 'userdata', radioTag, 'visible', 'on');
                        % 202 204
                        set(u, 'value', 0.0)
                        set(ud.panelControls{panelInd}{ud.whichControl}, 'value', 1.0)
                    end
                end
                % 207 211
                % 208 211
                % 209 211
                if isequal(panelInd, 5.0)
                    filterPanelEnable(panelInd, ud);
                end
                % 213 219
                % 214 219
                % 215 219
                % 216 219
                % 217 219
                setEnable(panelInd, ud.prefs, ud.panelControls, ud.factory, ud.revert)
            case 'revert'
                % 220 223
                % 221 223
                setPanel(ud.panelControls{panelInd}, ud.prefs(panelInd).currentValue)
                % 223 228
                % 224 228
                % 225 228
                % 226 228
                if isequal(panelInd, 5.0)
                    if eq(nargin, 3.0) && eq(varargin{3.0}, 1.0)
                        filterPanelEnable(panelInd, ud);
                    else
                        set(horzcat(ud.panelControls{panelInd}{:}), 'Enable', 'off');
                    end
                end
                setEnable(panelInd, ud.prefs, ud.panelControls, ud.factory, ud.revert);
                % 235 239
                % 236 239
                % 237 239
                if isequal(panelInd, 5.0)
                    if eq(nargin, 3.0) && eq(varargin{3.0}, 0.0)
                        set(ud.factory, 'Enable', 'off');
                    end
                end
            case 'factory'
                % 244 246
                setPanel(ud.panelControls{panelInd}, ud.prefs(panelInd).controls(:, 7.0))
                % 246 252
                % 247 252
                % 248 252
                % 249 252
                % 250 252
                if isequal(panelInd, 5.0)
                    if eq(nargin, 3.0) && eq(varargin{3.0}, 1.0)
                        filterPanelEnable(panelInd, ud);
                    else
                        set(horzcat(ud.panelControls{panelInd}{:}), 'Enable', 'off');
                    end
                end
                setEnable(panelInd, ud.prefs, ud.panelControls, ud.factory, ud.revert);
                % 259 263
                % 260 263
                % 261 263
                if isequal(panelInd, 5.0)
                    if eq(nargin, 3.0) && eq(varargin{3.0}, 0.0)
                        set(ud.factory, 'Enable', 'off');
                    end
                end
            case 'ok'
                newprefs = ud.prefs;
                err = 0.0;
                for i=1.0:length(ud.prefs)
                    if ~(isempty(ud.panelControls{i}))
                        newprefs(i).currentValue = getPanel(ud.panelControls{i});
                    end
                    % 274 276
                    if ~(isequal(newprefs(i).currentValue, ud.prefs(i).currentValue))
                        p = cell2struct(newprefs(i).currentValue, ud.prefs(i).controls(:, 1.0));
                        % 277 279
                        for j=1.0:length(ud.prefs(i).clientList)
                            errstr = feval(ud.prefs(i).clientList{j}, 'setprefs', ud.prefs(i).panelName, p);
                            % 280 282
                            err = gt(length(errstr), 0.0);
                            if err
                                break
                            end
                        end % for
                        if err
                            break
                        end
                        ud.prefs(i).currentValue = newprefs(i).currentValue;
                        sptool('setprefs', ud.prefs(i).panelName, p, SPTfig)
                    end
                end % for
                if err
                    done = 0.0;
                    msgbox(errstr, 'Error', 'error', 'modal')
                else
                    done = 1.0;
                end
            case 'cancel'
                % 300 302
                done = 1.0;
                err = 1.0;
            case 'help'
                sptprefsHelp
            end
            % 306 308
            if ~(done)
                if strcmp(get(ud.revert, 'enable'), 'on')
                    ud.changedFlags(panelInd) = 1.0;
                else
                    ud.changedFlags(panelInd) = 0.0;
                end
                if any(ud.changedFlags)
                    set(ud.ok_btn, 'enable', 'on')
                else
                    set(ud.ok_btn, 'enable', 'off')
                end
                ud.flag = [];
                set(fig, 'userdata', ud)
            end
        end % while
        % 322 324
        delete(fig)
        varargout{1.0} = ud.prefs;
        varargout{2.0} = panelInd;
    otherwise
        % 327 330
        % 328 330
        % 329 331
        fig = gcf;
        ud = get(fig, 'userdata');
        ud.flag = action;
        if gt(nargin, 1.0)
            ud.whichControl = varargin{2.0};
        end
        set(fig, 'userdata', ud)
        % 337 339
    end
end
function minwidthLeft(h, n)
    % 341 347
    % 342 347
    % 343 347
    % 344 347
    % 345 347
    if eq(nargin, 1.0)
        n = 2.0;
    end
    for i=1.0:length(h)
        ex = get(h(i), 'extent');
        pos = get(h(i), 'position');
        style = get(h(i), 'style');
        if (strcmp(style, 'checkbox')) | (strcmp(style, 'radiobutton'))
            % 354 356
            set(h(i), 'horizontalalignment', 'center', 'position', horzcat(pos(1.0), pos(2.0), plus(plus(ex(3.0), mtimes(2.0, n)), 30.0), pos(4.0)))
        else
            % 357 359
            set(h(i), 'horizontalalignment', 'center', 'position', horzcat(pos(1.0), pos(2.0), plus(ex(3.0), mtimes(2.0, n)), pos(4.0)));
            % 359 361
        end
    end % for
end
function panelControls = createPanel(prefs, pf_pos, fus, lbs, lw, lh, uw, uh)
    % 364 376
    % 365 376
    % 366 376
    % 367 376
    % 368 376
    % 369 376
    % 370 376
    % 371 376
    % 372 376
    % 373 376
    % 374 376
    labelPos = horzcat(plus(pf_pos(1.0), fus), plus(minus(plus(pf_pos(2.0), pf_pos(4.0)), mrdivide(lh, 2.0)), fus), lw, uh);
    controlPos = horzcat(plus(plus(plus(pf_pos(1.0), fus), lbs), lw), plus(minus(plus(pf_pos(2.0), pf_pos(4.0)), mrdivide(lh, 2.0)), fus), uw, uh);
    % 377 380
    % 378 380
    N = size(prefs.controls, 1.0);
    % 380 385
    % 381 385
    % 382 385
    % 383 385
    panelControls = cell(1.0, N);
    for i=1.0:N
        if eq(i, 1.0)
            labelPos = minus(labelPos, horzcat(0.0, plus(uh, fus), 0.0, 0.0));
        else
            labelPos = minus(labelPos, horzcat(0.0, plus(mtimes(prefs.controls{minus(i, 1.0), 5.0}, uh), fus), 0.0, 0.0));
        end
        controlPos = minus(controlPos, horzcat(0.0, plus(mtimes(prefs.controls{i, 5.0}, uh), fus), 0.0, 0.0));
        controlPos(4.0) = mtimes(prefs.controls{i, 5.0}, uh);
        switch prefs.controls{i, 3.0}
        case 'edit'
            panelControls{i} = uicontrol('style', 'text', 'units', 'pixels', 'tag', horzcat('control', num2str(i)), 'position', labelPos, 'string', prefs.controls{i, 2.0}, 'horizontalalignment', 'right');
            % 396 402
            % 397 402
            % 398 402
            % 399 402
            % 400 402
            panelControls{i} = horzcat(panelControls{i}, uicontrol('style', 'edit', 'units', 'pixels', 'tag', horzcat('control', num2str(i)), 'backgroundcolor', 'w', 'string', prefs.currentValue{i}, 'callback', horzcat('sbswitch(''sptprefs'',''change'',', num2str(i), ')'), 'userdata', prefs.controls{i, 4.0}, 'position', controlPos, 'horizontalalignment', 'left', 'max', prefs.controls{i, 5.0}));
            % 403 411
            % 404 411
            % 405 411
            % 406 411
            % 407 411
            % 408 411
            % 409 411
        case 'popupmenu'
            % 410 412
            panelControls{i} = uicontrol('style', 'text', 'units', 'pixels', 'tag', horzcat('control', num2str(i)), 'position', labelPos, 'string', prefs.controls{i, 2.0}, 'horizontalalignment', 'right');
            % 412 418
            % 413 418
            % 414 418
            % 415 418
            % 416 418
            panelControls{i} = horzcat(panelControls{i}, uicontrol('style', 'popupmenu', 'backgroundcolor', 'white', 'units', 'pixels', 'tag', horzcat('control', num2str(i)), 'string', prefs.controls{i, 6.0}, 'value', prefs.currentValue{i}, 'callback', horzcat('sbswitch(''sptprefs'',''change'',', num2str(i), ')'), 'userdata', prefs.controls{i, 4.0}, 'position', controlPos));
            % 419 427
            % 420 427
            % 421 427
            % 422 427
            % 423 427
            % 424 427
            % 425 427
        case 'radiobutton'
            % 426 428
            panelControls{i} = uicontrol('style', 'radiobutton', 'units', 'pixels', 'tag', horzcat('control', num2str(i)), 'position', labelPos, 'string', prefs.controls{i, 2.0}, 'value', prefs.currentValue{i}, 'callback', horzcat('sbswitch(''sptprefs'',''change'',', num2str(i), ')'), 'userdata', prefs.controls{i, 4.0});
            % 428 436
            % 429 436
            % 430 436
            % 431 436
            % 432 436
            % 433 436
            % 434 436
            minwidthLeft(panelControls{i})
        case 'checkbox'
            % 437 439
            panelControls{i} = uicontrol('style', 'checkbox', 'units', 'pixels', 'tag', horzcat('control', num2str(i)), 'position', labelPos, 'string', prefs.controls{i, 2.0}, 'value', prefs.currentValue{i}, 'callback', horzcat('sbswitch(''sptprefs'',''change'',', num2str(i), ')'), 'userdata', prefs.controls{i, 4.0});
            % 439 447
            % 440 447
            % 441 447
            % 442 447
            % 443 447
            % 444 447
            % 445 447
            minwidthLeft(panelControls{i})
        end
        % 448 450
    end % for
end
function setPanel(panelControls, value)
    % 452 458
    % 453 458
    % 454 458
    % 455 458
    % 456 458
    N = length(panelControls);
    for i=1.0:N
        if eq(length(panelControls{i}), 1.0)
            style = get(panelControls{i}(1.0), 'style');
        else
            style = get(panelControls{i}(2.0), 'style');
        end
        switch style
        case 'edit'
            set(panelControls{i}(2.0), 'string', value{i})
        case 'popupmenu'
            set(panelControls{i}(2.0), 'value', value{i})
        case {'radiobutton','checkbox'}
            set(panelControls{i}(1.0), 'value', value{i})
        end
    end % for
    % 473 475
    for i=1.0:N
        out = panelControls{i};
    end % for
end
function values = getPanel(panelControls)
    % 479 485
    % 480 485
    % 481 485
    % 482 485
    % 483 485
    values = {};
    for i=1.0:length(panelControls)
        if eq(length(panelControls{i}), 1.0)
            style = get(panelControls{i}(1.0), 'style');
        else
            style = get(panelControls{i}(2.0), 'style');
        end
        switch style
        case 'edit'
            values = cellhorzcat(values{:}, get(panelControls{i}(2.0), 'string'));
        case 'popupmenu'
            % 495 497
            values = cellhorzcat(values{:}, get(panelControls{i}(2.0), 'value'));
        case {'radiobutton','checkbox'}
            % 498 500
            values = cellhorzcat(values{:}, get(panelControls{i}(1.0), 'value'));
            % 500 502
        end
    end % for
    values = values(:);
end
function setEnable(panelInd, prefs, panelControls, factory, revert)
    % 506 509
    % 507 509
    values = getPanel(panelControls{panelInd});
    if isequal(values, prefs(panelInd).currentValue)
        set(revert, 'enable', 'off')
    else
        set(revert, 'enable', 'on')
    end
    if isequal(values, prefs(panelInd).controls(:, 7.0))
        set(factory, 'enable', 'off')
    else
        set(factory, 'enable', 'on')
    end
end
function sptprefsHelp
    % 521 523
    fig = gcf;
    ud = get(fig, 'userdata');
    set(ud.helpButton, 'String', 'Click for Help...')
    setptr(fig, 'help')
    % 526 528
    panelInd = get(ud.list, 'value');
    % 528 530
    uilist = findobj(fig, 'type', 'uicontrol');
    saveenable = get(uilist, 'enable');
    set(uilist, 'enable', 'inactive', 'buttondownfcn', 'set(findobj(gcf,''tag'',''helpButton''),''userdata'',get(gcbo,''tag''))')
    % 532 536
    % 533 536
    % 534 536
    set(ud.helpButton, 'userdata', 0.0)
    waitfor(ud.helpButton, 'userdata')
    tag = get(ud.helpButton, 'userdata');
    switch tag
    case 'helpButton'
        s = {'PREFERENCES DIALOG BOX';' ';'This window allows you to change certain settings of the SPTool';'and its clients that will be remembered between MATLAB sessions.';'The preferences are saved on disk in the MAT-file "sigprefs.mat".';' ';'To get help on any preference or on how to use the buttons, ';'click "Help..." once, and then click on the item you would like';'more help on.'};
        % 542 552
        % 543 552
        % 544 552
        % 545 552
        % 546 552
        % 547 552
        % 548 552
        % 549 552
        % 550 552
    case 'revertButton'
        % 551 553
        s = {'REVERT PANEL BUTTON';' ';'Press this button to revert the preferences in the current ';'panel to what they were when you opened the preferences window.';' ';'This button is enabled only if you have made a change to the';'preferences in the current panel.'};
        % 554 562
        % 555 562
        % 556 562
        % 557 562
        % 558 562
        % 559 562
        % 560 562
    case 'factoryButton'
        % 561 563
        s = {'FACTORY SETTINGS BUTTON';' ';'Press this button to restore the preferences in the current panel';'to their "factory settings", that is, the settings at the time';'the software was first installed.';' ';'This button is enabled only when the preferences in the current';'panel are not the same as the factory settings.'};
        % 564 573
        % 565 573
        % 566 573
        % 567 573
        % 568 573
        % 569 573
        % 570 573
        % 571 573
    case 'okButton'
        % 572 574
        s = {'OK BUTTON';' ';'Press this button to apply your changes to the preferences and';'close the preferences window.';' ';'This button is only enabled when you have made some change to';'a preference.';' ';'If the file "sigprefs.mat" is not found, a dialog box will appear,';'asking you to find a place to save this file.  If this process ';'happens repeatedly, then either you are saving the file somewhere';'not on your MATLAB path or current directory, or perhaps you are out of';'disk space or the directory is write-protected.'};
        % 575 589
        % 576 589
        % 577 589
        % 578 589
        % 579 589
        % 580 589
        % 581 589
        % 582 589
        % 583 589
        % 584 589
        % 585 589
        % 586 589
        % 587 589
    case 'cancelButton'
        % 588 590
        s = {'CANCEL BUTTON';' ';'Press this button to close the preferences window, ignoring any';'changes made while it was open.'};
        % 591 596
        % 592 596
        % 593 596
        % 594 596
    case 'listbox'
        % 595 597
        s = {'PREFERENCE CATEGORY LIST';' ';'This is a list of all the categories of preferences that you';'can change for the SPTool.';' ';'By clicking on a category, the panel on the right changes to';'reflect the preferences for that category.';' ';'To get help on a category, change to that category first, and then';'click on "Help..." and click the question mark cursor on the';'category name at the top of the panel on the right.'};
        % 598 610
        % 599 610
        % 600 610
        % 601 610
        % 602 610
        % 603 610
        % 604 610
        % 605 610
        % 606 610
        % 607 610
        % 608 610
    case {'panelLabel','panelFrame'}
        % 609 611
        s = cellhorzcat(horzcat('Preferences for "', ud.prefs(panelInd).panelDescription, '"'), ' ', ud.prefs(panelInd).panelHelp{:});
    otherwise
        % 612 616
        % 613 616
        % 614 616
        % 615 617
        ind = findstr('control', tag);
        if ~(isempty(ind))
            tag(1.0:7.0) = [];
            i = str2double(tag);
            s = cellhorzcat(horzcat('You have clicked on preference "', ud.prefs(panelInd).controls{i, 2.0}, '"'), horzcat('in the category "', ud.prefs(panelInd).panelDescription, '".'), ' ', ud.prefs(panelInd).controls{i, 8.0}{:});
        else
            % 622 628
            % 623 628
            % 624 628
            % 625 628
            % 626 628
            % 627 629
            s = cellhorzcat(horzcat('this object has tag ', tag));
        end
    end
    % 631 633
    set(uilist, {'enable'}, saveenable, 'buttondownfcn', '')
    set(ud.helpButton, 'String', 'Help...')
    setptr(fig, 'arrow')
    % 635 637
    fp = get(fig, 'position');
    sz = sptsizes;
    helpButtonPos = get(ud.helpButton, 'position');
    sz.uh = helpButtonPos(4.0);
    % 640 642
    saveVis = get(uilist, 'visible');
    if ispc
        set(uilist, 'visible', 'off')
    end
    % 645 647
    f = uicontrol('style', 'frame', 'position', horzcat(sz.fus, sz.fus, minus(fp(3.0), mtimes(2.0, sz.fus)), minus(minus(fp(4.0), sz.fus), 1.0)), 'tag', 'prefhelp');
    % 647 650
    % 648 650
    tp = horzcat(mtimes(2.0, sz.fus), plus(mtimes(4.0, sz.fus), sz.uh), minus(fp(3.0), mtimes(4.0, sz.fus)), minus(fp(4.0), plus(mtimes(6.0, sz.fus), sz.uh)));
    % 650 652
    [fontname, fontsize] = fixedfont;
    t = uicontrol('style', 'listbox', 'position', tp, 'string', s, 'max', 2.0, 'tag', 'prefhelp', 'horizontalalignment', 'left', 'backgroundcolor', 'w', 'fontname', fontname, 'fontsize', fontsize);
    % 653 656
    % 654 656
    bp = horzcat(minus(mrdivide(fp(3.0), 2.0), mrdivide(sz.bw, 2.0)), mtimes(2.0, sz.fus), sz.bw, sz.uh);
    okCbStr = 'delete(findobj(gcf,''tag'',''prefhelp''))';
    b = uicontrol('style', 'pushbutton', 'position', bp, 'tag', 'prefhelp', 'string', 'OK', 'callback', okCbStr);
    % 658 665
    % 659 665
    % 660 665
    % 661 665
    % 662 665
    % 663 665
    closeReqFcn = get(fig, 'CloseRequestFcn');
    set(fig, 'CloseRequestFcn', okCbStr);
    waitfor(b)
    set(fig, 'CloseRequestFcn', closeReqFcn);
    % 668 670
    if all(ishandle(uilist))
        if strcmp(computer, 'PCWIN')
            set(uilist, {'visible'}, saveVis)
        end
    end
end
function filterPanelEnable(panelInd, ud)
    values = getPanel(ud.panelControls{panelInd});
    FDAFlag = values(2.0);
    if eq(FDAFlag{1.0}, 1.0)
        set(ud.panelControls{panelInd}{4.0}, 'Enable', 'off');
        set(ud.panelControls{panelInd}{5.0}, 'Enable', 'off');
        set(ud.panelControls{panelInd}{6.0}, 'Enable', 'off');
    else
        set(ud.panelControls{panelInd}{4.0}, 'Enable', 'on');
        set(ud.panelControls{panelInd}{5.0}, 'Enable', 'on');
        set(ud.panelControls{panelInd}{6.0}, 'Enable', 'on');
    end
end
