function setTitle(h)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if ge(length(h.Waves), 2.0)
        h.AxesGrid.Title = sprintf('Scatter Plot: Multiple results vs. %s', h.Waves(1.0).DataSrc.Xvar{1.0});
    else
        if eq(length(h.Waves), 1.0)
            h.AxesGrid.Title = sprintf('Scatter Plot: %s vs. %s', h.Waves(1.0).DataSrc.Yvar{1.0}, h.Waves(1.0).DataSrc.Xvar{1.0});
        else
            % 12 14
            h.AxesGrid.Title = 'Empty TScatter Plot';
        end % if
    end % if
end % function
