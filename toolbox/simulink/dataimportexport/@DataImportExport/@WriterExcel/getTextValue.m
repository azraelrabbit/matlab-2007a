function TextValue = getTextValue(hWriter, hNode)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    if strcmp(hNode.ArrayType, 'Unsupported')
        % 10 12
        TextValue = hNode.Value;
    else
        % 13 16
        % 14 16
        Value = hNode.Value;
        % 16 19
        % 17 19
        switch hNode.FunctionalType
        case 'char'
            % 20 40
            % 21 40
            % 22 40
            % 23 40
            % 24 40
            % 25 40
            % 26 40
            % 27 40
            % 28 40
            % 29 40
            % 30 40
            % 31 40
            % 32 40
            % 33 40
            % 34 40
            % 35 40
            % 36 40
            % 37 40
            % 38 40
            if isempty(Value)
                TextValue = '''''';
            else
                if isequal(hNode.Dimensions(1.0), 1.0) && isvector(Value)
                    % 43 46
                    % 44 46
                    TextValue = strrep(Value, '''', '''''');
                    % 46 49
                    % 47 49
                    TextValue = horzcat('''', TextValue, '''');
                else
                    % 50 55
                    % 51 55
                    % 52 55
                    % 53 55
                    CharTemp = strrep(cellstr(Value), '''', '''''');
                    CharTemp = strcat('''', CharTemp, ''';');
                    CharTemp = strcat(CharTemp{:});
                    TextValue = horzcat('[', CharTemp(1.0:minus(end, 1.0)), ']');
                end
            end
        case 'numeric'
            % 61 63
            switch hNode.Class
            case 'double'
                % 64 66
                PRECISION_DIGITS = 17.0;
            case 'single'
                % 67 70
                % 68 70
                PRECISION_DIGITS = 9.0;
            case {'int8','int16','int32'}
                % 71 74
                % 72 74
                PRECISION_DIGITS = 20.0;
            case {'uint8','uint16','uint32'}
                % 75 78
                % 76 78
                PRECISION_DIGITS = 20.0;
            case 'int64'
                % 79 82
                % 80 82
                PRECISION_DIGITS = 20.0;
            case 'uint64'
                % 83 86
                % 84 86
                PRECISION_DIGITS = 20.0;
            otherwise
                % 87 89
                error('unknown text value error')
            end
            % 90 93
            % 91 93
            TextValue = mat2str(Value, PRECISION_DIGITS);
            % 93 96
            % 94 96
            if strcmp(hNode.Class, 'double')
            else
                % 97 100
                % 98 100
                % 99 102
                % 100 102
                TextValue = horzcat(hNode.Class, '(', TextValue, ')');
            end
        case 'logical'
            % 104 109
            % 105 109
            % 106 109
            % 107 109
            TextValue = horzcat(hNode.Class, '(', mat2str(Value), ')');
        otherwise
            % 110 112
            TextValue = '';
        end
    end
    % 114 116
end
