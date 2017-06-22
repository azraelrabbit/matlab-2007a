function cs = targets_getActiveConfigSet(model)
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
    switch class(model)
    case 'char'
        % 18 19
        model = strtok(model, '/');
        % 20 21
        load_system(model);
        % 22 23
        cs = getActiveConfigSet(model);
    case 'Simulink.ConfigSet'
        % 25 26
        cs = model;
    otherwise
        error('Input argument must be either a Simulink model or configuration set.');
    end % switch
end % function
