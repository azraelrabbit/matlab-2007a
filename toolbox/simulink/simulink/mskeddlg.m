function mskeddlg(varargin)
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
    button = varargin{1.0};
    switch button
        % 14 18
        % 15 18
        % 16 18
    case 'create'
        % 17 19
        BlockHandle = varargin{2.0};
        % 19 22
        % 20 22
        if slfeature('JavaMaskEditor') && usejava('swing')
            maskedit('Create', BlockHandle, varargin{4.0});
        else
            eval('CreateEditor(BlockHandle);', 'DisplayError(lasterr)');
        end
        % 27 31
        % 28 31
        % 29 31
    case 'deleteEditor'
        % 30 32
        eval('DeleteEditor;', 'DisplayError(lasterr)');
        % 33 37
        % 34 37
        % 35 37
    case 'CloseEditor'
        % 36 38
        BlockHandle = varargin{2.0};
        % 38 41
        % 39 41
        if slfeature('JavaMaskEditor') && usejava('swing')
            maskedit('Delete', BlockHandle);
        else
            if ishandle(varargin{3.0})
                close(varargin{3.0})
                set_param(varargin{2.0}, 'MaskEditorHandle', -1.0);
            end
        end
        % 49 53
        % 50 53
        % 51 53
    case 'Apply'
        % 52 54
        eval('ApplyMaskData;', 'DisplayError(lasterr)');
        % 55 59
        % 56 59
        % 57 59
    case 'Cancel'
        % 58 60
        CancelMaskEditor;
        % 61 65
        % 62 65
        % 63 65
    case 'Help'
        % 64 66
        slprophelp('maskeditor')
        % 67 71
        % 68 71
        % 69 71
    case 'Close'
        % 70 72
        errorValue = 1.0;
        MaskEditorHandle = gcbf;
        eval('errorValue = ApplyMaskData;', 'DisplayError(lasterr)');
        if not(errorValue)
            set(MaskEditorHandle, 'visible', 'off');
        end
        % 78 82
        % 79 82
        % 80 82
    case 'Unmask'
        % 81 83
        UnmaskBlock;
        % 84 88
        % 85 88
        % 86 88
    case 'tabcallbk'
        % 87 89
        NewPageName = varargin{2.0};
        ChangeMaskPage(NewPageName);
        % 91 95
        % 92 95
        % 93 95
    case 'Listbox'
        % 94 96
        action = varargin{2.0};
        ChangeListBox(action);
    otherwise
        % 98 102
        % 99 102
        % 100 102
        % 101 103
        error(horzcat('Unknown button action : ', button));
        % 103 105
    end
end
function DeleteEditor
    % 107 118
    % 108 118
    % 109 118
    % 110 118
    % 111 118
    % 112 118
    % 113 118
    % 114 118
    % 115 118
    % 116 118
    Data = get(gcbf, 'UserData');
    exists = 1.0;
    % 119 121
    eval('exists = ~isempty(find_system(get_param(Data.BlockHandle,''parent''),''LookUnderMasks'',''all'',''Handle'', Data.BlockHandle));', 'exists = 0;')
    % 121 126
    % 122 126
    % 123 126
    % 124 126
    if exists
        set_param(Data.BlockHandle, 'maskeditorhandle', -1.0);
    end
end
function UnmaskBlock
    % 130 141
    % 131 141
    % 132 141
    % 133 141
    % 134 141
    % 135 141
    % 136 141
    % 137 141
    % 138 141
    % 139 141
    Data = get(gcbf, 'UserData');
    set_param(Data.BlockHandle, 'mask', 'off');
    set(gcbf, 'visible', 'off');
