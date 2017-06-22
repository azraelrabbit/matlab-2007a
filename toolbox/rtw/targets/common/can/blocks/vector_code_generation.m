function generateCode = vector_code_generation(sys)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    % 12 13
    sys_target_file = get_param(sys, 'RTWSystemTargetFile');
    tlcindex = findstr('.tlc', sys_target_file);
    target = sys_target_file(1.0:minus(tlcindex, 1.0));
    switch target
    case {'grt','ert'}
        % 18 20
        % 19 20
        generateCode = false;
    otherwise
        generateCode = false;
    end % switch
    return;
end % function
