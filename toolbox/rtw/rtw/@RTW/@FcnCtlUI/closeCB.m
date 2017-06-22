function closeCB(hObj, hDlg, action)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    classObj = hObj.fcnclass;
    classObj.closeCB(hDlg, action);
    % 9 10
    if hObj.fcnclass.RightClickBuild
        rtwprivate('config_fcnproto_ss_build', hObj.fcnclass.SubsysBlockHdl, [], 'Close');
    end % if
    % 13 14
    if not(isempty(hObj.closeListener)) && ishandle(hObj.closeListener)
        hObj.closeListener = [];
    end % if
end % function
