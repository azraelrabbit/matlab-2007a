function ActiveRectifierCback(block, action)
    % 1 16
    % 2 16
    % 3 16
    % 4 16
    % 5 16
    % 6 16
    % 7 16
    % 8 16
    % 9 16
    % 10 16
    % 11 16
    % 12 16
    % 13 16
    % 14 16
    % 15 16
    switchType = get_param(block, 'Device');
    % 17 18
    switch action
    case 'Initialization'
        set_param(horzcat(block, '/Rectifier_3ph'), 'Device', switchType);
    case 'Device configuration'
        % 22 42
        % 23 42
        % 24 42
        % 25 42
        % 26 42
        % 27 42
        % 28 42
        % 29 42
        % 30 42
        % 31 42
        % 32 42
        % 33 42
        % 34 42
        % 35 42
        % 36 42
        % 37 42
        % 38 42
        % 39 42
        % 40 42
        % 41 42
        visibilities = {'on','on','on','on','on','on','on','on','on','on','off','on','off','off','off','off','off','off'};
        % 43 44
        switch switchType
        case 'MOSFET / Diodes'
            visibilities{12.0} = 'off';
        case 'GTO / Diodes'
            visibilities{14.0} = 'on';
        case 'IGBT / Diodes'
            visibilities{15.0} = 'on';
        end % switch
        set_param(block, 'MaskVisibilities', visibilities);
    otherwise
        error('Unknown action ''', action, ''' in callback function ''', mfilename, '''.')
    end % switch
end % function
