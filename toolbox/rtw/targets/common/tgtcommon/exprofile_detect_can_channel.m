function channel = exprofile_detect_can_channel
    % 1 21
    % 2 21
    % 3 21
    % 4 21
    % 5 21
    % 6 21
    % 7 21
    % 8 21
    % 9 21
    % 10 21
    % 11 21
    % 12 21
    % 13 21
    % 14 21
    % 15 21
    % 16 21
    % 17 21
    % 18 21
    % 19 21
    % 20 21
    channels_to_try = [7.0 3.0];
    % 22 23
    for i=1.0:length(channels_to_try)
        channel = channels_to_try(i);
        disp(' ')
        disp(horzcat('Testing channel ', num2str(channel), ':'))
        err = vector_can_interface('validatechannel', channel);
        if eq(err, 0.0)
            [err, channelName] = vector_can_interface('getchannelname', channel);
            disp(horzcat('CAN channel ', num2str(channel), ' (', channelName, ') OK.'))
            break
        else
            channel = [];
        end % if
    end % for
    % 36 37
    if isempty(channel)
        % 38 39
        err = vector_can_interface('listchannels');
        % 40 41
        disp('Attempted to use one of channels')
        disp(channels_to_try)
        % 43 45
        % 44 45
        error('None of the channels that were checked could be validated. It may be that no channel is available. You must check that your CAN hardware is correctly installed');
        % 46 48
        % 47 48
    end % if
end % function
