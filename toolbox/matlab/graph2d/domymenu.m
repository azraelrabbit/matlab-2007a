function domymenu(method, parameter, object)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if strcmp(method, 'menubar')
        if eq(nargin, 3.0) && not(isempty(object)) && ishandle(object) && strcmp(get(object, 'type'), 'figure')
            % 8 10
            fig = object;
        else
            fig = gcbf;
        end % if
        LDoMenubar(fig, parameter);
        return;
    end % if
    % 16 18
    if eq(nargin, 3.0)
        CurrentHGObj = object;
    else
        CurrentHGObj = gcoall(gcbf);
    end % if
    % 22 24
    ud = getscribeobjectdata(CurrentHGObj);
    if isempty(ud)
        primaryObj = getappdata(CurrentHGObj, 'ScribeButtonDownHGObj');
        if any(ishandle(primaryObj))
            ud = getscribeobjectdata(primaryObj);
        end % if
    end % if
    % 30 32
    try
        if not(isempty(ud))
            A = ud.ObjectStore;
        else
            A = [];
        end % if
    catch
        % 38 42
        % 39 42
        % 40 42
        % 41 43
        if strcmp(method, 'menubar')
            A = [];
            % 44 46
            LDoMenubar(CurrentHGObj, parameter);
            return;
        else
            return;
        end % if
    end % try
    % 51 53
    try
        switch method
        case 'menubar'
            LDoMenubar(CurrentHGObj, parameter);
        case 'update'
            % 57 59
            A = doselect(A);
            A = updatemenu(A);
            UIC = gcbo;
            % 61 63
            [copyBufferFig, copyBufferAx] = getcopybuffer('noforce');
            if not(isempty(copyBufferFig)) && not(isempty(LGetSelection(copyBufferFig)))
                % 64 66
                set(findall(UIC, 'Label', '&Paste'), 'Enable', 'on');
            else
                % 67 69
                set(findall(UIC, 'Label', '&Paste'), 'Enable', 'off');
                % 69 71
            end % if
            % 71 73
            callingObject = getappdata(UIC, 'ScribeOneShotContextMenuFlag');
            if not(isempty(callingObject))
                try
                    set(callingObject, {'UIContextMenu','ButtonDownFcn'}, getappdata(UIC, 'ScribeSaveFcns'));
                    % 76 78
                    rmappdata(UIC, 'ScribeSaveFcns');
                catch
                    warning('MATLAB:domymenu:ObjectCorrupted', 'Object properties may be corrupted');
                end % try
            end % if
        case 'updatemenu'
            myFig = get(A, 'Figure');
            switch parameter
            case 'edit'
                CCCMenu = findall(myFig, 'Tag', 'scrCCCMenu');
                selection = LGetSelection(myFig);
                if isempty(selection)
                    set(CCCMenu, 'Enable', 'off');
                else
                    set(CCCMenu, 'Enable', 'on');
                end % if
                % 93 95
                [copyBufferFig, copyBufferAx] = getcopybuffer('noforce');
                if not(isempty(copyBufferFig)) && not(isempty(LGetSelection(copyBufferFig)))
                    % 96 98
                    set(findall(myFig, 'Tag', 'scrPasteMenu'), 'Enable', 'on');
                else
                    % 99 101
                    set(findall(myFig, 'Tag', 'scrPasteMenu'), 'Enable', 'off');
                    % 101 103
                end % if
                % 103 105
                switch plotedit(myFig, 'getenabletools')
                case 'off'
                    PasteMenu = findall(myFig, 'Tag', 'scrPasteMenu');
                    set(vertcat(PasteMenu, CCCMenu), 'Enable', 'off');
                    % 108 110
                end % switch
            end % switch
            % 111 113
            if not(usejava('mwt'))
                % 113 116
                % 114 116
                set(findall(myFig, 'tag', 'figMenuEditGCF'), 'visible', 'off');
                set(findall(myFig, 'tag', 'figMenuEditGCA'), 'separator', 'on');
                set(findall(myFig, 'tag', 'figMenuEditGCO'), 'visible', 'off');
            end % if
        case 'style'
            % 120 123
            % 121 123
            A = editstyle(A, parameter);
            myFig = get(A, 'Figure');
            myClass = class(A);
            selection = LGetSelection(myFig);
            for aObj=selection
                switch myClass
                case {'arrowline','editline'}
                    if isa(aObj, 'arrowline') || isa(aObj, 'editline')
                        domethod(aObj, 'editstyle', parameter);
                    end % if
                otherwise
                    if isa(aObj, myClass)
                        domethod(aObj, 'editstyle', parameter);
                    end % if
                end % switch
            end % for
            % 138 140
            LUpdateLegend(selection);
        case 'size'
            % 141 144
            % 142 144
            A = editsize(A, parameter);
            myFig = get(A, 'Figure');
            myClass = class(A);
            selection = LGetSelection(myFig);
            for aObj=selection
                switch myClass
                case {'arrowline','editline'}
                    if isa(aObj, 'arrowline') || isa(aObj, 'editline')
                        domethod(aObj, 'editsize', parameter);
                    end % if
                otherwise
                    if isa(aObj, myClass)
                        domethod(aObj, 'editsize', parameter);
                    end % if
                end % switch
            end % for
            % 159 161
            LUpdateLegend(selection);
        case 'color'
            % 162 164
            myColor = get(A, 'Color');
            myFig = get(A, 'Figure');
            selection = LGetSelection(myFig);
            if eq(length(selection), 1.0)
                c = uisetcolor(myColor);
            else
                % 169 171
                c = uisetcolor;
            end % if
            if eq(length(c), 1.0) && eq(c, 0.0)
                % 173 175
                return;
            end % if
            % 176 180
            % 177 180
            % 178 180
            for aObj=selection
                if not(strcmp(class(aObj), 'axisobj'))
                    % 181 183
                    set(aObj, 'Color', c);
                end % if
            end % for
            % 185 187
            LUpdateLegend(selection);
        case 'string'
            % 188 190
            A = editopen(A);
        case 'moveresize'
            % 191 193
            newstate = not(get(A, 'Draggable'));
            % 193 195
            LWriteBack(A, ud, CurrentHGObj);
            for a=LGetSelection(get(A, 'Figure'))
                if strcmp(class(a), 'axisobj')
                    set(a, 'Draggable', newstate);
                end % if
            end % for
            return;
        case 'showlegend'
            % 202 207
            % 203 207
            % 204 207
            % 205 207
            if islegendon(get(A, 'MyHGHandle'))
                newstate = 'off';
            else
                newstate = 'on';
            end % if
            % 211 213
            LWriteBack(A, ud, CurrentHGObj);
            for a=LGetSelection(get(A, 'Figure'))
                if strcmp(class(a), 'axisobj')
                    domethod(a, 'showlegend', newstate);
                end % if
            end % for
            % 218 220
            return;
        case 'more'
            % 221 223
            A = editopen(A);
        case 'font'
            A = editfont(A);
        case {'cut','copy','paste','clear'}
            myFig = get(A, 'Figure');
            cutcopypaste(myFig, method);
            return;
        end % switch
        % 230 232
        LWriteBack(A, ud, CurrentHGObj);
    catch
        % 233 235
        warning('MATLAB:domymenu:ExecutionError', 'Error executing plot editor menu');
    end % try
