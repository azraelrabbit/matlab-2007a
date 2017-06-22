function idx = targets_find_signature(sigs, args)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    if isempty(args)
        % 10 11
        params = {};
    else
        % 13 14
        params = fieldnames(args);
    end % if
    % 16 19
    % 17 19
    % 18 19
    foundConstructor = false;
    for idx=1.0:length(sigs)
        % 21 23
        % 22 23
        if isempty(setxor(params, sigs{idx}))
            foundConstructor = true;
            break
        end % if
    end % for
    % 28 29
    if not(foundConstructor)
        if isempty(params)
            % 31 32
            error('Targets:ExecuteConstructor', 'No matching constructor');
        else
            % 34 35
            paramsString = '';
            % 36 37
            for i=1.0:length(params)
                paramsString = horzcat(paramsString, params{i}, ' ');
            end % for
            error('Targets:ExecuteConstructor', horzcat('No matching constructor for parameters: ', paramsString));
        end % if
    end % if
end % function
