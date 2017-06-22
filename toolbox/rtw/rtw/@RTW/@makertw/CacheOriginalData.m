function CacheOriginalData(h)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    h.PathToRestore = path;
    addpath(pwd);
    % 13 15
    % 14 15
    h.OrigRecycleState = recycle('off');
    % 16 17
    if strcmp(get_param(h.ModelHandle, 'Lock'), 'on')
        % 18 20
        % 19 20
        h.cleanChange('parameter', 'Lock', 'off');
    end % if
end % function