function LWriteBack(A, ud, HG)
    % 237 240
    % 238 240
    if not(isempty(A))
        ud.ObjectStore = A;
        if any(ishandle(HG))
            setscribeobjectdata(HG, ud);
        end % if
    end % if
function LDoMenubar(myFig, method)
    % 246 250
    % 247 250
    % 248 250
    switch method
    case {'cut','copy','paste','clear'}
        cutcopypaste(myFig, method);
    case {'save','saveas'}
        selection = LGetSelection(myFig);
        plotedit(myFig, 'off', 'silent');
        % 255 257
        scribeclearmode(myFig, '');
        switch method
        case 'save'
            filemenufcn(myFig, 'FileSave');
        case 'saveas'
            filemenufcn(myFig, 'FileSaveAs');
        end % switch
        plotedit(myFig, 'on');
        % 264 266
        for a=selection
            set(a, 'IsSelected', 1.0);
        end % for
    case 'toggletoolbar'
        % 269 272
        % 270 272
        hTB = findall(myFig, 'Tag', 'FigureToolBar');
        if isempty(hTB)
            oldFeature = feature('figuretools');
            feature('figuretools', 1.0);
            set(myFig, 'ToolBar', 'figure');
            feature('figuretools', oldFeature);
            % 277 279
            hTB = findall(myFig, 'Tag', 'FigureToolBar');
            % 279 282
            % 280 282
            offon = {'off','on'};
            set(findall(hTB, 'Tag', 'Standard.EditPlot'), 'state', offon{plus(plotedit(myFig, 'isactive'), 1.0)});
            % 283 286
            % 284 286
            zoomInActive = 0.0;
            zoomOutActive = 0.0;
            switch zoom(myFig, 'getmode')
            case {'in','on'}
                zoomInActive = 1.0;
            case 'out'
                zoomOutActive = 1.0;
            end % switch
            set(uigettoolbar(hTB, 'Exploration.ZoomOut'), 'state', offon{plus(zoomOutActive, 1.0)});
            % 294 296
            set(uigettoolbar(hTB, 'Exploration.ZoomIn'), 'state', offon{plus(zoomInActive, 1.0)});
            % 296 299
            % 297 299
            isRotate3dActive = not(isempty(findall(myFig, 'type', 'axes', 'Tag', 'MATLAB_Rotate3D_Axes')));
            set(uigettoolbar(hTB, 'Exploration.Rotate'), 'state', offon{plus(isRotate3dActive, 1.0)});
        else
            % 301 306
            % 302 306
            % 303 306
            % 304 306
            if strcmp(get(hTB, 'visible'), 'on')
                set(hTB, 'visible', 'off');
            else
                set(hTB, 'visible', 'on');
            end % if
            % 310 313
            % 311 313
        end % if
        drawnow
    case 'lockaxes'
        selection = LGetSelection(myFig);
        axesObjects = [];
        axLock = [];
        for a=selection
            if strcmp(class(a), 'axisobj')
                axesObjects = horzcat(axesObjects, a);
                axLock(plus(end, 1.0)) = get(a, 'Draggable');
            end % if
        end % for
        if not(isempty(axLock))
            if gt(length(find(axLock)), mrdivide(length(axLock), 2.0))
                setDrag = 0.0;
            else
                setDrag = 1.0;
            end % if
            for a=axesObjects
                set(a, 'Draggable', setDrag);
            end % for
        end % if
    case 'figureprop'
        LEditByType(myFig, myFig);
    case 'axesprop'
        h = LocSelectionHandles(myFig);
        % 338 340
        hAxesIndices = find(strcmp(get(h, 'Type'), 'axes'));
        if not(isempty(hAxesIndices))
            h = h(hAxesIndices);
        else
            h = gca(myFig);
        end % if
        % 345 347
        plotedit(myFig, 'on');
        propedit(h);
        % 349 351
    case 'currentprop'
        % 350 352
        currObj = LocSelectionHandles(myFig);
        % 352 354
        if isempty(currObj)
            currObj = get(myFig, 'currentobject');
        end % if
        % 356 358
        if isempty(currObj)
            axChild = get(get(myFig, 'CurrentAxes'), 'Children');
            if not(isempty(axChild))
                currObj = axChild(1.0);
            else
                currObj = myFig;
            end % if
        end % if
        % 365 367
        plotedit(myFig, 'on');
        propedit(currObj);
    case 'lineprop'
        % 369 371
        LEditByType(myFig, 'line');
    case 'textprop'
        LEditByType(myFig, 'text');
    case 'legend'
        % 374 382
        % 375 382
        % 376 382
        % 377 382
        % 378 382
        % 379 382
        % 380 382
        axObjects = [];
        % 382 384
        ploteditOn = plotedit(myFig, 'isactive');
        % 384 386
        if ploteditOn
            % 386 390
            % 387 390
            % 388 390
            selection = LGetSelection(myFig);
            % 390 392
            for a=selection
                if strcmp(class(a), 'axisobj')
                    % 393 396
                    % 394 396
                    axObjects = horzcat(axObjects, a);
                end % if
            end % for
        end % if
        % 399 402
        % 400 402
        if isempty(axObjects)
            % 402 404
            ax = get(myFig, 'CurrentAxes');
            if not(isempty(ax))
                % 405 407
                axObjects = getobj(ax);
                % 407 410
                % 408 410
                if isempty(axObjects)
                    axObjects = scribehandle(axisobj(ax));
                end % if
                % 412 414
            end % if
        end % if
        % 415 418
        % 416 418
        if isempty(axObjects)
            return;
        end % if
        % 420 422
        if not(ploteditOn)
            % 422 424
            plotedit(myFig, 'on', 'silent')
        end % if
        % 425 428
        % 426 428
        for a=axObjects
            domethod(a, 'showlegend', 'on');
        end % for
        % 430 433
        % 431 433
        if not(ploteditOn)
            plotedit(myFig, 'off', 'silent');
        end % if
    case 'addaxes'
        putdowntext('axesstart');
    case 'addtext'
        toolButton = findall(myFig, 'ToolTip', 'Insert Text');
        putdowntext('textstart', toolButton);
    case 'addarrow'
        toolButton = findall(myFig, 'ToolTip', 'Insert Arrow');
        putdowntext('arrowstart', toolButton);
    case 'addline'
        toolButton = findall(myFig, 'ToolTip', 'Insert Line');
        putdowntext('linestart', toolButton);
    case 'addxlabel'
        LEditAxesText(myFig, 'Xlabel');
    case 'addylabel'
        LEditAxesText(myFig, 'Ylabel');
    case 'addzlabel'
        LEditAxesText(myFig, 'Zlabel');
    case 'addtitle'
        LEditAxesText(myFig, 'Title');
    case 'addlight'
        % 455 458
        % 456 458
        if plotedit(myFig, 'isactive')
            axH = LocSelectionHandles(myFig);
        else
            axH = [];
        end % if
        % 462 464
        if isempty(axH)
            axH = get(myFig, 'currentaxes');
        end % if
        % 466 469
        % 467 469
        lightH = jpropeditutils('jaddlight', axH);
        % 469 471
        if plotedit(myFig, 'isactive')
            % 471 473
            if isempty(lightH)
                lightH = jpropeditutils('jaddlight', get(myFig, 'currentaxes'));
            end % if
        else
            plotedit(myFig, 'on');
        end % if
        % 478 480
        if not(isempty(lightH))
            propedit(lightH, '-noselect');
        end % if
        % 483 486
        % 484 486
    case 'addyaxis'
        % 485 487
        axH = gca;
        parent = get(axH, 'parent');
        % 488 492
        % 489 492
        % 490 492
        yAx = copyobj(axH, parent);
        % 492 495
        % 493 495
        if strcmp(get(axH, 'YAxisLocation'), 'right')
            yAxLoc = 'left';
        else
            yAxLoc = 'right';
        end % if
        % 499 503
        % 500 503
        % 501 503
        nChild = length(findobj(axH, 'type', 'line'));
        cOrder = get(axH, 'ColorOrder');
        cIndex = min(nChild, length(cOrder));
        cOrder = vertcat(cOrder(plus(cIndex, 1.0):end, :), cOrder(1.0:cIndex, :));
        lsOrder = get(axH, 'LineStyleOrder');
        lsIndex = min(nChild, length(lsOrder));
        lsOrder = vertcat(lsOrder(plus(lsIndex, 1.0):end, :), lsOrder(1.0:lsIndex, :));
        % 509 511
        set(yAx, 'ALimMode', 'manual', 'CameraPositionMode', 'auto', 'CameraTargetMode', 'auto', 'CameraUpVectorMode', 'auto', 'CameraViewAngleMode', 'auto', 'CLimMode', 'manual', 'Color', 'none', 'ColorOrder', cOrder, 'LineStyleOrder', lsOrder, 'DataAspectRatioMode', 'auto', 'PlotBoxAspectRatioMode', 'auto', 'Selected', 'off', 'Tag', 'Y Axis 2', 'UIContextMenu', [], 'UserData', [], 'XGrid', 'off', 'XLimMode', 'manual', 'XTick', [], 'ZGrid', 'off', 'ZLimMode', 'manual', 'ZTick', [], 'YAxisLocation', yAxLoc, 'YLimMode', 'auto', 'YTickMode', 'auto', 'YTickLabelMode', 'auto', 'ButtonDownFcn', '', 'CreateFcn', '', 'Selected', 'off');
        % 511 542
        % 512 542
        % 513 542
        % 514 542
        % 515 542
        % 516 542
        % 517 542
        % 518 542
        % 519 542
        % 520 542
        % 521 542
        % 522 542
        % 523 542
        % 524 542
        % 525 542
        % 526 542
        % 527 542
        % 528 542
        % 529 542
        % 530 542
        % 531 542
        % 532 542
        % 533 542
        % 534 542
        % 535 542
        % 536 542
        % 537 542
        % 538 542
        % 539 542
        % 540 542
        allAppData = getappdata(yAx);
        if isstruct(allAppData) && not(isempty(allAppData))
            fNames = fieldnames(allAppData);
            for i=1.0:length(fNames)
                rmappdata(yAx, fNames{i});
            end % for
        end % if
        % 548 550
        delete(allchild(yAx));
        set(get(yAx, 'YLabel'), 'String', 'Y Axis 2');
        set(gcf, 'currentaxes', yAx);
        % 553 556
        % 554 556
    case 'addcolorbar'
        % 555 557
        ax = get(myFig, 'currentaxes');
        hColorbar = colorbar('peer', ax);
        % 559 561
    case 'zoomin'
        % 560 562
        fixtoolbar(myFig);
        switch zoom(myFig, 'getmode')
        case {'off','out'}
            zoom(myFig, 'inmode');
        case {'in','on'}
            zoom(myFig, 'off');
        end % switch
    case 'zoomout'
        fixtoolbar(myFig);
        switch zoom(myFig, 'getmode')
        case {'on','off','in'}
            zoom(myFig, 'outmode');
        case 'out'
            zoom(myFig, 'off');
        end % switch
    case 'rotate3d'
        fixtoolbar(myFig);
        rotate3d(myFig);
    case 'inittoolsmenu'
        LUpdateToolsMenu(myFig);
    case 'initviewmenu'
        LUpdateViewMenu(myFig);
    case 'initinsertmenu'
        LUpdateInsertMenu(myFig);
    case 'initcameramotionmode'
        modeParent = findall(myFig, 'type', 'uimenu', 'tag', 'figMenuCameraMotionMode');
        modeItems = allchild(modeParent);
        set(modeItems, 'checked', 'off');
        currMode = cameratoolbar('getmode');
        activeItem = findall(modeItems, 'tag', horzcat('figMenuMode_', currMode));
        set(activeItem, 'Checked', 'on');
    case 'initcameraprincipalaxis'
        paxParent = findall(myFig, 'type', 'uimenu', 'tag', 'figMenuCameraPAx');
        paxItems = allchild(paxParent);
        offon = {'off','on'};
        isActive = ismember(cameratoolbar('getmode'), {'orbit','pan','walk'});
        set(paxItems, 'checked', 'off', 'enable', offon{plus(isActive, 1.0)});
        % 598 600
        if isActive
            currPAx = cameratoolbar('getcoordsys');
            activeItem = findall(paxItems, 'tag', horzcat('figMenuAxis_', currPAx));
            set(activeItem, 'Checked', 'on');
        end % if
    case 'initoptimizeaxesmode'
        bashParent = findall(myFig, 'type', 'uimenu', 'tag', 'figMenuOA3DMode');
        bashItems = findall(bashParent, 'type', 'uimenu');
        set(bashItems, 'checked', 'off');
        bashMode = cameratoolbar('getoptimizeaxesmode');
        activeItem = findall(bashItems, 'tag', horzcat('figMenuOA3D_', bashMode));
        set(activeItem, 'checked', 'on');
    case 'togglecamera'
        camModes = {'orbit','nomode'};
        isActive = not(isempty(cameratoolbar('getmode')));
        cameratoolbar('setmode', camModes{plus(isActive, 1.0)});
    end % switch
