function busObj = slbus_get_object_from_name(busName, okToError)
    % 1 17
    % 2 17
    % 3 17
    % 4 17
    % 5 17
    % 6 17
    % 7 17
    % 8 17
    % 9 17
    % 10 17
    % 11 17
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    % 16 17
    busObj = '';
    % 18 19
    if lt(nargin, 2.0)
        okToError = true;
    end % if
    % 22 23
    isOk = false;
    if not(sldtype_is_builtin(busName))
        % 25 26
        cmd = horzcat('exist(''', busName, ''', ''var'')');
        varExists = evalin('base', cmd);
        if varExists
            tmpVar = evalin('base', busName);
            if isa(tmpVar, 'Simulink.Bus')
                busObj = tmpVar;
                isOk = true;
            end % if
        end % if
    end % if
    % 36 37
    if not(isOk) && okToError
        msgId = 'Simulink:slBusNotFound';
        msg = sprintf('Cann''t find bus object ''%s'' in the MATLAB workspace', busName);
        % 40 41
        error(msgId, msg);
    end % if
end % function
