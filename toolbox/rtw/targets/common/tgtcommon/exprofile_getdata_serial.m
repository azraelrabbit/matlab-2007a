function profile_data = exprofile_getdata_serial(port, bitrate, first_data_timeout)
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
    startbyte = 201.0;
    % 14 15
    ser = serial(port, 'BaudRate', bitrate);
    try
        fopen(ser);
    catch
        localBailout(ser, sprintf(horzcat('Failed to validate port ', port, '. It may be ', 'that this serial port is not available or locked by another ', 'program. Error returned:\n', lasterr)));
        % 20 23
        % 21 23
        % 22 23
    end % try
    % 24 26
    % 25 26
    try
        fwrite(ser, startbyte, 'uint8');
    catch
        localBailout(ser, sprintf(horzcat('Failed to transmit start byte over port ', port, '. Error returned:\n', lasterr)));
        % 30 31
    end % try
    % 32 33
    disp(' ')
    disp(horzcat('Sent start byte with value ', num2str(startbyte), ' via ', port, '\n', 'to request upload of execution profiling data.'));
    % 35 36
    disp(' ')
    disp('Waiting to receive execution profiling data ...')
    % 38 40
    % 39 40
    try
        [data, count, msg] = fread(ser, 8.0, 'uint8');
        data = ctranspose(data);
    catch
        localBailout(ser, sprintf(horzcat('Error while receiving start of execution ', 'profiling data:\n', lasterr)));
        % 45 46
    end % try
    if eq(count, 0.0)
        msg = localIncompleteDataMsg;
        localBailout(ser, msg);
    end % if
    % 51 52
    disp(' ')
    disp('Received start of execution profiling data.')
    disp(' ')
    disp('Uploading data, please wait ...')
    disp(' ')
    % 57 59
    % 58 59
    tic
    ttoc = 0.0;
    % 61 63
    % 62 63
    finished = 0.0;
    timeout = first_data_timeout;
    first_data_received = 0.0;
    profile_data = [];
    % 67 68
        while lt(ttoc, timeout)
        % 69 70
        timeout = plus(ttoc, 4.0);
        % 71 72
        profile_data = vertcat(profile_data, data);
        % 73 74
        try
            [data, count, msg] = fread(ser, 8.0, 'uint8');
            data = ctranspose(data);
        catch
            localBailout(ser, sprintf(horzcat('Error while receiving execution ', 'profiling data:\n', lasterr)));
            % 79 80
        end % try
        % 81 83
        % 82 83
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
        % 94 95
    end % while
    % 96 97
    try
        fclose(ser);
    catch
        localBailout(ser, horzcat('Error closing serial port ', port, ': ', lasterr));
    end % try
    % 102 104
    % 103 104
    profile_data = ctranspose(profile_data);
    profile_data = profile_data(:);
end % function
function msg = localIncompleteDataMsg
    % 108 110
    % 109 110
    msg = sprintf('Timeout occurred. No execution profiling data was received from\nthe target. You should check the following:\n\n   1. The serial port on the target is connected to the serial\n      port on the host machine.\n   2. The application on the target is running.\n   3. The target and host serial ports must both be configured\n      for the same bit rate. The host-side default bit-rate\n      is 57600. The target-side bit-rate is typically established\n      via the serial settings within the Resource Configuration block.\n   4. The application on the target is properly configured to\n      provide execution profiling data.\n \nIf you are performing execution profiling over a long period of time it may be necessary to increase the timeout value.');
    % 111 124
    % 112 124
    % 113 124
    % 114 124
    % 115 124
    % 116 124
    % 117 124
    % 118 124
    % 119 124
    % 120 124
    % 121 124
    % 122 124
    % 123 124
end % function
function localBailout(serialport, message)
    % 126 129
    % 127 129
    % 128 129
    try
        fclose(serialport);
        % 131 133
        % 132 133
    end % try
    error(message);
end % function
