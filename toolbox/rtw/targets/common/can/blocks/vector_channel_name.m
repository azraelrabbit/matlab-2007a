function channel_name = vector_channel_name(channel_param)
    % 1 16
    % 2 16
    % 3 16
    % 4 16
    % 5 16
    % 6 16
    % 7 16
    % 8 16
    % 9 16
    % 10 16
    % 11 16
    % 12 16
    % 13 16
    % 14 16
    % 15 16
    switch channel_param
    case 1.0
        channel_name = 'Virtual 1';
    case 2.0
        channel_name = 'Virtual 2';
    case 3.0
        channel_name = 'CanAc2Pci 1';
    case 4.0
        channel_name = 'CanAc2Pci 2';
    case 5.0
        channel_name = 'CanAc2 1';
    case 6.0
        channel_name = 'CanAc2 2';
    case 7.0
        channel_name = 'CanCardX 1';
    case 8.0
        channel_name = 'CanCardX 2';
    case 9.0
        channel_name = 'CanPari';
    case 10.0
        channel_name = 'None selected';
    otherwise
        error(sprintf('Invalid value for channel_param: %s', channel_param))
    end % switch
end % function
