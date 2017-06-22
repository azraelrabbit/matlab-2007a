function output = transformPaths(input, varargin)
    % 1 54
    % 2 54
    % 3 54
    % 4 54
    % 5 54
    % 6 54
    % 7 54
    % 8 54
    % 9 54
    % 10 54
    % 11 54
    % 12 54
    % 13 54
    % 14 54
    % 15 54
    % 16 54
    % 17 54
    % 18 54
    % 19 54
    % 20 54
    % 21 54
    % 22 54
    % 23 54
    % 24 54
    % 25 54
    % 26 54
    % 27 54
    % 28 54
    % 29 54
    % 30 54
    % 31 54
    % 32 54
    % 33 54
    % 34 54
    % 35 54
    % 36 54
    % 37 54
    % 38 54
    % 39 54
    % 40 54
    % 41 54
    % 42 54
    % 43 54
    % 44 54
    % 45 54
    % 46 54
    % 47 54
    % 48 54
    % 49 54
    % 50 54
    % 51 54
    % 52 54
    [argsOK, inputCell, altPaths, ignoreErrors] = locCheckArgs(input, varargin{:});
    % 54 56
    if not(argsOK)
        DAStudio.error('RTW:utility:invalidInputArgs', 'RTW.transformPath');
    end % if
    % 58 61
    % 59 61
    if not(ispc)
        if altPaths
            % 62 66
            % 63 66
            % 64 66
            output = strrep(input, ' ', '\ ');
        else
            % 67 71
            % 68 71
            % 69 71
            output = strrep(input, '\ ', ' ');
        end % if
        return;
    end % if
    % 74 78
    % 75 78
    % 76 78
    output = inputCell;
    uniqueInput = unique(inputCell);
    % 79 81
    uniqueOutput = getPathName(uniqueInput, altPaths, ignoreErrors);
    % 81 83
    for i=1.0:length(uniqueInput)
        pathIdx = strcmp(inputCell, uniqueInput{i});
        output(pathIdx) = uniqueOutput(i);
    end % for
    % 86 91
    % 87 91
    % 88 91
    % 89 91
    if ischar(input)
        output = output{1.0};
    end % if
function [argsOK, inputCell, altPath, ignoreErrors] = locCheckArgs(input, varargin)
    % 94 106
    % 95 106
    % 96 106
    % 97 106
    % 98 106
    % 99 106
    % 100 106
    % 101 106
    % 102 106
    % 103 106
    % 104 106
    argsOK = true;
    inputCell = input;
    altPath = true;
    ignoreErrors = false;
    % 109 112
    % 110 112
    if not(iscellstr(input))
        if ischar(input)
            inputCell = cellhorzcat(input);
        else
            argsOK = false;
            return;
        end % if
    end % if
    % 119 123
    % 120 123
    % 121 123
    if lt(nargin, 2.0)
        return;
    end % if
    % 125 129
    % 126 129
    % 127 129
    if ne(mrdivide(length(varargin), 2.0), floor(mrdivide(length(varargin), 2.0)))
        argsOK = false;
        return;
    end % if
    % 132 134
    validPathTypeVals = {'full','alternate'};
    for i=1.0:2.0:minus(length(varargin), 1.0)
        switch varargin{i}
        case 'pathType'
            if not(ismember(varargin{plus(i, 1.0)}, validPathTypeVals))
                argsOK = false;
                return;
            end % if
            altPath = eq(strcmp(varargin{plus(i, 1.0)}, 'alt'), 1.0);
        case 'ignoreErrors'
            if not(islogical(varargin{plus(i, 1.0)}))
                argsOK = false;
                return;
            end % if
            ignoreErrors = varargin{plus(i, 1.0)};
        otherwise
            DAStudio.error('RTW:utility:unknownProperty', varargin{i});
        end % switch
    end % for
