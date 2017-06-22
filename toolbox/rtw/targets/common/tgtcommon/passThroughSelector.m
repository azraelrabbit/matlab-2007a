function mode = passThroughSelector(model)
    % 1 34
    % 2 34
    % 3 34
    % 4 34
    % 5 34
    % 6 34
    % 7 34
    % 8 34
    % 9 34
    % 10 34
    % 11 34
    % 12 34
    % 13 34
    % 14 34
    % 15 34
    % 16 34
    % 17 34
    % 18 34
    % 19 34
    % 20 34
    % 21 34
    % 22 34
    % 23 34
    % 24 34
    % 25 34
    % 26 34
    % 27 34
    % 28 34
    % 29 34
    % 30 34
    % 31 34
    % 32 34
    switch get_param(model, 'TargetStyle')
    case 'StandAloneTarget'
        target = get_param(model, 'RTWSystemTargetFile');
        if not(isempty(regexp(lower(target), 'pil')))
            % 37 40
            % 38 40
            mode = 0.0;
        else
            mode = 1.0;
        end % if
    otherwise
        % 44 46
        mode = 0.0;
    end % switch
