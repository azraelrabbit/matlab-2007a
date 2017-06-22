function setTitle(h)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if ge(length(h.Waves), 1.0)
        h.AxesGrid.Title = sprintf('Waterfall Plot: %s vs. %s,%s', h.Waves(1.0).DataSrc.Zvar{1.0}, h.Waves(1.0).DataSrc.Xvar{1.0}, h.Waves(1.0).DataSrc.Yvar{1.0});
    else
        % 10 11
        % 11 12
        h.AxesGrid.Title = 'Empty Waterfall Plot';
    end % if
end % function