function LEditAxesText(MyFig, textType)
    % 617 622
    % 618 622
    % 619 622
    % 620 622
    axisH = get(MyFig, 'currentaxes');
    textH = get(axisH, textType);
    % 623 634
    % 624 634
    % 625 634
    % 626 634
    % 627 634
    % 628 634
    % 629 634
    % 630 634
    % 631 634
    % 632 634
    set(textH, 'Editing', 'on');
    waitfor(textH, 'Editing', 'off');
    % 635 645
    % 636 645
    % 637 645
    % 638 645
    % 639 645
    % 640 645
    % 641 645
    % 642 645
    % 643 645
    if any(ishandle(textH)) && not(strcmp(get(textH, 'BeingDeleted'), 'on'))
        % 645 648
        % 646 648
        propedit(textH, '-noopen');
        % 648 651
        % 649 651
        textString = get(textH, 'String');
        % 651 654
        % 652 654
        set(textH, 'String', cellstr(textString));
    end % if
function objectVector = LGetSelection(aFig)
    % 656 659
    % 657 659
    objectVector = [];
    % 659 661
    aFigObjH = getobj(aFig);
    if not(isempty(aFigObjH))
        % 662 665
        % 663 665
        dragBinH = aFigObjH.DragObjects;
        % 665 667
        objectVector = dragBinH.Items;
    end % if
