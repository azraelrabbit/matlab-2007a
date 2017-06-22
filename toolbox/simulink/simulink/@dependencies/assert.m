function assert(cond, msg)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    if not(cond)
        dbstack;
        error('Simulink:Dependencies:AssertionFailure', 'Assertion Failure: %s', msg);
    end % if
end % function
