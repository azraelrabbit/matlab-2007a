function connect_state(playbackControls)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    % 12 13
    playbackControls.status_bar.OptionText(2.0, sprintf('(? fps)'));
    s = sprintf('Simulink sample rate\n(not actual display rate)');
    playbackControls.status_bar.OptionTooltip(2.0, s);
    % 16 19
    % 17 19
    % 18 19
    playbackControls.framecnt = 0.0;
    playbackControls.TimeOfDisplayData = 0.0;
    playbackControls.status_bar.OptionText(3.0, sprintf('T=?'));
    playbackControls.status_bar.OptionTooltip(3.0, 'Simulation time');
    % 23 25
    % 24 25
    Enable(playbackControls, true);
    % 26 27
    UpdateConnectButton(playbackControls.srcObj, 'connect');
end % function
