function Value = getValue(hReader, Class, FunctionalType, TextValue)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    switch FunctionalType
    case 'char'
        % 10 11
        try
            Value = ctranspose(sscanf(TextValue, '%04X '));
        catch
            Value = [];
            warning('The character value could not be properly converted');
        end % try
        % 17 19
        % 18 19
        Value = char(Value);
    case 'numeric'
        % 21 23
        % 22 23
        try
            Value = eval(horzcat('[', TextValue, ']'));
        catch
            Value = [];
            warning('The numeric value could not be properly converted');
        end % try
        % 29 31
        % 30 31
        Value = eval(horzcat(Class, '(Value)'));
    case 'logical'
        % 33 35
        % 34 35
        try
            Value = ctranspose(sscanf(TextValue, '%d '));
        catch
            Value = [];
            warning('The logical value could not be properly converted');
        end % try
        % 41 43
        % 42 43
        Value = logical(Value);
    otherwise
        % 45 46
        Value = [];
        warning('An unexpected type could not be properly converted');
        % 48 49
    end % switch
    % 50 51
end % function
