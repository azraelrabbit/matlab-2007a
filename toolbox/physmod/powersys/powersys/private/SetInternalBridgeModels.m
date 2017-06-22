function SetInternalBridgeModels(block, PowerguiInfo, DeviceType)
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
    CurrentBlockChoice = get_param(horzcat(block, '/model'), 'BlockChoice');
    % 16 17
    NewBlockChoice = horzcat('continuous ', DeviceType);
    if PowerguiInfo.Continuous && not(isequal(CurrentBlockChoice, NewBlockChoice))
        set_param(horzcat(block, '/model'), 'BlockChoice', NewBlockChoice);
    end % if
    % 21 23
    % 22 23
    if PowerguiInfo.Discrete
        set_param(horzcat(block, '/model'), 'UserData', PowerguiInfo.Ts);
    end % if
    % 26 28
    % 27 28
    switch DeviceType
    case 'Diode-RL'
        % 30 31
        NewBlockChoice = 'discrete Diode-Logic';
    case 'Thyristor-RL'
        % 33 34
        NewBlockChoice = 'discrete Thyristor-Logic';
    otherwise
        NewBlockChoice = horzcat('discrete ', DeviceType);
    end % switch
    if PowerguiInfo.Discrete && not(isequal(CurrentBlockChoice, NewBlockChoice))
        set_param(horzcat(block, '/model'), 'BlockChoice', NewBlockChoice);
    end % if
end % function
