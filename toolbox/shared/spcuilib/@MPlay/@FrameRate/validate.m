function [success, err] = validate(framerateObj)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    err = '';
    success = true;
    % 10 14
    % 11 14
    % 12 14
    local_fps_str = framerateObj.dialog.getWidgetValue('desired_fps');
    local_fps = str2double(local_fps_str);
    [success, err] = CheckFPS(framerateObj, local_fps);
    if not(success)
        return;
    end % if
    % 19 21
    local_fps_str = framerateObj.dialog.getWidgetValue('sched_rateMin');
    local_fps_min = str2double(local_fps_str);
    [success, err] = CheckFPS(framerateObj, local_fps_min);
    if not(success)
        return;
    end % if
    local_fps_str = framerateObj.dialog.getWidgetValue('sched_rateMax');
    local_fps_max = str2double(local_fps_str);
    [success, err] = CheckFPS(framerateObj, local_fps_max);
    if not(success)
        return;
    end % if
    success = lt(local_fps_min, local_fps_max);
    if not(success)
        err = 'Minimum rate must be less than maximum rate.';
    end % if
end % function
