function dialogCallback(hController, hDlg, tag, action)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    hSrc = hController;
    hConfigSet = hSrc.getConfigSet;
    if ~(isempty(hConfigSet))
        hParentController = hConfigSet.getDialogController;
    else
        hParentController = hController;
    end
    % 12 14
    if ~(isequal(tag, 'preApplyErrorCheck'))
        executeCallbackForTag(hController, hDlg, tag, action, hSrc, hConfigSet, hParentController, false);
    else
        % 16 28
        % 17 28
        % 18 28
        % 19 28
        % 20 28
        % 21 28
        % 22 28
        % 23 28
        % 24 28
        % 25 28
        % 26 28
        errorCheckTags = {'Tag_ConfigSet_RTW_DataPlacement_DataDefinitionFile','Tag_ConfigSet_RTW_DataPlacement_DataReferenceFile','Tag_ConfigSet_RTW_DataPlacement_ModuleName','Tag_ConfigSet_RTW_DataPlacement_SignalDisplayLevel','Tag_ConfigSet_RTW_DataPlacement_ParamTuneLevel','Tag_ConfigSet_RTW_ERT_Replacement_ReplacementTypes_double','Tag_ConfigSet_RTW_ERT_Replacement_ReplacementTypes_single','Tag_ConfigSet_RTW_ERT_Replacement_ReplacementTypes_int32','Tag_ConfigSet_RTW_ERT_Replacement_ReplacementTypes_int16','Tag_ConfigSet_RTW_ERT_Replacement_ReplacementTypes_int8','Tag_ConfigSet_RTW_ERT_Replacement_ReplacementTypes_uint32','Tag_ConfigSet_RTW_ERT_Replacement_ReplacementTypes_uint16','Tag_ConfigSet_RTW_ERT_Replacement_ReplacementTypes_uint8','Tag_ConfigSet_RTW_ERT_Replacement_ReplacementTypes_boolean','Tag_ConfigSet_RTW_ERT_Replacement_ReplacementTypes_int','Tag_ConfigSet_RTW_ERT_Replacement_ReplacementTypes_uint','Tag_ConfigSet_RTW_ERT_Replacement_ReplacementTypes_char'};
        % 28 48
        % 29 48
        % 30 48
        % 31 48
        % 32 48
        % 33 48
        % 34 48
        % 35 48
        % 36 48
        % 37 48
        % 38 48
        % 39 48
        % 40 48
        % 41 48
        % 42 48
        % 43 48
        % 44 48
        % 45 48
        % 46 48
        for i=1.0:length(errorCheckTags)
            if ishandle(hParentController.ErrorDialog)
                break
            end
            tag = errorCheckTags{i};
            % 52 57
            % 53 57
            % 54 57
            % 55 57
            try
                if ~(isempty(hDlg.getUserData(tag)))
                    prop = hDlg.getUserData(tag).ObjectProperty;
                    sourceval = get_param(hSrc, prop);
                    widgetval = getWidgetValue(hDlg, tag);
                    if isnumeric(sourceval)
                        sourceval = num2str(sourceval);
                    end
                    % 64 70
                    % 65 70
                    % 66 70
                    % 67 70
                    % 68 70
                    if ~(ischar(sourceval))
                        isdiff = true;
                    else
                        isdiff = ~(isequal(sourceval, widgetval));
                    end
                    % 74 76
                    if hDlg.getUserData(tag).Validate && isdiff
                        executeCallbackForTag(hController, hDlg, tag, action, hSrc, hConfigSet, hParentController, true);
                        % 77 79
                    end
                end
            end % try
        end % for
    end
