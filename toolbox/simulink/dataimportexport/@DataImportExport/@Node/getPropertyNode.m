function hPropNode = getPropertyNode(hNode, PropertyStrings)
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
    hPropNode = [];
    % 13 16
    % 14 16
    hCurrentNode = hNode;
    % 16 19
    % 17 19
    NumPropertyStrings = length(PropertyStrings);
    % 19 22
    % 20 22
    ContinueProcessing = true;
    PropertyCounter = 1.0;
    % 23 26
    % 24 26
        while ContinueProcessing
        % 26 28
        switch hCurrentNode.ArrayType
        case 'Children'
            % 29 31
            PropertyNames = cellstr(get(hCurrentNode.Children, 'Name'));
            % 31 34
            % 32 34
            PropertyIndex = find(strcmp(PropertyStrings{PropertyCounter}, PropertyNames));
            % 34 38
            % 35 38
            % 36 38
            if not(isempty(PropertyIndex))
                % 38 40
                hCurrentNode = hCurrentNode.Children(PropertyIndex);
            else
                % 41 44
                % 42 44
                hCurrentNode = [];
            end % if
            % 45 48
            % 46 48
            PropertyCounter = plus(PropertyCounter, 1.0);
        case 'Reference'
            % 49 55
            % 50 55
            % 51 55
            % 52 55
            % 53 55
            hCurrentNode = hCurrentNode.SourceChild;
        case 'Value'
            % 56 59
            % 57 59
            hCurrentNode = [];
            % 59 62
            % 60 62
            PropertyCounter = plus(PropertyCounter, 1.0);
        otherwise
            % 63 66
            % 64 66
            hCurrentNode = [];
            % 66 69
            % 67 69
            PropertyCounter = plus(PropertyCounter, 1.0);
        end % switch
        % 70 73
        % 71 73
        if gt(PropertyCounter, NumPropertyStrings)
            % 73 75
            hPropNode = hCurrentNode;
            % 75 78
            % 76 78
            ContinueProcessing = false;
        else
            % 79 82
            % 80 82
            ContinueProcessing = not(isempty(hCurrentNode));
        end % if
    end % while
    % 84 86
