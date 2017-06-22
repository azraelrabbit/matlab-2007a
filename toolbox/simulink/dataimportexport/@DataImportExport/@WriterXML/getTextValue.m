function TextValue = getTextValue(hWriter, hNode)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    Value = hNode.Value;
    Value = transpose(Value(:));
    % 9 12
    % 10 12
    switch hNode.FunctionalType
    case 'char'
        % 13 15
        TextValue = sprintf('%04X ', double(Value));
        TextValue = TextValue(1.0:minus(end, 1.0));
    case 'numeric'
        % 17 20
        % 18 20
        switch hNode.Class
        case 'double'
            % 21 23
            TextFormat = '%0.17g ';
            ImagTextFormat = '%0.17g%+0.17gi, ';
        case 'single'
            % 25 28
            % 26 28
            TextFormat = '%0.9g ';
            ImagTextFormat = '%0.9g%+0.9gi, ';
        case {'int8','int16','int32'}
            % 30 33
            % 31 33
            TextFormat = '%d ';
            ImagTextFormat = '%d%+di, ';
        case {'uint8','uint16','uint32'}
            % 35 38
            % 36 38
            TextFormat = '%u ';
            ImagTextFormat = '%d+%di, ';
        case 'int64'
            % 40 43
            % 41 43
            TextFormat = '%0.20g ';
            ImagTextFormat = '%0.20g%+0.20gi, ';
        case 'uint64'
            % 45 48
            % 46 48
            TextFormat = '%0.20g ';
            ImagTextFormat = '%0.20g+%0.20gi, ';
        otherwise
            % 50 52
            error('unknown text value error')
        end % switch
        % 53 56
        % 54 56
        if isreal(Value)
            % 56 58
            TextValue = sprintf(TextFormat, Value);
            % 58 61
            % 59 61
            TextValue = TextValue(1.0:minus(end, 1.0));
        else
            % 62 65
            % 63 65
            ComplexValue = vertcat(real(Value), imag(Value));
            ComplexValue = ComplexValue(:);
            % 66 69
            % 67 69
            TextValue = sprintf(ImagTextFormat, ComplexValue);
            % 69 72
            % 70 72
            TextValue = TextValue(1.0:minus(end, 2.0));
        end % if
    case 'logical'
        % 74 77
        % 75 77
        TextValue = sprintf('%d ', Value);
        TextValue = TextValue(1.0:minus(end, 1.0));
    otherwise
        % 79 81
        TextValue = '';
    end % switch
    % 82 84
