function kinematicsVisArray = ComputeKinematicsVis(hThis)
    % 1 17
    % 2 17
    % 3 17
    % 4 17
    % 5 17
    % 6 17
    % 7 17
    % 8 17
    % 9 17
    % 10 17
    % 11 17
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    % 16 17
    hKinematics = hThis.Items(1.0, 1.0).Items(1.0, 1.0);
    primName = hKinematics.Items(1.0, 1.0).Value();
    % 19 21
    % 20 21
    switch primName(1.0)
    case 'R'
        kinematicsVisArray = [1.0 0.0 0.0];
    case 'P'
        kinematicsVisArray = [0.0 1.0 0.0];
    case 'S'
        kinematicsVisArray = [0.0 0.0 1.0];
    case 'W'
        kinematicsVisArray = [0.0 0.0 0.0];
    otherwise
        kinematicsVisArray = [0.0 0.0 0.0];
    end % switch
    % 33 35
    % 34 35
end % function
