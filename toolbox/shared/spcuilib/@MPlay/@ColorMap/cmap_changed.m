function cmap_changed(colormapObj, eventStruct)
    % 1 17
    % 2 17
    % 3 17
    % 4 17
    % 5 17
    % 6 17
    % 7 17
    % 8 17
    % 9 17
    % 10 17
    % 11 17
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    if lt(nargin, 2.0)
        % 17 22
        % 18 22
        % 19 22
        % 20 22
        id = 'cmapStr';
    else
        % 23 27
        % 24 27
        % 25 27
        id = eventStruct.Source.Name;
    end % if
    % 28 30
    switch id
    case 'cmap'
        % 31 34
        % 32 34
        [success, err] = check_cmap(colormapObj);
        if not(success)
            local_errorHandler(err);
            return;
        end % if
        % 38 41
        % 39 41
        colormapObj.listener_cmapStr.Enabled = 'off';
        colormapObj.listener_cmap.Enabled = 'off';
        % 42 44
        if isempty(colormapObj.cmap)
            % 44 48
            % 45 48
            % 46 48
            colormapObj.cmap = gray(256.0);
            colormapObj.cmapStr = 'gray(256)';
        else
            % 50 53
            % 51 53
            colormapObj.cmapStr = mat2str(colormapObj.cmap);
        end % if
        % 54 57
        % 55 57
        colormapObj.listener_cmap.Enabled = 'on';
        colormapObj.listener_cmapStr.Enabled = 'on';
    case 'cmapStr'
        % 59 63
        % 60 63
        % 61 63
        [success, err, cmap_val] = check_cmapStr(colormapObj);
        if not(success)
            local_errorHandler(err);
            return;
        end % if
        % 67 70
        % 68 70
        colormapObj.listener_cmapStr.Enabled = 'off';
        colormapObj.listener_cmap.Enabled = 'off';
        % 71 73
        if isempty(cmap_val)
            % 73 77
            % 74 77
            % 75 77
            colormapObj.cmap = gray(256.0);
            colormapObj.cmapStr = 'gray(256)';
        else
            % 79 81
            colormapObj.cmap = cmap_val;
        end % if
        % 82 85
        % 83 85
        colormapObj.listener_cmap.Enabled = 'on';
        colormapObj.listener_cmapStr.Enabled = 'on';
    otherwise
        % 87 89
        error('unrecognized source name')
    end % switch
    % 90 93
    % 91 93
    set(colormapObj.hfig, 'colormap', colormapObj.cmap);
function local_errorHandler(msg)
    % 94 97
    % 95 97
    MPlay.errorHandler(msg, 'MPlay ColorMap Error');
