function Value = getValue(hReader, InputValue)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if ischar(InputValue)
        % 9 10
        if strcmp(InputValue(end), '''')
            % 11 13
            % 12 13
            InputValue = horzcat('''', InputValue);
        end % if
        % 15 17
        % 16 17
        try
            Value = eval(InputValue);
        catch
            Value = [];
            warning('The Excel value could not be properly converted');
        end % try
    else
        % 24 25
        Value = InputValue;
        % 26 27
    end % if
    % 28 64
    % 29 64
    % 30 64
    % 31 64
    % 32 64
    % 33 64
    % 34 64
    % 35 64
    % 36 64
    % 37 64
    % 38 64
    % 39 64
    % 40 64
    % 41 64
    % 42 64
    % 43 64
    % 44 64
    % 45 64
    % 46 64
    % 47 64
    % 48 64
    % 49 64
    % 50 64
    % 51 64
    % 52 64
    % 53 64
    % 54 64
    % 55 64
    % 56 64
    % 57 64
    % 58 64
    % 59 64
    % 60 64
    % 61 64
    % 62 64
    % 63 64
end % function