end
function executeCallbackForTag(hController, hDlg, tag, action, hSrc, hConfigSet, hParentController, forValidate)
    % 85 88
    % 86 88
    enableApplyButton = true;
    % 88 90
    switch tag
    case 'Tag_ConfigSet_RTW_ERT_DataExchangeInterface'
        val = getWidgetValue(hDlg, tag);
        set(hSrc, 'RTWCAPIParams', 'off');
        set(hSrc, 'RTWCAPISignals', 'off');
        set(hSrc, 'ExtMode', 'off');
        set(hSrc, 'GenerateASAP2', 'off');
        switch val
        case 1.0
            set(hSrc, 'RTWCAPIParams', 'on');
            set(hSrc, 'RTWCAPISignals', 'on');
            setWidgetValue(hDlg, 'Tag_ConfigSet_RTW_ERT_RTWCAPIParams', true);
            setWidgetValue(hDlg, 'Tag_ConfigSet_RTW_ERT_RTWCAPISignals', true);
        case 2.0
            set(hSrc, 'ExtMode', 'on');
        case 3.0
            set(hSrc, 'GenerateASAP2', 'on');
        end
    case 'Tag_ConfigSet_RTW_ERT_SupportFloat'
        val = getWidgetValue(hDlg, tag);
        if ~(logical(val))
            setWidgetValue(hDlg, 'Tag_ConfigSet_RTW_ERT_SupportNonFinite', 0.0);
            set(hSrc, 'SupportNonFinite', 'off');
            set(hSrc, 'PurelyIntegerCode', 'on');
        else
            set(hSrc, 'PurelyIntegerCode', 'off');
        end
    case 'Tag_ConfigSet_RTW_ERT_GRTInterface'
        % 117 119
        val = getWidgetValue(hDlg, tag);
        if logical(val)
            setWidgetValue(hDlg, 'Tag_ConfigSet_RTW_ERT_SupportFloat', true);
            set(hSrc, 'PurelyIntegerCode', 'off');
            setWidgetValue(hDlg, 'Tag_ConfigSet_RTW_ERT_CombineOutputUpdateFcns', false);
            set(hSrc, 'CombineOutputUpdateFcns', 'off');
        end
    case 'Tag_ConfigSet_RTW_ERT_SuppressErrorStatus'
        val = getWidgetValue(hDlg, tag);
        if logical(val)
            setWidgetValue(hDlg, 'Tag_ConfigSet_RTW_ERT_SupportContinuousTime', false);
            set(hSrc, 'SupportContinuousTime', 'off');
        end
    case 'Tag_ConfigSet_RTW_ERT_GenCustomStepWrapper'
        enableApplyButton = false;
        model = hSrc.getModel();
        fcnclass = get_param(model, 'RTWFcnClass');
        if ~(isempty(fcnclass)) && isa(fcnclass, 'RTW.FcnCtl') && ~(isempty(fcnclass.ViewWidget)) && ishandle(fcnclass.ViewWidget)
            % 136 138
            fcnclass.ViewWidget.show();
        else
            if isempty(fcnclass) || ~(isa(fcnclass, 'RTW.FcnCtl'))
                fcnclass = RTW.FcnDefault('', model);
                % 141 144
                % 142 144
                dirtyFlag = get_param(model, 'Dirty');
                set_param(model, 'RTWFcnClass', fcnclass);
                set_param(model, 'Dirty', dirtyFlag);
            else
                if ~(ishandle(fcnclass.ModelHandle)) || ne(fcnclass.ModelHandle, model)
                    fcnclass.ModelHandle = model;
                end
            end
            fcnclassUI = RTW.FcnCtlUI(fcnclass);
            fcnclass.ViewWidget = DAStudio.Dialog(fcnclassUI);
            % 153 156
            % 154 156
        end
    case 'Tag_ConfigSet_RTW_ERT_MatFileLogging'
        val = getWidgetValue(hDlg, tag);
        if logical(val)
            setWidgetValue(hDlg, 'Tag_ConfigSet_RTW_ERT_SupportFloat', true);
            set(hSrc, 'PurelyIntegerCode', 'off');
            setWidgetValue(hDlg, 'Tag_ConfigSet_RTW_ERT_SupportNonFinite', true);
            set(hSrc, 'SupportNonFinite', 'on');
            setWidgetValue(hDlg, 'Tag_ConfigSet_RTW_ERT_IncludeMdlTerminateFcn', true);
            set(hSrc, 'IncludeMdlTerminateFcn', 'on');
            setWidgetValue(hDlg, 'Tag_ConfigSet_RTW_ERT_SuppressErrorStatus', false);
            set(hSrc, 'SuppressErrorStatus', 'off');
        end
    case 'Tag_ConfigSet_RTW_ERT_SupportNonInlinedSFcns'
        val = getWidgetValue(hDlg, tag);
        if logical(val)
            setWidgetValue(hDlg, 'Tag_ConfigSet_RTW_ERT_SupportFloat', true);
            set(hSrc, 'PurelyIntegerCode', 'off');
            setWidgetValue(hDlg, 'Tag_ConfigSet_RTW_ERT_SupportNonFinite', true);
            set(hSrc, 'SupportNonFinite', 'on');
        end
    case {'Tag_ConfigSet_RTW_ERT_RTWCAPIParams','Tag_ConfigSet_RTW_ERT_RTWCAPISignals'}
        % 177 179
        val1 = strcmp(get(hSrc, 'RTWCAPIParams'), 'on');
        val2 = strcmp(get(hSrc, 'RTWCAPISignals'), 'on');
        if ~(val1) && ~(val2)
            hParentController.ErrorDialog = warndlg('Warning: C-API will not be generated.  To generate C-API, either Signals or Parameters or both should be checked.');
            % 182 185
            % 183 185
            setWidgetValue(hDlg, 'Tag_ConfigSet_RTW_ERT_DataExchangeInterface', 0.0);
        end
    case 'Tag_ConfigSet_RTW_Templates_ERTSrcFileBannerTemplate_Browse'
        % 187 189
        val = getWidgetValue(hDlg, 'Tag_ConfigSet_RTW_Templates_ERTSrcFileBannerTemplate');
        currFile = '';
        if ~(isempty(val))
            currFile = which(val);
            if strncmp(currFile, 'built-in', 8.0) || strcmp(currFile, 'variable')
                currFile = '';
            end
        end
        % 196 198
        [filename, pathname] = uigetfile({'*.tlc','*.tlc';'*.cgt','*.cgt'}, action, currFile);
        % 198 202
        % 199 202
        % 200 202
        if ~(isequal(filename, 0.0)) && ~(isequal(pathname, 0.0))
            set(hSrc, 'ERTSrcFileBannerTemplate', filename);
        else
            enableApplyButton = false;
        end
    case 'Tag_ConfigSet_RTW_Templates_ERTSrcFileBannerTemplate_Edit'
        % 207 209
        if ~(isempty(hSrc.ERTSrcFileBannerTemplate))
            edit(hSrc.ERTSrcFileBannerTemplate);
        end
        enableApplyButton = false;
    case 'Tag_ConfigSet_RTW_Templates_ERTHdrFileBannerTemplate_Browse'
        % 213 215
        val = getWidgetValue(hDlg, 'Tag_ConfigSet_RTW_Templates_ERTHdrFileBannerTemplate');
        currFile = '';
        if ~(isempty(val))
            currFile = which(val);
            if strncmp(currFile, 'built-in', 8.0) || strcmp(currFile, 'variable')
                currFile = '';
            end
        end
        % 222 224
        [filename, pathname] = uigetfile({'*.tlc','*.tlc';'*.cgt','*.cgt'}, action, currFile);
        % 224 228
        % 225 228
        % 226 228
        if ~(isequal(filename, 0.0)) && ~(isequal(pathname, 0.0))
            set(hSrc, 'ERTHdrFileBannerTemplate', filename);
        else
            enableApplyButton = false;
        end
    case 'Tag_ConfigSet_RTW_Templates_ERTHdrFileBannerTemplate_Edit'
        % 233 235
        if ~(isempty(hSrc.ERTHdrFileBannerTemplate))
            edit(hSrc.ERTHdrFileBannerTemplate);
        end
        enableApplyButton = false;
    case 'Tag_ConfigSet_RTW_Templates_ERTDataSrcFileTemplate_Browse'
        % 239 241
        val = getWidgetValue(hDlg, 'Tag_ConfigSet_RTW_Templates_ERTDataSrcFileTemplate');
        currFile = '';
        if ~(isempty(val))
            currFile = which(val);
            if strncmp(currFile, 'built-in', 8.0) || strcmp(currFile, 'variable')
                currFile = '';
            end
        end
        % 248 250
        [filename, pathname] = uigetfile({'*.tlc','*.tlc';'*.cgt','*.cgt'}, action, currFile);
        % 250 254
        % 251 254
        % 252 254
        if ~(isequal(filename, 0.0)) && ~(isequal(pathname, 0.0))
            set(hSrc, 'ERTDataSrcFileTemplate', filename);
        else
            enableApplyButton = false;
        end
    case 'Tag_ConfigSet_RTW_Templates_ERTDataSrcFileTemplate_Edit'
        % 259 261
        if ~(isempty(hSrc.ERTDataSrcFileTemplate))
            edit(hSrc.ERTDataSrcFileTemplate);
        end
        enableApplyButton = false;
    case 'Tag_ConfigSet_RTW_Templates_ERTDataHdrFileTemplate_Browse'
        % 265 267
        val = getWidgetValue(hDlg, 'Tag_ConfigSet_RTW_Templates_ERTDataHdrFileTemplate');
        currFile = '';
        if ~(isempty(val))
            currFile = which(val);
            if strncmp(currFile, 'built-in', 8.0) || strcmp(currFile, 'variable')
                currFile = '';
            end
        end
        % 274 276
        [filename, pathname] = uigetfile({'*.tlc','*.tlc';'*.cgt','*.cgt'}, action, currFile);
        % 276 280
        % 277 280
        % 278 280
        if ~(isequal(filename, 0.0)) && ~(isequal(pathname, 0.0))
            set(hSrc, 'ERTDataHdrFileTemplate', filename);
        else
            enableApplyButton = false;
        end
    case 'Tag_ConfigSet_RTW_Templates_ERTDataHdrFileTemplate_Edit'
        % 285 287
        if ~(isempty(hSrc.ERTDataHdrFileTemplate))
            edit(hSrc.ERTDataHdrFileTemplate);
        end
        enableApplyButton = false;
    case 'Tag_ConfigSet_RTW_Templates_ERTCustomFileTemplate_Browse'
        % 291 293
        val = getWidgetValue(hDlg, 'Tag_ConfigSet_RTW_Templates_ERTCustomFileTemplate');
        currFile = '';
        if ~(isempty(val))
            currFile = which(val);
            if strncmp(currFile, 'built-in', 8.0) || strcmp(currFile, 'variable')
                currFile = '';
            end
        end
        % 300 302
        [filename, pathname] = uigetfile({'*.tlc','*.tlc';'*.cgt','*.cgt'}, action, currFile);
        % 302 305
        % 303 305
        if ~(isequal(filename, 0.0)) && ~(isequal(pathname, 0.0))
            set(hSrc, 'ERTCustomFileTemplate', filename);
        else
            enableApplyButton = false;
        end
    case 'Tag_ConfigSet_RTW_Templates_ERTCustomFileTemplate_Edit'
        % 310 312
        if ~(isempty(hSrc.ERTCustomFileTemplate))
            edit(hSrc.ERTCustomFileTemplate);
        end
        enableApplyButton = false;
    case {'Tag_ConfigSet_RTW_DataPlacement_DataDefinitionFile','Tag_ConfigSet_RTW_DataPlacement_DataReferenceFile','Tag_ConfigSet_RTW_DataPlacement_ModuleName'}
        % 316 320
        % 317 320
        % 318 320
        val = getWidgetValue(hDlg, tag);
        userdata = hDlg.getUserData(tag);
        param = userdata.ObjectProperty;
        [errtxt, newval] = ec_check_user_entered_fields(param, val);
        if ~(isempty(errtxt))
            oldval = get_param(hSrc, param);
            if isnumeric(oldval)
                oldval = num2str(oldval);
            end
            errmsg = buildErrMsg(hSrc, val, oldval, errtxt, userdata);
            lasterr(errmsg, horzcat('Simulink:ERTTargetCC:', param));
            hParentController.ErrorDialog = errordlg(errmsg);
        else
            set(hSrc, param, newval);
            setWidgetValue(hDlg, tag, newval);
        end
    case {'Tag_ConfigSet_RTW_DataPlacement_SignalDisplayLevel','Tag_ConfigSet_RTW_DataPlacement_ParamTuneLevel'}
        % 336 339
        % 337 339
        val = hDlg.getWidgetValue(tag);
        userdata = hDlg.getUserData(tag);
        param = userdata.ObjectProperty;
        try
            set_param(hSrc, param, val);
        catch
            oldval = get_param(hSrc, param);
            if isnumeric(oldval)
                oldval = num2str(oldval);
            end
            errtxt = lasterror;
            errtxt = errtxt.message;
            errmsg = buildErrMsg(hSrc, val, oldval, errtxt, userdata);
            lasterror('reset');
            lasterr(errmsg, horzcat('Simulink:ERTTargetCC:', param));
            hParentController.ErrorDialog = errordlg(errmsg);
            enableApplyButton = true;
        end % try
    case {'Tag_ConfigSet_RTW_ERT_Replacement_ReplacementTypes_double','Tag_ConfigSet_RTW_ERT_Replacement_ReplacementTypes_single','Tag_ConfigSet_RTW_ERT_Replacement_ReplacementTypes_int32','Tag_ConfigSet_RTW_ERT_Replacement_ReplacementTypes_int16','Tag_ConfigSet_RTW_ERT_Replacement_ReplacementTypes_int8','Tag_ConfigSet_RTW_ERT_Replacement_ReplacementTypes_uint32','Tag_ConfigSet_RTW_ERT_Replacement_ReplacementTypes_uint16','Tag_ConfigSet_RTW_ERT_Replacement_ReplacementTypes_uint8','Tag_ConfigSet_RTW_ERT_Replacement_ReplacementTypes_boolean','Tag_ConfigSet_RTW_ERT_Replacement_ReplacementTypes_int','Tag_ConfigSet_RTW_ERT_Replacement_ReplacementTypes_uint','Tag_ConfigSet_RTW_ERT_Replacement_ReplacementTypes_char'}
        % 357 370
        % 358 370
        % 359 370
        % 360 370
        % 361 370
        % 362 370
        % 363 370
        % 364 370
        % 365 370
        % 366 370
        % 367 370
        % 368 370
        val = getWidgetValue(hDlg, tag);
        replacements = get_param(hSrc, 'ReplacementTypes');
        % 371 373
        switch tag
        case 'Tag_ConfigSet_RTW_ERT_Replacement_ReplacementTypes_double'
            r_offset = 5.0;
            r_type = 'double';
        case 'Tag_ConfigSet_RTW_ERT_Replacement_ReplacementTypes_single'
            r_offset = 5.0;
            r_type = 'single';
        case 'Tag_ConfigSet_RTW_ERT_Replacement_ReplacementTypes_int32'
            r_offset = 4.0;
            r_type = 'int32';
        case 'Tag_ConfigSet_RTW_ERT_Replacement_ReplacementTypes_int16'
            r_offset = 4.0;
            r_type = 'int16';
        case 'Tag_ConfigSet_RTW_ERT_Replacement_ReplacementTypes_int8'
            r_offset = 3.0;
            r_type = 'int8';
        case 'Tag_ConfigSet_RTW_ERT_Replacement_ReplacementTypes_uint32'
            r_offset = 5.0;
            r_type = 'uint32';
        case 'Tag_ConfigSet_RTW_ERT_Replacement_ReplacementTypes_uint16'
            r_offset = 5.0;
            r_type = 'uint16';
        case 'Tag_ConfigSet_RTW_ERT_Replacement_ReplacementTypes_uint8'
            r_offset = 4.0;
            r_type = 'uint8';
        case 'Tag_ConfigSet_RTW_ERT_Replacement_ReplacementTypes_boolean'
            r_offset = 6.0;
            r_type = 'boolean';
        case 'Tag_ConfigSet_RTW_ERT_Replacement_ReplacementTypes_int'
            r_offset = 2.0;
            r_type = 'int';
        case 'Tag_ConfigSet_RTW_ERT_Replacement_ReplacementTypes_uint'
            r_offset = 3.0;
            r_type = 'uint';
        case 'Tag_ConfigSet_RTW_ERT_Replacement_ReplacementTypes_char'
            r_offset = 3.0;
            r_type = 'char';
        end
        % 410 412
        newval = val;
        [errtxt, val] = ec_check_user_entered_fields('ReplacementTypes', val, replacements, tag(minus(end, r_offset):end));
        if ~(isempty(errtxt))
            oldval = replacements.(r_type);
            if isnumeric(oldval)
                oldval = num2str(oldval);
            end
            userdata = hDlg.getUserData(tag);
            errmsg = buildErrMsgReplacementTypes(hSrc, newval, oldval, errtxt, userdata, r_type);
            lasterr(errmsg, horzcat('Simulink:ERTTargetCC:ReplacementTypes_', r_type));
            hParentController.ErrorDialog = errordlg(errmsg);
        else
            replacements.(r_type) = val;
            set_param(hSrc, 'ReplacementTypes', replacements);
        end
    otherwise
        % 427 429
        error('unknown action');
    end
    % 430 432
    if enableApplyButton && ~(forValidate)
        hDlg.enableApplyButton(true, false);
    end