function LUpdateLegend(objects)
    % 669 673
    % 670 673
    % 671 673
    parents = [];
    for a=objects
        parents(plus(end, 1.0)) = get(a, 'Parent');
    end % for
    parents = findobj(unique(parents), 'flat', 'Type', 'axes');
    % 677 679
    parents(find(strcmp(get(parents, 'Tag'), 'ScribeOverlayAxesActive'))) = [];
    % 679 681
    if not(isempty(parents))
        for ax=ctranspose(parents)
            if not(isa(handle(ax), 'graph2d.annotationlayer'))
                % 683 685
                legend(ax);
            end % if
        end % for
    end % if
function LSetFont(co, dlgtitle)
    % 689 693
    % 690 693
    % 691 693
    fontprops = {'FontName','FontUnits','FontSize','FontWeight','FontAngle'};
    % 693 698
    % 694 698
    % 695 698
    % 696 698
    fontvals = get(co, fontprops);
    c = reshape(cat(1.0, fontprops, fontvals), 5.0, 2.0);
    s = struct(c{:});
    s = uisetfont(s, dlgtitle);
    if isstruct(s)
        set(co, s);
        if strcmp('axes', get(co, 'Type'))
            legend(co);
        end % if
    end % if
function LEditByType(myFig, aObj)
    % 708 714
    % 709 714
    % 710 714
    % 711 714
    % 712 714
    if ischar(aObj)
        % 714 717
        % 715 717
        editH = get(myFig, 'currentobject');
        currObjType = get(editH, 'type');
        if not(isempty(currObjType)) && ischar(currObjType) && strcmp(currObjType, aObj)
        else
            % 720 723
            % 721 723
            % 722 724
            editH = findobj(myFig, 'type', aObj);
        end % if
        errMsg = sprintf('Error - no "%s" objects in current figure', aObj);
    else
        if isnumeric(aObj)
            editH = aObj(find(ishandle(aObj)));
            errMsg = sprintf('Error - no valid handle');
        else
            editH = [];
            errMsg = sprintf('Error - can only edit based on handles or object type');
        end % if
    end % if
    if isempty(editH)
        errordlg(errMsg, 'Property Editor Error', 'modal');
        return;
    else
        editH = editH(1.0);
    end % if
    if not(plotedit(myFig, 'isactive'))
        plotedit(myFig, 'on');
    end % if
    % 744 746
    propedit(editH);
