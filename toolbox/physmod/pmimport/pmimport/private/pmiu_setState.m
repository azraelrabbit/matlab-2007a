function pmiu_setState(s)
    % 1 14
    % 2 14
    % 3 14
    % 4 14
    % 5 14
    % 6 14
    % 7 14
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    persistent WARNING_STATE;
    % 14 16
    if strcmp(s, 'set')
        % 16 18
        pmiu_debug(false);
        pmiu_warning(true);
        pmiu_todo(false);
        pmiu_status(2.0, 1.0);
        pmiu_status(-1.0);
        % 22 24
        WARNING_STATE = warning('query', 'backtrace');
        warning('backtrace', 'off');
    else
        if strcmp(s, 'clear')
            if isempty(WARNING_STATE)
                WARNING_STATE.identifier = 'backtrace';
                WARNING_STATE.state = 'on';
                error('physmod:import:internal:WarningStateNotSaved', 'Internal consistency: the warning state was not saved.');
                % 31 33
            end
            warning(WARNING_STATE);
            WARNING_STATE = [];
            % 35 38
            % 36 38
            pmiu_status(-1.0);
        else
            % 39 41
            error('Unrecognized option ''%s'' in pmiu_setState.', s);
        end
    end
end
