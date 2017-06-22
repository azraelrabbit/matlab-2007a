function [status, msg] = validate(hSrc, hDlg, modelName, fromBuild)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    status = 1.0;
    msg = '';
    % 9 10
    if eq(slfeature('GenCustomStepWrapper'), 0.0)
        return;
    end % if
    % 13 16
    % 14 16
    % 15 16
    if not(fromBuild)
        if not(hSrc.PreConfigFlag) && isempty(hSrc.Data)
            try
                hSrc.preConfig(hDlg);
            catch
                status = 0.0;
                msg = lasterr;
            end % try
        end % if
    end % if
    % 26 27
    thisObj = hSrc;
    if not(fromBuild)
        if not(isempty(hSrc.cache))
            thisObj = hSrc.cache;
            if ishandle(hDlg)
                thisObj.FunctionName = hDlg.getWidgetValue('PrototypeFuncName');
            end % if
        end % if
    end % if
    % 36 37
    if fromBuild
        thisObj.ModelHandle = get_param(modelName, 'Handle');
    end % if
    % 40 41
    cs = getActiveConfigSet(thisObj.ModelHandle);
    commitBuild = slprivate('checkSimPrm', cs);
    if not(commitBuild)
        msg = DAStudio.message('RTW:fcnClass:validationCanceled');
        return;
    end % if
    % 47 50
    % 48 50
    % 49 50
    if ishandle(hDlg)
        applyFlag = hDlg.hasUnappliedChanges;
    end % if
    % 53 54
    [status, msg] = thisObj.runValidation();
    % 55 56
    if fromBuild
        % 57 59
        % 58 59
        thisObj.ArgSpecData = thisObj.Data;
    end % if
    % 61 63
    % 62 63
    if ishandle(hDlg)
        hDlg.enableApplyButton(applyFlag);
    end % if
end % function