function LUpdateToolsMenu(myFig)
    % 747 751
    % 748 751
    % 749 751
    toolsMenuItems = allchild(findobj(allchild(myFig), 'flat', 'Type', 'uimenu', 'Tag', 'figMenuTools'));
    % 751 753
    offon = {'off','on'};
    % 753 756
    % 754 756
    ploteditActive = plotedit(myFig, 'isactive');
    set(findall(toolsMenuItems, 'Tag', 'figMenuToolsPlotedit'), 'Checked', offon{plus(ploteditActive, 1.0)});
    % 757 759
    zoomInActive = 0.0;
    zoomOutActive = 0.0;
    switch zoom(myFig, 'getmode')
    case {'in','on'}
        zoomInActive = 1.0;
    case 'out'
        zoomOutActive = 1.0;
    end % switch
    set(findall(toolsMenuItems, 'Tag', 'figMenuZoomIn'), 'Checked', offon{plus(zoomInActive, 1.0)});
    set(findall(toolsMenuItems, 'Tag', 'figMenuZoomOut'), 'Checked', offon{plus(zoomOutActive, 1.0)});
    % 768 770
    isRotate3dActive = not(isempty(findall(myFig, 'type', 'axes', 'Tag', 'rotaObj')));
    set(findall(toolsMenuItems, 'Tag', 'figMenuRotate3D'), 'Checked', offon{plus(isRotate3dActive, 1.0)});
    % 771 773
    isCameraActive = not(isempty(cameratoolbar('getmode')));
    set(findall(toolsMenuItems, 'Tag', 'figMenuMoveCamera'), 'Checked', offon{plus(isCameraActive, 1.0)});
    % 774 780
    % 775 780
    % 776 780
    % 777 780
    % 778 780
    handlevis = isequal(get(myFig, 'HandleVisibility'), 'on');
    % 780 782
    is2d = 0.0;
    % 782 785
    % 783 785
    if isempty(findprop(handle(myFig), 'Basic_Fit_Resid_Figure'))
        axesList = datachildren(myFig);
        if not(isempty(axesList)) && not(isempty(plotchild(axesList, 2.0, true)))
            is2d = 1.0;
        end % if
    end % if
    % 790 792
    set(findall(toolsMenuItems, 'Tag', 'figMenuToolsBFDS'), 'Enable', offon{plus(and(is2d, handlevis), 1.0)});
    % 792 794
    if not(usejava('MWT'))
        set(findall(toolsMenuItems, 'Tag', 'figMenuToolsBFDS'), 'Visible', 'off');
    end % if
