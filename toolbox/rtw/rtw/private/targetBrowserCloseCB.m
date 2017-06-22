function [ok, errmsg] = targetBrowserCloseCB(hObj, val)
    % 1 5
    % 2 5
    % 3 5
    % 4 5
    ok = 1.0;
    errmsg = '';
    % 7 8
    try
        hObj.getDialogSource.uploadTarget(val);
    catch
        ok = 0.0;
        errmsg = lasterr;
    end % try
end % function