end
function errorValue = ApplyMaskData
    % 145 156
    % 146 156
    % 147 156
    % 148 156
    % 149 156
    % 150 156
    % 151 156
    % 152 156
    % 153 156
    % 154 156
    MaskEditorHandle = gcbf;
    Data = get(MaskEditorHandle, 'UserData');
    errorValue = 0.0;
    % 158 162
    % 159 162
    % 160 162
    BlockName = horzcat(get_param(Data.BlockHandle, 'parent'), '/', get_param(Data.BlockHandle, 'name'));
    % 162 164
    set(MaskEditorHandle, 'name', horzcat('Mask Editor: ', BlockName))
    % 164 169
    % 165 169
    % 166 169
    % 167 169
    value = get(Data.IconPage.MaskDrawingCoordsHandle, 'value');
    Coords = get(Data.IconPage.MaskDrawingCoordsHandle, 'string');
    % 170 172
    IconRotateValue = RotateVal(get(Data.IconPage.MaskRotateIconHandle, 'value'));
    IconOpaqueValue = onoff(minus(get(Data.IconPage.MaskOpaqueIconHandle, 'value'), 1.0));
    IconFrameValue = onoff(minus(get(Data.IconPage.MaskFrameIconHandle, 'value'), 1.0));
    % 174 179
    % 175 179
    % 176 179
    % 177 179
    DispString = get(Data.IconPage.MaskDisplayHandle, 'string');
    FinalDispString = '';
    for DispIdx=1.0:length(DispString)
        FinalDispString = horzcat(FinalDispString, DispString{DispIdx}, sprintf('\n'));
    end % for
    if not(isempty(FinalDispString))
        FinalDispString(end) = [];
    end
    % 186 192
    % 187 192
    % 188 192
    % 189 192
    % 190 192
    if not(Data.AllPages)
        set_param(Data.BlockHandle, 'Mask', 'on', 'MaskType', get(Data.IconPage.MaskTypeHandle, 'string'), 'MaskDisplay', FinalDispString, 'MaskIconRotate', IconRotateValue, 'MaskIconFrame', IconFrameValue, 'MaskIconOpaque', IconOpaqueValue, 'MaskIconUnits', Coords(value, :));
    else
        % 194 202
        % 195 202
        % 196 202
        % 197 202
        % 198 202
        % 199 202
        % 200 202
        % 201 210
        % 202 210
        % 203 210
        % 204 210
        % 205 210
        % 206 210
        % 207 210
        % 208 210
        paramData = get(Data.ParamPage.ParamListBox, 'UserData');
        [nParams, unused] = size(get(Data.ParamPage.ParamListBox, 'string'));
        nParams = minus(nParams, 1.0);
        % 212 217
        % 213 217
        % 214 217
        % 215 217
        maskInitString = get(Data.ParamPage.MaskInitCommandsHandle, 'string');
        % 217 219
        if not(isempty(maskInitString)) && not(isempty(find(eq(maskInitString, '@'))))
            defwarn = warning('backtrace', 'off');
            warning('Assignments should be made using the Variable name associated with the parameter Prompts instead of using @N.');
            % 221 223
            warning(defwarn)
        end
        variableString = '';
        typeString = '';
        % 226 232
        % 227 232
        % 228 232
        % 229 232
        % 230 232
        if eq(nParams, 0.0)
            promptArray = {};
            ValueArray = {};
            NameArray = {};
            TunableArray = {};
            EnableArray = {};
            VisibleArray = {};
            CallbackArray = {};
        else
            % 240 242
            promptArray = ctranspose(cellhorzcat(paramData(1.0:nParams).prompt));
            ValueArray = ctranspose(cellhorzcat(paramData(1.0:nParams).value));
            NameArray = ctranspose(cellhorzcat(paramData(1.0:nParams).name));
            TunableArray = ctranspose(cellhorzcat(paramData(1.0:nParams).tunable));
            EnableArray = ctranspose(cellhorzcat(paramData(1.0:nParams).enable));
            VisibleArray = ctranspose(cellhorzcat(paramData(1.0:nParams).visible));
            CallbackArray = ctranspose(cellhorzcat(paramData(1.0:nParams).callback));
        end
        % 249 254
        % 250 254
        % 251 254
        % 252 254
        UniqueVariableList = '';
        for i=1.0:nParams
            CV = deblank(paramData(i).variable);
            CurrentVariable = fliplr(deblank(fliplr(CV)));
            paramData(i).variable = CurrentVariable;
            if not(isempty(CurrentVariable))
                UniqueVariableList = strvcat(UniqueVariableList, CurrentVariable);
            end
        end % for
        if ne(size(unique(UniqueVariableList, 'rows'), 1.0), size(UniqueVariableList, 1.0))
            % 263 265
            MaskDialogEditor = get(0.0, 'CurrentFigure');
            errorString = 'Duplicate variable names being used';
            beep;
            errordlg(errorString, 'Error', 'modal');
            set(0.0, 'CurrentFigure', MaskDialogEditor);
            errorValue = 1.0;
            return
        end
        % 272 276
        % 273 276
        % 274 276
        for i=1.0:nParams
            % 276 280
            % 277 280
            % 278 280
            if isempty(deblank(paramData(i).variable))
                defwarn = warning('backtrace', 'off');
                warning(horzcat('Variable field in Mask Editor is empty for Prompt ''', paramData(i).prompt, ''' (parameter ', num2str(i), ')'));
                % 282 284
                warning(defwarn)
            else
                evalType = paramData(i).evalType;
                if eq(evalType, 0.0)
                    variableString = horzcat(variableString, deblank(paramData(i).variable), '=@', num2str(i), ';');
                else
                    % 289 291
                    variableString = horzcat(variableString, paramData(i).variable, '=&', num2str(i), ';');
                    % 291 293
                end
            end
            % 294 299
            % 295 299
            % 296 299
            % 297 299
            typ = paramData(i).type;
            typeString = horzcat(typeString, typ);
            if strcmp(typ, 'popup')
                % 301 303
                if not(isempty(find(eq(paramData(i).popupStr, ','))))
                    beep;
                    errordlg('Commas are not allowed in the specification of popup strings. Use ''|'' to separate choices.', 'Error', 'modal');
                    errorValue = 1.0;
                    return
                end
                typeString = horzcat(typeString, '(', paramData(i).popupStr, ')');
            end
            if lt(i, nParams)
                typeString = horzcat(typeString, ',');
            end
            % 313 315
        end % for
        % 315 320
        % 316 320
        % 317 320
        % 318 320
        [InitM, InitN] = size(maskInitString);
        FinalInitString = '';
        for idx=1.0:InitM
            FinalInitString = horzcat(FinalInitString, deblank(maskInitString(idx, :)), sprintf('\n'));
            % 323 325
        end % for
        if not(isempty(FinalInitString))
            FinalInitString(end) = [];
        end
        % 328 334
        % 329 334
        % 330 334
        % 331 334
        % 332 334
        DescString = get(Data.DocPage.MaskDescriptionHandle, 'string');
        FinalDescString = '';
        for DescIdx=1.0:length(DescString)
            FinalDescString = horzcat(FinalDescString, DescString{DescIdx}, sprintf('\n'));
        end % for
        if not(isempty(FinalDescString))
            FinalDescString(end) = [];
        end
        % 341 346
        % 342 346
        % 343 346
        % 344 346
        HelpString = get(Data.DocPage.MaskHelpHandle, 'string');
        FinalHelpString = '';
        for HelpIdx=1.0:length(HelpString)
            FinalHelpString = horzcat(FinalHelpString, HelpString{HelpIdx}, sprintf('\n'));
        end % for
        if not(isempty(FinalHelpString))
            FinalHelpString(end) = [];
        end
        % 353 359
        % 354 359
        % 355 359
        % 356 359
        % 357 359
        ExtraValueData = Data.ParamPage.ExtraValueData;
        if isempty(ExtraValueData)
            MaskValueArray = ValueArray;
        else
            MaskValueArray = vertcat(ValueArray, ExtraValueData);
        end
        set_param(Data.BlockHandle, 'Mask', 'on', 'MaskType', get(Data.IconPage.MaskTypeHandle, 'string'), 'MaskDisplay', FinalDispString, 'MaskIconRotate', IconRotateValue, 'MaskIconFrame', IconFrameValue, 'MaskIconOpaque', IconOpaqueValue, 'MaskIconUnits', Coords(value, :), 'MaskDescription', FinalDescString, 'MaskHelp', FinalHelpString, 'MaskVariables', variableString, 'MaskInitialization', FinalInitString, 'MaskStyleString', typeString, 'MaskPrompts', promptArray, 'MaskValues', MaskValueArray, 'MaskTunableValues', TunableArray, 'MaskEnables', EnableArray, 'MaskVisibilities', VisibleArray, 'MaskCallbacks', CallbackArray);
        % 365 385
        % 366 385
        % 367 385
        % 368 385
        % 369 385
        % 370 385
        % 371 385
        % 372 385
        % 373 385
        % 374 385
        % 375 385
        % 376 385
        % 377 385
        % 378 385
        % 379 385
        % 380 385
        % 381 385
        % 382 385
        % 383 385
    end
    % 385 387
    SetMaskState(Data.BlockHandle);
    set(0.0, 'CurrentFigure', MaskEditorHandle)
end
function CancelMaskEditor
    % 390 401
    % 391 401
    % 392 401
    % 393 401
    % 394 401
    % 395 401
    % 396 401
    % 397 401
    % 398 401
    % 399 401
    close(gcbf)
end
function num = GetPageNum(PageName)
    % 403 414
    % 404 414
    % 405 414
    % 406 414
    % 407 414
    % 408 414
    % 409 414
    % 410 414
    % 411 414
    % 412 414
    switch PageName
    case xlate('     Icon      ')
        num = 1.0;
    case xlate(' Initialization ')
        num = 2.0;
    case xlate(' Documentation ')
        num = 3.0;
    otherwise
        num = 1.0;
    end
end
function ChangeMaskPage(newPage)
    % 425 439
    % 426 439
    % 427 439
    % 428 439
    % 429 439
    % 430 439
    % 431 439
    % 432 439
    % 433 439
    % 434 439
    % 435 439
    % 436 439
    % 437 439
    MaskEditorHandle = gcbf;
    Data = get(MaskEditorHandle, 'UserData');
    currentPageNum = Data.currentPage;
    newPageNum = GetPageNum(newPage);
    % 442 447
    % 443 447
    % 444 447
    % 445 447
    if ne(currentPageNum, newPageNum)
        [oldpagetag, error] = sprintf('page%d', currentPageNum);
        [newpagetag, error] = sprintf('page%d', newPageNum);
        % 449 454
        % 450 454
        % 451 454
        % 452 454
        set(findobj(MaskEditorHandle, 'Tag', oldpagetag), 'visible', 'off');
        % 454 459
        % 455 459
        % 456 459
        % 457 459
        if not(Data.AllPages)
            position = [5.0 70.0 390.0 315.0];
            BlockHandle = Data.BlockHandle;
            % 461 466
            % 462 466
            % 463 466
            % 464 466
            mskedpg('ParamPage', MaskEditorHandle, BlockHandle, position);
            % 466 471
            % 467 471
            % 468 471
            % 469 471
            mskedpg('DocPage', MaskEditorHandle, BlockHandle, position);
            % 471 476
            % 472 476
            % 473 476
            % 474 476
            Data = get(MaskEditorHandle, 'UserData');
            Data.AllPages = 1.0;
        end
        % 478 483
        % 479 483
        % 480 483
        % 481 483
        set(findobj(MaskEditorHandle, 'Tag', newpagetag), 'visible', 'on');
        Data.currentPage = newPageNum;
        set(MaskEditorHandle, 'UserData', Data);
        % 485 487
    end
end
function ChangeListBox(button, Handle)
    % 489 503
    % 490 503
    % 491 503
    % 492 503
    % 493 503
    % 494 503
    % 495 503
    % 496 503
    % 497 503
    % 498 503
    % 499 503
    % 500 503
    % 501 503
    if eq(nargin, 2.0)
        MaskEditorHandle = Handle;
    else
        MaskEditorHandle = gcbf;
    end
    Data = get(MaskEditorHandle, 'UserData');
    listbox = Data.ParamPage.ParamListBox;
    nameEditHandle = Data.ParamPage.MaskPromptsHandle;
    varEditHandle = Data.ParamPage.MaskVariablesHandle;
    varEvalHandle = Data.ParamPage.MaskEvalHandle;
    typeHandle = Data.ParamPage.MaskParamTypeHandle;
    popupEditHandle = Data.ParamPage.MaskPopupStrings;
    popupTextHandle = Data.ParamPage.MaskPopupText;
    % 515 520
    % 516 520
    % 517 520
    % 518 520
    paramData = get(listbox, 'userdata');
    selected = get(listbox, 'value');
    [nParams, unused] = size(get(listbox, 'string'));
    ExtraValueData = Data.ParamPage.ExtraValueData;
    % 523 528
    % 524 528
    % 525 528
    % 526 528
    NewDataItem.prompt = '';
    NewDataItem.variable = '';
    NewDataItem.type = 'edit';
    NewDataItem.popupStr = '';
    NewDataItem.evalType = 0.0;
    NewDataItem.value = '';
    NewDataItem.name = '';
    NewDataItem.tunable = 'on';
    NewDataItem.enable = 'on';
    NewDataItem.visible = 'on';
    NewDataItem.callback = '';
    % 538 540
    Action = 1.0;
    % 540 542
    switch button
    case 'Up'
        % 543 548
        % 544 548
        % 545 548
        % 546 548
        if eq(selected, 1.0) || eq(selected, nParams)
            Action = 0.0;
        else
            % 550 552
            paramData(horzcat(selected, minus(selected, 1.0))) = paramData(horzcat(minus(selected, 1.0), selected));
            set(listbox, 'value', minus(selected, 1.0), 'userdata', paramData);
            selected = minus(selected, 1.0);
            ChangeListBox('UpdateEdit', MaskEditorHandle);
        end
    case 'Down'
        % 557 562
        % 558 562
        % 559 562
        % 560 562
        if ge(selected, minus(nParams, 1.0))
            Action = 0.0;
        else
            % 564 566
            paramData(horzcat(selected, plus(selected, 1.0))) = paramData(horzcat(plus(selected, 1.0), selected));
            set(listbox, 'value', plus(selected, 1.0), 'userdata', paramData);
            selected = plus(selected, 1.0);
            ChangeListBox('UpdateEdit', MaskEditorHandle);
        end
    case 'New'
        % 571 576
        % 572 576
        % 573 576
        % 574 576
        nParams = plus(nParams, 1.0);
        vector = nParams:-1.0:plus(selected, 1.0);
        paramData(vector) = paramData(minus(vector, 1.0));
        paramData(selected) = NewDataItem;
        % 579 583
        % 580 583
        % 581 583
        if not(isempty(ExtraValueData))
            paramData(selected).value = ExtraValueData{1.0};
            ExtraValueData(1.0) = [];
        end
        % 586 591
        % 587 591
        % 588 591
        % 589 591
        set(nameEditHandle, 'enable', 'on', 'string', '')
        set(varEditHandle, 'enable', 'on', 'string', '')
        set(typeHandle, 'enable', 'on', 'value', 1.0)
        set(varEvalHandle, 'enable', 'on', 'value', 1.0)
        set(popupEditHandle, 'enable', 'off', 'String', '')
        set(popupTextHandle, 'enable', 'off')
        % 596 601
        % 597 601
        % 598 601
        % 599 601
        set(Data.ParamPage.MaskPStringHandle, 'enable', 'on');
        set(Data.ParamPage.MaskPromptsHandle, 'enable', 'on');
        set(Data.ParamPage.MaskVStringHandle, 'enable', 'on');
        set(Data.ParamPage.MaskVariablesHandle, 'enable', 'on');
        set(Data.ParamPage.MaskParamStringHandle, 'enable', 'on');
        set(Data.ParamPage.MaskParamTypeHandle, 'enable', 'on');
        set(Data.ParamPage.MaskEvalStringHandle, 'enable', 'on');
        set(Data.ParamPage.MaskEvalHandle, 'enable', 'on');
        % 608 613
        % 609 613
        % 610 613
        % 611 613
        set(Data.ParamPage.DeleteButtonHandle, 'enable', 'on');
        if eq(selected, 1.0)
            set(Data.ParamPage.UpButtonHandle, 'enable', 'off');
        else
            set(Data.ParamPage.UpButtonHandle, 'enable', 'on');
        end
        if eq(selected, minus(nParams, 1.0))
            set(Data.ParamPage.DownButtonHandle, 'enable', 'off');
        else
            set(Data.ParamPage.DownButtonHandle, 'enable', 'on');
        end
    case 'Delete'
        % 624 629
        % 625 629
        % 626 629
        % 627 629
        if eq(selected, nParams)
            Action = 0.0;
        else
            paramData(selected) = [];
            newString = get(listbox, 'string');
            newString(selected, :) = [];
            nParams = minus(nParams, 1.0);
            set(listbox, 'UserData', paramData, 'string', newString);
            ChangeListBox('UpdateEdit', MaskEditorHandle);
        end
    case 'Edit'
        % 639 644
        % 640 644
        % 641 644
        % 642 644
        if eq(nParams, 1.0)
            % 644 647
            % 645 647
            nParams = 2.0;
            paramData(nParams) = paramData(selected);
            paramData(selected) = NewDataItem;
            % 649 653
            % 650 653
            % 651 653
            if not(isempty(ExtraValueData))
                paramData(selected).value = ExtraValueData{1.0};
                ExtraValueData(1.0) = [];
            end
            set(Data.ParamPage.DeleteButtonHandle, 'enable', 'on');
        end
        % 658 660
        if eq(selected, nParams)
            Action = 0.0;
        else
            val = get(typeHandle, 'Value');
            paramData(selected).prompt = get(nameEditHandle, 'String');
            paramData(selected).variable = get(varEditHandle, 'String');
            paramData(selected).type = StringToValue(val);
            paramData(selected).popupStr = get(popupEditHandle, 'String');
            paramData(selected).evalType = minus(get(varEvalHandle, 'Value'), 1.0);
            if eq(val, 3.0)
                set(popupEditHandle, 'enable', 'on');
                set(popupTextHandle, 'enable', 'on');
            else
                set(popupEditHandle, 'enable', 'off');
                set(popupTextHandle, 'enable', 'off');
            end
        end
    case 'UpdateEdit'
        % 677 683
        % 678 683
        % 679 683
        % 680 683
        % 681 683
        if eq(selected, nParams)
            Action = 0.0;
            set(nameEditHandle, 'enable', 'off', 'string', '')
            set(varEditHandle, 'enable', 'off', 'string', '')
            set(typeHandle, 'enable', 'off')
            set(varEvalHandle, 'enable', 'off')
            set(Data.ParamPage.MaskPStringHandle, 'enable', 'off');
            set(Data.ParamPage.MaskPromptsHandle, 'enable', 'off');
            set(Data.ParamPage.MaskVStringHandle, 'enable', 'off');
            set(Data.ParamPage.MaskVariablesHandle, 'enable', 'off');
            set(Data.ParamPage.MaskParamStringHandle, 'enable', 'off');
            set(Data.ParamPage.MaskParamTypeHandle, 'enable', 'off');
            set(Data.ParamPage.MaskEvalStringHandle, 'enable', 'off');
            set(Data.ParamPage.MaskEvalHandle, 'enable', 'off');
            set(Data.ParamPage.DeleteButtonHandle, 'enable', 'off');
            set(Data.ParamPage.UpButtonHandle, 'enable', 'off');
            set(Data.ParamPage.DownButtonHandle, 'enable', 'off');
            set(popupEditHandle, 'enable', 'off', 'string', '');
            set(popupTextHandle, 'enable', 'off');
        else
            % 702 704
            set(nameEditHandle, 'enable', 'on')
            set(varEditHandle, 'enable', 'on')
            set(typeHandle, 'enable', 'on')
            set(varEvalHandle, 'enable', 'on')
            set(Data.ParamPage.MaskPStringHandle, 'enable', 'on');
            set(Data.ParamPage.MaskPromptsHandle, 'enable', 'on');
            set(Data.ParamPage.MaskVStringHandle, 'enable', 'on');
            set(Data.ParamPage.MaskVariablesHandle, 'enable', 'on');
            set(Data.ParamPage.MaskParamStringHandle, 'enable', 'on');
            set(Data.ParamPage.MaskParamTypeHandle, 'enable', 'on');
            set(Data.ParamPage.MaskEvalStringHandle, 'enable', 'on');
            set(Data.ParamPage.MaskEvalHandle, 'enable', 'on');
            set(Data.ParamPage.DeleteButtonHandle, 'enable', 'on');
            set(Data.ParamPage.UpButtonHandle, 'enable', 'on');
            set(Data.ParamPage.DownButtonHandle, 'enable', 'on');
            set(nameEditHandle, 'String', paramData(selected).prompt);
            set(varEditHandle, 'String', paramData(selected).variable);
            set(varEvalHandle, 'value', plus(paramData(selected).evalType, 1.0));
            val = ValueToString(paramData(selected).type);
            % 722 724
            set(typeHandle, 'value', val);
            set(popupEditHandle, 'String', paramData(selected).popupStr);
            if eq(val, 3.0)
                set(popupEditHandle, 'enable', 'on');
                set(popupTextHandle, 'enable', 'on');
            else
                set(popupEditHandle, 'enable', 'off', 'string', '');
                set(popupTextHandle, 'enable', 'off');
            end
        end
        % 733 735
        if eq(selected, 1.0)
            set(Data.ParamPage.UpButtonHandle, 'enable', 'off');
        end
        if eq(selected, minus(nParams, 1.0))
            set(Data.ParamPage.DownButtonHandle, 'enable', 'off');
        end
        % 740 742
    end
    % 742 747
    % 743 747
    % 744 747
    % 745 747
    if Action
        if gt(nParams, 1.0)
            % 748 752
            % 749 752
            % 750 752
            typeString = char(mtimes(32.0, ones(minus(nParams, 1.0), 9.0)));
            paramString = char(mtimes(32.0, ones(minus(nParams, 1.0), 26.0)));
            variableString = char(mtimes(32.0, ones(minus(nParams, 1.0), 12.0)));
            padding = char(mtimes(32.0, ones(minus(nParams, 1.0), 2.0)));
            % 755 757
            tempParam = '';
            tempType = strvcat(paramData(1.0:minus(nParams, 1.0)).type);
            tempVar = '';
            evalString = '';
            % 760 762
            for i=1.0:minus(nParams, 1.0)
                % 762 766
                % 763 766
                % 764 766
                if isempty(paramData(i).prompt)
                    tempParam = strvcat(tempParam, ' ');
                else
                    tempParam = strvcat(tempParam, paramData(i).prompt);
                end
                % 770 774
                % 771 774
                % 772 774
                if isempty(paramData(i).variable)
                    tempVar = strvcat(tempVar, ' ');
                else
                    tempVar = strvcat(tempVar, paramData(i).variable);
                end
                % 778 782
                % 779 782
                % 780 782
                marker = ' ';
                if eq(paramData(i).evalType, 1.0)
                    marker = '*';
                end
                evalString = strvcat(evalString, marker);
            end % for
            % 787 792
            % 788 792
            % 789 792
            % 790 792
            tempParam = tempParam(:, 1.0:min(26.0, end));
            tempVar = tempVar(:, 1.0:min(12.0, end));
            paramString(find(tempParam)) = tempParam(find(tempParam));
            typeString(find(tempType)) = tempType(find(tempType));
            variableString(find(tempVar)) = tempVar(find(tempVar));
            % 796 801
            % 797 801
            % 798 801
            % 799 801
            paramString = horzcat(paramString, padding, evalString, typeString, variableString);
            paramString = strvcat(paramString, paramData(nParams).prompt);
        else
            paramString = paramData(1.0).prompt;
            variableString = '';
            typeStr = '';
            popupStrs = '';
            evalString = '';
        end
        % 809 814
        % 810 814
        % 811 814
        % 812 814
        set(listbox, 'String', paramString, 'UserData', paramData);
        % 814 817
        % 815 817
        set(Data.ParamPage.MaskVStringHandle, 'UserData', horzcat(evalString, variableString));
        % 817 820
        % 818 820
    end
    Data.ParamPage.ExtraValueData = ExtraValueData;
    set(MaskEditorHandle, 'UserData', Data)
end
function CreateEditor(BlockHandle)
    % 824 847
    % 825 847
    % 826 847
    % 827 847
    % 828 847
    % 829 847
    % 830 847
    % 831 847
    % 832 847
    % 833 847
    % 834 847
    % 835 847
    % 836 847
    % 837 847
    % 838 847
    % 839 847
    % 840 847
    % 841 847
    % 842 847
    % 843 847
    % 844 847
    % 845 847
    BlockName = horzcat(get_param(BlockHandle, 'parent'), '/', get_param(BlockHandle, 'name'));
    % 847 849
    dialogName = horzcat('Mask Editor: ', BlockName);
    Handle = get_param(BlockHandle, 'maskeditorhandle');
    % 850 852
    if ishandle(Handle)
        % 852 856
        % 853 856
        % 854 856
        Data = get(Handle, 'UserData');
        % 856 861
        % 857 861
        % 858 861
        % 859 861
        BlockName = horzcat(get_param(Data.BlockHandle, 'parent'), '/', get_param(Data.BlockHandle, 'name'));
        % 861 863
        set(Handle, 'name', horzcat('Mask Editor: ', BlockName))
        % 863 868
        % 864 868
        % 865 868
        % 866 868
        SyncIcon = masksync('SyncIconPage', Handle, BlockHandle);
        set(Data.IconPage.MaskTypeHandle, 'String', SyncIcon.TypeString);
        set(Data.IconPage.MaskDisplayHandle, 'String', cellhorzcat(SyncIcon.DisplayString));
        set(Data.IconPage.MaskRotateIconHandle, 'value', SyncIcon.RotateValue);
        set(Data.IconPage.MaskFrameIconHandle, 'value', SyncIcon.FrameValue);
        set(Data.IconPage.MaskOpaqueIconHandle, 'value', SyncIcon.OpaqueValue);
        set(Data.IconPage.MaskDrawingCoordsHandle, 'value', SyncIcon.NormalValue);
        % 874 879
        % 875 879
        % 876 879
        % 877 879
        if Data.AllPages
            % 879 883
            % 880 883
            % 881 883
            SyncDoc = masksync('SyncDocPage', Handle, BlockHandle);
            set(Data.DocPage.MaskDescriptionHandle, 'String', cellhorzcat(SyncDoc.DescriptionString));
            % 884 886
            set(Data.DocPage.MaskHelpHandle, 'String', cellhorzcat(SyncDoc.HelpString));
            % 886 891
            % 887 891
            % 888 891
            % 889 891
            SyncParam = masksync('SyncParamPage', Handle, BlockHandle);
            listbox = Data.ParamPage.ParamListBox;
            set(listbox, 'value', 1.0);
            set(Data.ParamPage.MaskInitCommandsHandle, 'String', SyncParam.InitString);
            % 894 896
            set(listbox, 'String', SyncParam.ParamString, 'UserData', SyncParam.ParamData);
            % 896 898
            ChangeListBox('UpdateEdit', Handle)
            % 898 900
        end
        set(Handle, 'Visible', 'on');
        figure(Handle)
    else
        % 903 908
        % 904 908
        % 905 908
        % 906 908
        pushHsize = 70.0;
        pushVsize = 25.0;
        Border = 5.0;
        FigureWidth = 410.0;
        FigureHeight = 400.0;
        tab = [10.0 90.0 170.0 250.0 330.0];
        Grey = get(0.0, 'defaultuicontrolbackgroundcolor');
        ctab = [0.0 0.0 0.0 ;  1.0 1.0 1.0 ;  .702 .702 .702 ;  .6 .6 .6 ;  .5 .5 .5 ;  .4 .4 .4];
        % 915 925
        % 916 925
        % 917 925
        % 918 925
        % 919 925
        % 920 925
        % 921 925
        % 922 925
        % 923 925
        screen = get(0.0, 'ScreenSize');
        FigureXpos = mrdivide(minus(screen(3.0), FigureWidth), 2.0);
        FigureYpos = mrdivide(minus(screen(4.0), FigureHeight), 2.0);
        if lt(FigureXpos, 0.0)
            FigureXpos = mtimes(FigureXpos, 2.0);
        end
        if lt(FigureYpos, 0.0)
            FigureYpos = mtimes(FigureYpos, 2.0);
        end
        % 933 935
        strings = cell(3.0, 1.0);
        strings(1.0) = cellhorzcat(xlate('     Icon      '));
        strings(2.0) = cellhorzcat(xlate(' Initialization '));
        strings(3.0) = cellhorzcat(xlate(' Documentation '));
        % 938 940
        if ispc
            font.name = 'MS Sans Serif';
            font.size = 10.0;
        else
            font.name = get(0.0, 'DefaultUIControlFontName');
            font.size = get(0.0, 'DefaultUIControlFontSize');
        end
        % 946 948
        tabDims = {[60.0;90.0;100.0],[21.0]};
        sheetDims = horzcat(FigureWidth, minus(FigureHeight, plus(mtimes(5.0, Border), pushVsize)));
        offsets = horzcat(5.0, 5.0, 5.0, plus(mtimes(5.0, Border), pushVsize));
        % 950 952
        [dlgHandle, sheetPos] = tabdlg('create', strings, tabDims, 'mskeddlg', sheetDims, offsets, 1.0);
        % 952 960
        % 953 960
        % 954 960
        % 955 960
        % 956 960
        % 957 960
        % 958 960
        position = get(dlgHandle, 'position');
        set(dlgHandle, 'Tag', 'maskEditDialog', 'Visible', 'off', 'ColorMap', ctab, 'Position', horzcat(FigureXpos, FigureYpos, position(3.0), position(4.0)), 'Name', dialogName, 'NumberTitle', 'off', 'IntegerHandle', 'off', 'MenuBar', menubar, 'DeleteFcn', 'mskeddlg deleteEditor', 'Color', Grey);
        % 961 976
        % 962 976
        % 963 976
        % 964 976
        % 965 976
        % 966 976
        % 967 976
        % 968 976
        % 969 976
        % 970 976
        % 971 976
        % 972 976
        % 973 976
        % 974 976
        Data = get(dlgHandle, 'UserData');
        % 976 981
        % 977 981
        % 978 981
        % 979 981
        Data.currentPage = 1.0;
        Data.BlockHandle = BlockHandle;
        Data.AllPages = 0.0;
        % 983 988
        % 984 988
        % 985 988
        % 986 988
        Data.Buttons.OKHandle = uicontrol('Style', 'pushbutton', 'Position', horzcat(tab(1.0), mtimes(2.0, Border), pushHsize, pushVsize), 'Callback', 'mskeddlg Close', 'enable', 'on', 'String', 'OK');
        % 988 994
        % 989 994
        % 990 994
        % 991 994
        % 992 994
        Data.Buttons.CancelHandle = uicontrol('Style', 'pushbutton', 'Position', horzcat(tab(2.0), mtimes(2.0, Border), pushHsize, pushVsize), 'Callback', 'mskeddlg Cancel', 'Enable', 'on', 'String', 'Cancel');
        % 994 1000
        % 995 1000
        % 996 1000
        % 997 1000
        % 998 1000
        Data.Buttons.UnmaskHandle = uicontrol('Style', 'pushbutton', 'Position', horzcat(tab(3.0), mtimes(2.0, Border), pushHsize, pushVsize), 'Callback', 'mskeddlg Unmask', 'Enable', 'on', 'String', 'Unmask');
        % 1000 1006
        % 1001 1006
        % 1002 1006
        % 1003 1006
        % 1004 1006
        Data.Buttons.HelpHandle = uicontrol('Style', 'pushbutton', 'Position', horzcat(tab(4.0), mtimes(2.0, Border), pushHsize, pushVsize), 'Callback', 'mskeddlg Help', 'Enable', 'on', 'String', 'Help');
        % 1006 1012
        % 1007 1012
        % 1008 1012
        % 1009 1012
        % 1010 1012
        Data.Buttons.ApplyHandle = uicontrol('Style', 'pushbutton', 'Callback', 'mskeddlg Apply', 'Position', horzcat(tab(5.0), mtimes(2.0, Border), pushHsize, pushVsize), 'UserData', 0.0, 'Enable', 'on', 'String', 'Apply');
        % 1012 1020
        % 1013 1020
        % 1014 1020
        % 1015 1020
        % 1016 1020
        % 1017 1020
        % 1018 1020
        set(dlgHandle, 'UserData', Data);
        % 1020 1027
        % 1021 1027
        % 1022 1027
        % 1023 1027
        % 1024 1027
        % 1025 1027
        position = [5.0 70.0 390.0 315.0];
        mskedpg('IconPage', dlgHandle, BlockHandle, position);
        % 1028 1030
        set(dlgHandle, 'HandleVisibility', 'callback', 'Visible', 'on', 'resize', 'off');
        % 1030 1037
        % 1031 1037
        % 1032 1037
        % 1033 1037
        % 1034 1037
        % 1035 1037
        set_param(BlockHandle, 'maskEditorHandle', dlgHandle);
        % 1037 1039
    end
end
function val = ValueToString(str)
    % 1041 1056
    % 1042 1056
    % 1043 1056
    % 1044 1056
    % 1045 1056
    % 1046 1056
    % 1047 1056
    % 1048 1056
    % 1049 1056
    % 1050 1056
    % 1051 1056
    % 1052 1056
    % 1053 1056
    % 1054 1056
    val = 1.0;
    if strncmp(str, 'chec', 4.0)
        val = 2.0;
    else
        if strncmp(str, 'popu', 4.0)
            val = 3.0;
        end
    end
end
function str = StringToValue(num)
    % 1065 1078
    % 1066 1078
    % 1067 1078
    % 1068 1078
    % 1069 1078
    % 1070 1078
    % 1071 1078
    % 1072 1078
    % 1073 1078
    % 1074 1078
    % 1075 1078
    % 1076 1078
    str = 'edit';
    if eq(num, 2.0)
        str = 'checkbox';
    else
        if eq(num, 3.0)
            str = 'popup';
        end
    end
end
function DisplayError(ErrMsg)
    % 1087 1097
    % 1088 1097
    % 1089 1097
    % 1090 1097
    % 1091 1097
    % 1092 1097
    % 1093 1097
    % 1094 1097
    % 1095 1097
    CF = get(0.0, 'CurrentFigure');
    errordlg(ErrMsg, 'Error', 'modal')
    set(0.0, 'CurrentFigure', CF)
end
function RotateStr = RotateVal(idx)
    % 1101 1111
    % 1102 1111
    % 1103 1111
    % 1104 1111
    % 1105 1111
    % 1106 1111
    % 1107 1111
    % 1108 1111
    % 1109 1111
    values = {'none','port','pure'};
    RotateStr = values{idx};
end
function SetMaskState(handle)
    % 1114 1126
    % 1115 1126
    % 1116 1126
    % 1117 1126
    % 1118 1126
    % 1119 1126
    % 1120 1126
    % 1121 1126
    % 1122 1126
    % 1123 1126
    % 1124 1126
    maskParams = get_param(handle, 'ObjectParameters');
    nameOfFields = fieldnames(maskParams);
    numFields = length(nameOfFields);
    % 1128 1130
    for i=1.0:numFields
        currentField = nameOfFields{i};
        if ge(length(currentField), 4.0) && strcmp(currentField(1.0:4.0), 'Mask') && strcmp(getfield(maskParams, currentField, 'Type'), 'string')
            % 1132 1135
            % 1133 1135
            str = get_param(handle, currentField);
            if not(isempty(str))
                return
            end
        end
    end % for
    set_param(handle, 'Mask', 'off');
end
