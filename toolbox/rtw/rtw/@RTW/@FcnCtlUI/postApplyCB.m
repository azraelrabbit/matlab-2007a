function [status, errMsg] = postApplyCB(hObj, hDlg)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    status = 1.0;
    errMsg = '';
    [status, errMsg] = hObj.fcnclass.postApplyCB();
    % 11 12
    codeResult = hObj.fcnclass.codeConstruction();
    hObj.fcnclass.ArgSpecData = codeResult.ArgSpec;
    % 14 15
    if eq(status, 1.0) && isempty(errMsg)
        set_param(hObj.fcnclass.ModelHandle, 'RTWFcnClass', hObj.fcnclass);
    end % if
    % 18 19
    if hObj.fcnclass.RightClickBuild
        % 20 21
        set_param(hObj.fcnclass.SubsysBlockHdl, 'SSRTWFcnClass', hObj.fcnclass);
        originalMdl = bdroot(hObj.fcnclass.SubsysBlockHdl);
        set_param(originalMdl, 'Dirty', 'on');
    end % if
    % 25 26
    hDlg.resetSize(false);
    hDlg.refresh();
    hDlg.resetSize(false);
end % function