function LUpdateViewMenu(myFig)
    % 797 801
    % 798 801
    % 799 801
    offon = {'off','on'};
    % 801 803
    viewMenuItems = allchild(findobj(allchild(myFig), 'flat', 'Type', 'uimenu', 'Tag', 'figMenuView'));
    % 803 806
    % 804 806
    tagList = {'FigureToolBar','figMenuFigureToolbar';'CameraToolBar','figMenuCameraToolbar'};
    % 806 811
    % 807 811
    % 808 811
    % 809 811
    toolbarHandles = findall(myFig, 'type', 'uitoolbar');
    % 811 813
    for i=1.0:size(tagList, 1.0)
        toolbarShowing = not(isempty(findall(toolbarHandles, 'tag', tagList{i, 1.0}, 'Visible', 'on')));
        % 814 817
        % 815 817
        menuHandle = findall(viewMenuItems, 'Type', 'uimenu', 'Tag', tagList{i, 2.0});
        % 817 820
        % 818 820
        if not(isempty(menuHandle))
            set(menuHandle, 'Checked', offon{plus(toolbarShowing, 1.0)});
            % 821 823
        end % if
    end % for
function LUpdateInsertMenu(myFig)
    % 825 829
    % 826 829
    % 827 829
    insertMenuItems = allchild(findobj(allchild(myFig), 'flat', 'Type', 'uimenu', 'Tag', 'figMenuInsert'));
    % 829 831
    zLabelEnable = 'off';
    if isempty(findobj(myFig, 'type', 'axes'))
        menuEnable = 'off';
    else
        menuEnable = 'on';
        if not(isequal(get(get(myFig, 'currentaxes'), 'View'), [0.0 90.0]))
            zLabelEnable = 'on';
        end % if
    end % if
    % 839 841
    eMenus = vertcat(findobj(insertMenuItems, 'tag', 'figMenuInsertYLabel'), findobj(insertMenuItems, 'tag', 'figMenuInsertXLabel'), findobj(insertMenuItems, 'tag', 'figMenuInsertTitle'), findobj(insertMenuItems, 'tag', 'figMenuInsertLegend'), findobj(insertMenuItems, 'tag', 'figMenuInsertColorbar'), findobj(insertMenuItems, 'tag', 'figMenuInsertYAxis'), findobj(insertMenuItems, 'tag', 'figMenuInsertLight'));
    % 841 849
    % 842 849
    % 843 849
    % 844 849
    % 845 849
    % 846 849
    % 847 849
    set(eMenus, 'Enable', menuEnable);
    % 849 852
    % 850 852
    set(findobj(insertMenuItems, 'tag', 'figMenuInsertZLabel'), 'Enable', zLabelEnable);
