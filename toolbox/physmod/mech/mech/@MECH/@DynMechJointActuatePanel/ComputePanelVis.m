function panelVisArray = ComputePanelVis(hThis, primativeName, actStyleName, isConnected)
    % 1 23
    % 2 23
    % 3 23
    % 4 23
    % 5 23
    % 6 23
    % 7 23
    % 8 23
    % 9 23
    % 10 23
    % 11 23
    % 12 23
    % 13 23
    % 14 23
    % 15 23
    % 16 23
    % 17 23
    % 18 23
    % 19 23
    % 20 23
    % 21 23
    % 22 23
    if not(isConnected)
        panelVisArray = [0.0 0.0 0.0 0.0 1.0 0.0 0.0];
    else
        visMap = [5.0 5.0 ;  6.0 3.0 ;  7.0 2.0 ;  4.0 4.0];
        % 27 30
        % 28 30
        % 29 30
        panelVisArray = [1.0 0.0 0.0 0.0 0.0 0.0 0.0];
        switch primativeName(1.0)
        case 'P'
            rowIdx = 2.0;
        case 'R'
            rowIdx = 3.0;
        case 'S'
            rowIdx = 4.0;
        otherwise
            rowIdx = 1.0;
            panelVisArray(1.0) = 0.0;
        end % switch
        switch actStyleName(1.0)
        case 'G'
            colIdx = 1.0;
        case 'M'
            colIdx = 2.0;
        otherwise
            colIdx = 1.0;
        end % switch
        panelVisArray(visMap(rowIdx, colIdx)) = 1.0;
    end % if
    % 52 53
end % function
