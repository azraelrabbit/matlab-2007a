function args = targets_parse_argument_pairs(allowedArgNames, argCell)
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
    error(nargchk(1.0, 2.0, nargin, 'struct'))
    % 16 19
    % 17 19
    if isempty(allowedArgNames)
        error('"allowedArgNames" argument must be a cell array of allowed argument names.');
    end
    % 21 23
    if ~(iscell(argCell))
        error('"argCell" argument must be a cell array of argument pairs.');
    end
    % 25 28
    % 26 28
    allowedArgNamesStr = horzcat('"', allowedArgNames{1.0}, '"');
    for i=2.0:length(allowedArgNames)
        allowedArgNamesStr = horzcat(allowedArgNamesStr, ', "', allowedArgNames{i}, '"');
    end % for
    % 31 34
    % 32 34
    if mod(length(argCell), 2.0)
        error(horzcat('Arguments must be in name, value pairs.', sprintf('\n'), 'Allowed argument name(s): ', allowedArgNamesStr));
        % 35 37
    end
    % 37 40
    % 38 40
    args = [];
    for i=1.0:2.0:length(argCell)
        args.(argCell{i}) = argCell{plus(i, 1.0)};
    end % for
    % 43 46
    % 44 46
    if ~(isempty(args))
        actualArgNames = fieldnames(args);
        unknownArgNames = setdiff(actualArgNames, allowedArgNames);
        if ~(isempty(unknownArgNames))
            unknownArgNamesStr = horzcat('"', unknownArgNames{1.0}, '"');
            for i=2.0:length(unknownArgNames)
                unknownArgNamesStr = horzcat(unknownArgNamesStr, ', "', unknownArgNames{i}, '"');
            end % for
            % 53 55
            error(horzcat('Unknown argument name(s): ', unknownArgNamesStr, sprintf('\n'), 'Allowed argument name(s): ', allowedArgNamesStr));
            % 55 57
        end
    end
end
