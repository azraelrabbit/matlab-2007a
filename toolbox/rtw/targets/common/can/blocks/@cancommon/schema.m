function schema
    % 1 20
    % 2 20
    % 3 20
    % 4 20
    % 5 20
    % 6 20
    % 7 20
    % 8 20
    % 9 20
    % 10 20
    % 11 20
    % 12 20
    % 13 20
    % 14 20
    % 15 20
    % 16 20
    % 17 20
    % 18 20
    % 19 20
    schema.package('cancommon');
    % 21 23
    % 22 23
    if isempty(findtype('hardwareTypes'))
        schema.EnumType('hardwareTypes', {'Virtual 1';'Virtual 2';'CanAc2Pci 1';'CanAc2Pci 2';'CanAc2 1';'CanAc2 2';'CanCardX 1';'CanCardX 2';'CanPari';'CanCardXL 1';'CanCardXL 2'});
    else
        % 26 36
        % 27 36
        % 28 36
        % 29 36
        % 30 36
        % 31 36
        % 32 36
        % 33 36
        % 34 36
        % 35 36
        % 36 37
        warning('A type named ''hardwareTypes'' already exists.');
    end % if
    % 39 40
    if isempty(findtype('dnloadType'))
        schema.EnumType('dnloadType', {'RAM application code';'Flash application code'});
    else
        % 43 44
        % 44 45
        warning('A type named ''dnloadType'' already exists.');
    end % if
    % 47 48
    if isempty(findtype('connectiontypes'))
        schema.EnumType('connectiontypes', {'CAN';'Serial'});
    else
        % 51 52
        % 52 53
        warning('A type named ''connectiontypes'' already exists.');
    end % if
    % 55 56
    if isempty(findtype('commports'))
        schema.EnumType('commports', {'COM1';'COM2';'COM3';'COM4';'COM5';'COM6';'COM7';'COM8'});
    else
        % 59 66
        % 60 66
        % 61 66
        % 62 66
        % 63 66
        % 64 66
        % 65 66
        % 66 67
        warning('A type named ''commports'' already exists.');
    end % if
end % function
