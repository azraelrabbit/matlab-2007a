function [status, errMsg] = postApplyCB(hObj)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    status = 1.0;
    errMsg = '';
    % 10 11
    if not(isempty(hObj.cache))
        hObj.Data = hObj.cache.Data;
        hObj.cache = [];
    end % if
end % function
