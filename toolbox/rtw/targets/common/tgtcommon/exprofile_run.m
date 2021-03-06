function profData = exprofile_run(connection, varargin)
    % 1 41
    % 2 41
    % 3 41
    % 4 41
    % 5 41
    % 6 41
    % 7 41
    % 8 41
    % 9 41
    % 10 41
    % 11 41
    % 12 41
    % 13 41
    % 14 41
    % 15 41
    % 16 41
    % 17 41
    % 18 41
    % 19 41
    % 20 41
    % 21 41
    % 22 41
    % 23 41
    % 24 41
    % 25 41
    % 26 41
    % 27 41
    % 28 41
    % 29 41
    % 30 41
    % 31 41
    % 32 41
    % 33 41
    % 34 41
    % 35 41
    % 36 41
    % 37 41
    % 38 41
    % 39 41
    % 40 41
    if eq(nargin, 0.0) || not(any(strcmp(lower(connection), {'can','serial'})))
        % 42 43
        error(sprintf(horzcat(mfilename, ' requires you to specify a connection ', 'to the target board. Available connections ', 'are:\n', '  ', mfilename, '(''can'')\n', '  ', mfilename, '(''serial'')\n')));
        % 44 48
        % 45 48
        % 46 48
        % 47 48
    end % if
    % 49 50
    rawdata = exprofile_get_data_from_target(connection, varargin{:});
    % 51 52
    if not(isempty(rawdata))
        % 53 60
        % 54 60
        % 55 60
        % 56 60
        % 57 60
        % 58 60
        % 59 60
        profileInfo.tasks.names = {'Interrupt 1','Interrupt 2','Interrupt 3','Interrupt 4','Interrupt 5','Interrupt 6','Interrupt 7','Interrupt 8','Interrupt 9','Interrupt 10'};
        % 61 72
        % 62 72
        % 63 72
        % 64 72
        % 65 72
        % 66 72
        % 67 72
        % 68 72
        % 69 72
        % 70 72
        % 71 72
        profileInfo.tasks.ids = horzcat(hex2dec('7FF0'), hex2dec('7FF1'), hex2dec('7F28'), hex2dec('7F29'), hex2dec('7F2A'), hex2dec('7F2B'), hex2dec('7F2C'), hex2dec('7F2D'), hex2dec('7F2E'), hex2dec('7F2F'));
        % 73 88
        % 74 88
        % 75 88
        % 76 88
        % 77 88
        % 78 88
        % 79 88
        % 80 88
        % 81 88
        % 82 88
        % 83 88
        % 84 88
        % 85 88
        % 86 88
        % 87 88
        profileInfo.timer.timePerTickUnits = 1e-09;
        % 89 92
        % 90 92
        % 91 92
        profileInfo.processor.wordsize = 2.0;
        % 93 96
        % 94 96
        % 95 96
        profileInfo.processor.lsbFirst = 1.0;
        % 97 98
        profData = exprofile_process_data(rawdata, profileInfo);
        % 99 100
    end % if
end % function
