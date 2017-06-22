function profData = exprofile_getdata_can(chan, first_data_timeout)
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
    command_id = hex2dec('1FFFFF00');
    command_xtd = 1.0;
    data_id_std = [];
    data_id_xtd = hex2dec('1FFFFF01');
    % 18 20
    % 19 20
    t = regexp(chan, 'MATLAB ([1-9][0-9]*)', 'tokens');
    if isempty(t)
        error(horzcat(num2str(chan), ' is not recognized as a valid CAN channel ', 'for use with MATLAB. The CAN Channel should be specified ', 'as a string ''MATLAB 1'', ''MATLAB 2'' etc. Please make sure the ', 'function arguments are correct.'))
        % 23 26
        % 24 26
        % 25 26
    end % if
    chNum = str2num(t{1.0}{1.0});
    chNum = minus(chNum, 1.0);
    % 29 31
    % 30 31
    import('com.mathworks.toolbox.ecoder.canlib.vector.*');
    % 32 34
    % 33 34
    channel = VectorChannel(chNum);
    % 35 37
    % 36 37
    try
        masterPort = channel.createMasterPort('exprofile_master');
    catch
        error('Failed to open a CAN connection. This error may occur if the Vector CAN Programming API (vcand32.dll) could not be found on the Windows path. You should add the directory containing vcand32.dll to your PATH environment variable.');
        % 41 44
        % 42 44
        % 43 44
    end % try
    % 45 46
    readPort = channel.createReadPort(masterPort, data_id_std, data_id_xtd, 'data_reader');
    % 47 49
    % 48 49
    frame = CAN_FRAME.createXtd(command_id);
    command_data = 1.0;
    frame.setDATA(command_data);
    try
        masterPort.sendData(frame);
    catch
        disp(lasterror);
        i_shutdown(readPort, masterPort);
        error(horzcat('Failed to transmit start command message over CAN channel ', chan, '.'));
    end % try
    % 59 60
    disp(' ')
    disp(horzcat('Sent CAN message with identifier 0x', dec2hex(command_id), ' to request ', 'upload of execution profiling data.'));
    % 62 63
    disp(' ')
    disp(horzcat('Waiting to receive CAN message, identifier 0x', dec2hex(data_id_xtd), dec2hex(data_id_std), ', containing execution profiling ', 'data ...'))
    % 65 69
    % 66 69
    % 67 69
    % 68 69
    frame = CAN_FRAME.createXtd(1.0);
    timestamp = 0.0;
    % 71 73
    % 72 73
    rx = -1.0;
    % 74 76
    % 75 76
    tic
    ttoc = 0.0;
    % 78 79
    finished = 0.0;
    timeout = first_data_timeout;
    first_data_received = 0.0;
    profData = [];
    % 83 84
        while lt(ttoc, timeout)
        % 85 86
        if ge(rx, 0.0)
            if eq(first_data_received, 0.0)
                first_data_received = 1.0;
                disp(' ')
                disp('Received first CAN message with execution profiling data.')
                disp(' ')
                disp('Uploading data, please wait ...')
                disp(' ')
            end % if
            timeout = plus(ttoc, 4.0);
            profData = vertcat(profData, double(data));
        end % if
        % 98 99
        try
            % 100 101
            rx = readPort.readData(frame, timestamp);
            data = frame.getDATA;
        catch
            disp(lasterror);
            i_shutdown(readPort, masterPort);
            error('Error receiving CAN messsage.');
        end % try
        % 108 110
        % 109 110
        newtoc = toc;
        if gt(newtoc, 8e+09)
            for i=1.0:1e+07
                newtoc = toc;
                if lt(newtoc, 8e+09)
                    break
                end % if
            end % for
        end % if
        ttoc = plus(ttoc, newtoc);
        tic
        % 121 122
    end % while
    % 123 124
    i_shutdown(readPort, masterPort);
    % 125 126
    if isempty(profData)
        disp(sprintf('Timeout occurred. No execution profiling data was received from the target. You should check the following:\n\n   1. The CAN port on the target is connected to the CAN port on the host machine.\n   2. The application on the target is running.\n   3. The application on the target is properly configured to provide execution profiling data.\n   4. The application on the target and the host CAN channel are configured to use the same bit rate. To check the bit rate on the target, you must inspect your model and review the settings for the CAN channel used by execution profiling. To check the bit rate on the host, you must run the Vector Informatik configuration utility and inspect the Baudrate settings for the Application Channel used by this execution profiling command; to run this utility, type vcanconf from a Windows command prompt.  \n\nIf you are performing execution profiling over a long period of time it may be necessary to increase the timeout value.'));
        % 128 146
        % 129 146
        % 130 146
        % 131 146
        % 132 146
        % 133 146
        % 134 146
        % 135 146
        % 136 146
        % 137 146
        % 138 146
        % 139 146
        % 140 146
        % 141 146
        % 142 146
        % 143 146
        % 144 146
        % 145 146
    end % if
    % 147 149
    % 148 149
    profData = ctranspose(profData);
    profData = profData(:);
end % function
function i_shutdown(readPort, masterPort)
    % 153 154
    if not(isempty(readPort))
        readPort.ShutdownPort;
    end % if
    if not(isempty(masterPort))
        masterPort.ShutdownPort;
    end % if
end % function
