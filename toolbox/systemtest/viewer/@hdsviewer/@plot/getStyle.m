function style = getStyle(h)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    style = '';
    if isempty(h.Waves)
        return;
    end % if
    % 10 11
    style = h.Waves(1.0).View.Style;
end % function
