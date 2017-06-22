function [success, err] = validate(colormapObj)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    err = '';
    success = true;
    % 11 15
    % 12 15
    % 13 15
    local_cmapStr = colormapObj.dialog.getWidgetValue('cmapStr');
    % 15 17
    [success, err] = check_cmapStr(colormapObj, local_cmapStr);
    if not(success)
        return
    end
    % 20 22
    local_userRange = colormapObj.dialog.getWidgetValue('userRange');
    local_userRangeMin_str = colormapObj.dialog.getWidgetValue('userRangeMin');
    local_userRangeMax_str = colormapObj.dialog.getWidgetValue('userRangeMax');
    % 24 27
    % 25 27
    if local_userRange
        % 27 30
        % 28 30
        local_userRangeMin = str2double(local_userRangeMin_str);
        local_userRangeMax = str2double(local_userRangeMax_str);
        % 31 34
        % 32 34
        success = not(isnan(local_userRangeMin)) && not(isnan(local_userRangeMax));
        if not(success)
            err = horzcat('Scale values must be numeric values.', sprintf('\n'), 'MATLAB expressions are not allowed.');
            return
        end
        success = isreal(local_userRangeMin) && isreal(local_userRangeMax) && not(issparse(local_userRangeMin)) && not(issparse(local_userRangeMax));
        % 39 41
        if not(success)
            err = 'Scale values must be real scalar values.';
            return
        end
        % 44 47
        % 45 47
        success = le(local_userRangeMin, local_userRangeMax);
        if not(success)
            err = 'Maximum cannot be set less than minimum.';
            return
        end
        % 51 54
        % 52 54
        success = ge(local_userRangeMin, colormapObj.scale_limits(1.0)) && le(local_userRangeMax, colormapObj.scale_limits(2.0));
        % 54 56
        if not(success)
            err = sprintf('Scale values must be in the range [%d, %d]', colormapObj.scale_limits);
            % 57 59
            return
        end
    end
end
