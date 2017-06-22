function rtwsfcn_make_rtw_hook(varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    persistent MODEL_SETTINGS;
    % 8 10
    Action = varargin{1.0};
    modelName = varargin{2.0};
    buildArgs = varargin{6.0};
    % 12 14
    switch Action
    case 'entry'
        % 15 17
        set_param(modelName, 'TargetStyle', 'SimulationTarget');
end
