function setTitle(h)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if ge(length(h.Waves), 2.0)
        h.AxesGrid.Title = 'Time Series Plot: Multiple results vs. Time';
    else
        if eq(length(h.Waves), 1.0)
            h.AxesGrid.Title = sprintf('Time Series Plot: %s vs. Time', h.Waves(1.0).DataSrc.Yvar{1.0});
        else
            h.AxesGrid.Title = 'Empty Time Series Plot';
        end % if
    end % if
end % function
