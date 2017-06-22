function ControlledSourcesCback(block)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    initsrc = get_param(block, 'Initialize');
    if strcmp(initsrc, 'on')
        Source_Type = get_param(block, 'Source_Type');
        initsrc = get_param(block, 'Initialize');
        if strcmp(Source_Type, 'AC')
            set_param(block, 'MaskVisibilities', {'on','on','on','on','on','on'});
        else
            set_param(block, 'MaskVisibilities', {'on','on','on','off','off','on'});
        end % if
    else
        set_param(block, 'MaskVisibilities', {'on','off','off','off','off','on'});
    end % if
end % function
