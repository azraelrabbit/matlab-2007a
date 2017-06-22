function targets_trace_enable(model)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    switch class(model)
    case 'char'
        % 11 12
        model = strtok(model, '/');
        names = getConfigSets(model);
        for i=1.0:length(names)
            % 15 16
            cs = getConfigSet(model, names{i});
            i_processConfigSet(cs);
        end % for
    case 'Simulink.ConfigSet'
        % 20 21
        cs = model;
        i_processConfigSet(cs);
    otherwise
        error('Input argument must be either a Simulink model or configuration set.');
    end % switch
end % function
function i_processConfigSet(cs)
    % 28 30
    % 29 30
    if strcmpi(get_param(cs, 'IsERTTarget'), 'on')
        set_param(cs, 'GenerateReport', 'on');
        set_param(cs, 'IncludeHyperlinkInReport', 'on');
        set_param(cs, 'GenerateTraceInfo', 'on');
    end % if
end % function
