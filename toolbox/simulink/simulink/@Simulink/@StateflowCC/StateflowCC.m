function h = StateflowCC(varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    h = Simulink.StateflowCC;
    % 9 10
    set(h, 'Name', 'Stateflow');
    setPropEnabled(h, 'Name', 0.0);
    % 12 14
    % 13 14
    try
        sfroot;
    end % try
end % function