end
function errmsg = buildErrMsg(hSrc, newval, oldval, errtxt, userdata)
    % 436 439
    % 437 439
    param = userdata.ObjectProperty;
    widgetname = userdata.Name;
    pagename = userdata.PageName;
    % 441 443
    err_Txt1 = sprintf('Invalid value entered for ''%s'' on the ''%s'' page:', xlate(widgetname), xlate(pagename));
    % 443 447
    % 444 447
    % 445 447
    err_Txt2 = sprintf('Value entered:  ''%s''', newval);
    err_Txt3 = sprintf('Previous value: ''%s''', oldval);
    % 448 450
    errmsg = horzcat(err_Txt1, sprintf('\n\n'), errtxt, sprintf('\n\n'), err_Txt2, sprintf('\n'), err_Txt3);
    % 450 454
    % 451 454
    % 452 454
end
function errmsg = buildErrMsgReplacementTypes(hSrc, newval, oldval, errtxt, userdata, element)
    % 455 458
    % 456 458
    param = userdata.ObjectProperty;
    widgetname = userdata.FieldName;
    pagename = userdata.PageName;
    % 460 462
    err_Txt1 = sprintf('Invalid value entered for ''%s'' on the ''%s'' page:', xlate(widgetname), xlate(pagename));
    % 462 466
    % 463 466
    % 464 466
    err_Txt2 = sprintf('Value entered:  ''%s''', newval);
    err_Txt3 = sprintf('Previous value: ''%s''', oldval);
    % 467 469
    errmsg = horzcat(err_Txt1, sprintf('\n\n'), errtxt, sprintf('\n\n'), err_Txt2, sprintf('\n'), err_Txt3);
    % 469 473
    % 470 473
    % 471 473
end
