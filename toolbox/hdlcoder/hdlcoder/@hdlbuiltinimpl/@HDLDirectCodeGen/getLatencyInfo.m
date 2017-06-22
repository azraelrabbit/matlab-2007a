function latencyInfo = getLatencyInfo(this, hC)
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
    for ii=1.0:length(hC.InputPorts)
        latencyInfo.Inputs{ii} = 0.0;
    end % for
    % 17 18
    for ii=1.0:length(hC.OutputPorts)
        latencyInfo.Outputs{ii} = 0.0;
    end % for
end % function
