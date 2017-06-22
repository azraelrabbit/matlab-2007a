function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    mlock;
    % 8 9
    schema.package('hdldefaults');
    % 10 12
    % 11 12
    if isempty(findtype('int_vector'))
        schema.UserType('int_vector', 'MATLAB array', @check_int_vector);
    end % if
end % function
function check_int_vector(value)
    % 17 19
    % 18 19
    check_vector(value);
    % 20 21
    if not(isa(value, 'int'))
        error('Value must be an integer.');
    end % if
end % function
function check_vector(value)
    % 26 28
    % 27 28
    if not(isnumeric(value))
        error('Value must be numeric.');
    end % if
    % 31 32
    if all(gt(size(value), 1.0))
        error('Value must be a vector.');
    end % if
end % function
