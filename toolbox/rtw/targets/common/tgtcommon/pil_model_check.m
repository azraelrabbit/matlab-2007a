function dummyTLCArg = pil_model_check(modelName)
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
    % 13 14
    error(nargchk(1.0, 1.0, nargin, 'struct'));
    % 15 17
    % 16 17
    dummyTLCArg = 0.0;
    % 18 20
    % 19 20
    modelName = strtok(modelName, '/');
    % 21 22
    load_system(modelName);
    % 23 25
    % 24 25
    if i_optionOn(modelName, 'SupportContinuousTime')
        error('Processor-in-the-Loop (PIL) does not support continuous time. Please uncheck "continuous time" in the RTW Interface configuration set options or disable PIL.');
        % 27 29
        % 28 29
    end % if
    % 30 32
    % 31 32
    if i_optionOn(modelName, 'MultiInstanceERTCode')
        error('Processor-in-the-Loop (PIL) does not support reusable code. Please uncheck "Generate reusable code" in the RTW Interface configuration set options or disable PIL.');
        % 34 36
        % 35 36
    end % if
end % function
function optionOn = i_optionOn(modelName, option)
    % 39 44
    % 40 44
    % 41 44
    % 42 44
    % 43 44
    optionValue = get_param(modelName, option);
    switch optionValue
    case 'on'
        optionOn = true;
    case 'off'
        optionOn = false;
    otherwise
        error(horzcat('Unknown value (', optionValue, ') for option (', option, ')'));
    end % switch
end % function