function ObsoleteUpdateLegendCode
    % 853 859
    % 854 859
    % 855 859
    % 856 859
    % 857 859
    selection = LGetSelection(myFig);
    % 859 862
    % 860 862
    axisObjects = [];
    if not(isempty(selection))
        for a=selection
            if strcmp(class(a), 'axisobj')
                axisObjects = horzcat(axisObjects, a);
            end % if
        end % for
    end % if
    % 869 872
    % 870 872
    mShowLegend = findall(gcbo, 'Tag', 'figMenuToolsShowLegend');
    ax = get(myFig, 'CurrentAxes');
    if ploteditActive
        axLegendOn = [];
        for a=axisObjects
            % 876 878
            axLegendOn(plus(end, 1.0)) = islegendon(get(a, 'MyHGHandle'));
        end % for
        % 879 881
        if isempty(axLegendOn) && isempty(ax)
            % 881 884
            % 882 884
            mShowLegendEnable = 'off';
        else
            mShowLegendEnable = 'on';
        end % if
        % 887 889
        if isempty(axisObjects)
            % 889 892
            % 890 892
            if isempty(ax)
                axLegendOn = 0.0;
            else
                axLegendOn = islegendon(ax);
            end % if
        end % if
        % 897 900
        % 898 900
        if gt(length(find(axLegendOn)), mrdivide(length(axLegendOn), 2.0))
            % 900 902
            mShowLegendLabel = 'Hide Le&gend';
        else
            mShowLegendLabel = 'Show Le&gend';
        end % if
    else
        % 906 908
        if not(isempty(mShowLegend))
            if not(isempty(ax))
                if islegendon(ax)
                    mShowLegendLabel = 'Hide Le&gend';
                else
                    mShowLegendLabel = 'Show Le&gend';
                end % if
                mShowLegendEnable = 'on';
            else
                % 916 918
                mShowLegendLabel = 'Show Le&gend';
                mShowLegendEnable = 'off';
                % 919 921
            end % if
        end % if
    end % if
    set(mShowLegend, 'Enable', mShowLegendEnable, 'Label', mShowLegendLabel)
    % 924 926
