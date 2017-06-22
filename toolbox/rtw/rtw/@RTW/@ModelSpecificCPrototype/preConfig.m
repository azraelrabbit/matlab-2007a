function preConfig(hSrc, hDlg)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    cs = getActiveConfigSet(hSrc.ModelHandle);
    commitBuild = slprivate('checkSimPrm', cs);
    if not(commitBuild)
        return;
    end % if
    % 13 14
    if isempty(hSrc.cache)
        hSrc.cache = RTW.ModelSpecificCPrototype;
        hSrc.cache.Name = hSrc.Name;
        hSrc.cache.ModelHandle = hSrc.ModelHandle;
        if not(isempty(hSrc.ViewWidget)) && ishandle(hSrc.ViewWidget) && isa(hSrc.ViewWidget, 'DAStudio.Dialog')
            % 19 21
            % 20 21
            hSrc.cache.FunctionName = hSrc.ViewWidget.getWidgetValue('PrototypeFuncName');
        else
            hSrc.cache.FunctionName = hSrc.FunctionName;
        end % if
        hSrc.cache.selRow = 0.0;
        hSrc.cache.RightClickBuild = hSrc.RightClickBuild;
        hSrc.cache.SubsysBlockHdl = hSrc.SubsysBlockHdl;
    end % if
    try
        hSrc.cache.getDefaultConf();
    catch
        DAStudio.error(lasterr);
    end % try
    if not(isempty(hSrc.ViewWidget)) && ishandle(hSrc.ViewWidget) && isa(hSrc.ViewWidget, 'DAStudio.Dialog')
        % 35 37
        % 36 37
        hSrc.ViewWidget.setWidgetValue('PrototypeFuncName', hSrc.cache.FunctionName);
        % 38 39
    end % if
    % 40 41
    hSrc.PreConfigFlag = true;
    % 42 43
    hDlg.enableApplyButton(1.0);
    hDlg.refresh;
end % function
