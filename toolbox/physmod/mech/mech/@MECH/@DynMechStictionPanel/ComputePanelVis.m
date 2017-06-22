function panelVisArray = ComputePanelVis(hThis, primName, isConnected)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    panelVisArray = [0.0 0.0 0.0 0.0 0.0 0.0];
    if isConnected
        switch primName(1.0)
        case 'S'
            panelVisArray = [1.0 0.0 0.0 1.0 0.0 0.0];
        case 'R'
            panelVisArray = [1.0 0.0 1.0 0.0 0.0 1.0];
        case 'P'
            panelVisArray = [1.0 1.0 0.0 0.0 0.0 1.0];
        otherwise
            panelVisArray = [0.0 0.0 0.0 0.0 1.0 0.0];
        end % switch
    else
        panelVisArray = [0.0 0.0 0.0 0.0 1.0 0.0];
    end % if
    % 22 23
end % function
