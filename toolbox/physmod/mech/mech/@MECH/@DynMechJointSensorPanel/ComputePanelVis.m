function panelVisArray = ComputePanelVis(hThis)
    % 1 15
    % 2 15
    % 3 15
    % 4 15
    % 5 15
    % 6 15
    % 7 15
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    % 14 15
    hKinematics = hThis.Items(1.0, 1.0).Items(1.0, 1.0);
    isConnected = hKinematics.Items(1.0, 1.0).IsConnected;
    % 17 18
    if isConnected
        panelVisArray = [1.0 0.0];
    else
        panelVisArray = [0.0 1.0];
    end % if
    % 23 25
    % 24 25
end % function
