function DetailedThyristorCback(block)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    Lon = getSPSmaskvalues(block, {'Lon'});
    if gt(Lon, 0.0)
        % 10 11
        set_param(block, 'MaskVisibilities', {'on','on','on','on','on','on','on','on','on'});
    else
        set_param(block, 'MaskVisibilities', {'on','on','on','off','off','on','on','on','on'});
    end % if
end % function