function ObsoleteUnlockAxesCode
    % 926 932
    % 927 932
    % 928 932
    % 929 932
    % 930 932
    mLockAxes = findall(gcbo, 'Tag', 'figMenuToolsLockAxes');
    if ploteditActive
        axLock = [];
        for a=axisObjects
            % 935 937
            axLock(plus(end, 1.0)) = get(a, 'Draggable');
        end % for
        if isempty(axLock)
            mLockAxesEnable = 'off';
            mLockAxesLabel = 'Unloc&k Axes Position';
        else
            mLockAxesEnable = 'on';
            if gt(length(find(axLock)), mrdivide(length(axLock), 2.0))
                % 944 946
                mLockAxesLabel = 'Loc&k Axes Position';
            else
                mLockAxesLabel = 'Unloc&k Axes Position';
            end % if
        end % if
    else
        mLockAxesEnable = 'off';
        mLockAxesLabel = 'Unloc&k Axes Position';
    end % if
    set(mLockAxes, 'Label', mLockAxesLabel, 'Enable', mLockAxesEnable);
    % 955 957
function h = LocSelectionHandles(myFig)
    % 957 964
    % 958 964
    % 959 964
    % 960 964
    % 961 964
    % 962 964
    h = [];
    if plotedit(myFig, 'isactive')
        selection = get(getobj(myFig), 'Selection');
        if not(isempty(selection))
            h = horzcat(selection(:).HGHandle);
            if iscell(h)
                h = horzcat(h{:});
            end % if
        end % if
    end % if
