function setTitle(h)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if ge(length(h.Waves), 2.0)
        h.AxesGrid.Title = sprintf('Surface Plot: Multiple results vs. %s,%s', h.Waves(1.0).DataSrc.Xvar{1.0}, h.Waves(1.0).DataSrc.Yvar{1.0});
    else
        if eq(length(h.Waves), 1.0)
            h.AxesGrid.Title = sprintf('Surface Plot: %s vs. %s,%s', h.Waves(1.0).DataSrc.Zvar{1.0}, h.Waves(1.0).DataSrc.Xvar{1.0}, h.Waves(1.0).DataSrc.Yvar{1.0});
        else
            % 12 14
            % 13 15
            h.AxesGrid.Title = 'Empty Surface Plot';
        end % if
    end % if
end % function
