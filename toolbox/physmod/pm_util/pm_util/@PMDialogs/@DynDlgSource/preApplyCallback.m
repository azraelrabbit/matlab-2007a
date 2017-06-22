function [isOK, errMsgStr] = preApplyCallback(hThis, varargin)
    % 1 15
    % 2 15
    % 3 15
    % 4 15
    % 5 15
    % 6 15
    % 7 15
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    % 14 15
    isOK = true;
    errMsgStr = '';
    doNothing = pm_is_blocklocked(hThis.BlockHandle);
    if not(doNothing)
        try
            pm_cachedsetparam('purge');
            isOK = hThis.BuilderObj.Apply();
            pm_cachedsetparam('set');
        catch
            errMsgStr = lasterr;
            isOK = false;
        end % try
    end % if
end % function
