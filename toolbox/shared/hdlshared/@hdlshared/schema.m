function schema
    % 1 5
    % 2 5
    % 3 5
    % 4 5
    schema.package('hdlshared');
    % 6 8
    % 7 8
    if isempty(findtype('double_vector'))
        schema.UserType('double_vector', 'MATLAB array', @check_double_vector);
    end % if
    % 11 12
    if isempty(findtype('SimulinkObjectHandle'))
        schema.UserType('SimulinkObjectHandle', 'handle', @checkSimulinkObjectHandle);
    end % if
end % function
function checkSimulinkObjectHandle(h)
    % 17 20
    % 18 20
    % 19 20
    if not(isempty(h)) && not(isa(h, 'Simulink.Object'))
        error(hdlerrormsgid('valueerr'), 'hdlcoder: Invalid Port Handle Object')
    end % if
end % function
function check_double_vector(value)
    % 25 26
    check_vector(value);
    % 27 28
    if not(isa(value, 'double'))
        error(hdlerrormsgid('valueerr'), 'Value must be a double.');
    end % if
end % function
function check_vector(value)
    % 33 35
    % 34 35
    if not(isnumeric(value))
        error(hdlerrormsgid('valueerr'), 'Value must be numeric.');
    end % if
    % 38 39
    if all(gt(size(value), 1.0))
        error(hdlerrormsgid('valueerr'), 'Value must be a vector.');
    end % if
end % function
