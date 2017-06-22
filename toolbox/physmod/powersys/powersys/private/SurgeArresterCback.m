function SurgeArresterCback(block)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    MoreParameters = get_param(block, 'MoreParameters');
    % 10 11
    if strcmp(MoreParameters, 'on')
        set_param(block, 'MaskVisibilities', {'on','on','on','on','on','on','on','on','on'});
    else
        set_param(block, 'MaskVisibilities', {'on','on','on','on','on','on','on','on','off'});
    end % if
end % function
