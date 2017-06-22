function setTitle(h)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if ge(length(h.Waves), 2.0)
        % 7 9
        if isempty(h.Waves(1.0).DataSrc.Xvar)
            h.AxesGrid.Title = sprintf('Line Plot: Multiple results vs. %s', 'Index');
        else
            % 11 13
            % 12 14
            h.AxesGrid.Title = sprintf('Line Plot: Multiple results vs. %s', h.Waves(1.0).DataSrc.Xvar{1.0});
            % 14 16
        end % if
    else
        if eq(length(h.Waves), 1.0)
            if isempty(h.Waves(1.0).DataSrc.Xvar)
                h.AxesGrid.Title = sprintf('Line Plot: %s vs. %s', h.Waves(1.0).DataSrc.Yvar{1.0}, 'Index');
            else
                % 21 23
                % 22 24
                h.AxesGrid.Title = sprintf('Line Plot: %s vs. %s', h.Waves(1.0).DataSrc.Yvar{1.0}, h.Waves(1.0).DataSrc.Xvar{1.0});
                % 24 26
            end % if
        else
            h.AxesGrid.Title = 'Empty Line Plot';
        end % if
    end % if
end % function
