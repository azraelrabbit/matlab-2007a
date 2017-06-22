function hout = reset(h, t)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    hout = h;
    hout.Length_ = length(t);
    if ge(length(t), 2.0)
        t = timeseries.tsChkTime(t);
        % 12 14
        if le(min(diff(t)), 0.0)
            error('timemetadata:reset:nosort', 'The time vector must have monotonically increasing values such that no two times are the same.')
            % 15 17
        end % if
        % 17 20
        % 18 20
        [isUniformed, interval] = tsIsUniformedTime(t);
        if isUniformed
            hout.Increment = interval;
            hout.Start = t(1.0);
            hout.End = t(end);
        else
            hout.Start = t(1.0);
            hout.Increment = NaN;
            hout.End = t(end);
        end % if
    else
        if eq(length(t), 1.0)
            hout.Start = t(1.0);
            hout.End = t(1.0);
        else
            hout.Start = [];
            hout.End = [];
            hout.Length_ = 0.0;
            hout.Increment = NaN;
            return;
        end % if
    end % if
