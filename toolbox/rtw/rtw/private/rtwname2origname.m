function origName = rtwname2origname(rtwName, isRTWName, varargin)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    persistent systemMap;
    persistent sourceSystem;
    persistent firstTime;
    % 12 14
    origName = '';
    % 14 17
    % 15 17
    if gt(nargin, 2.0)
        firstTime = '';
    end
    % 19 22
    % 20 22
    if isempty(firstTime)
        sourceSystem = rtwattic('getSourceSubsystemName');
        systemMap = rtwattic('getSystemMap');
        firstTime = 0.0;
    end
    % 26 28
    if not(isempty(rtwName))
        % 28 32
        % 29 32
        % 30 32
        sep = findTrueSep(rtwName);
        % 32 34
        if not(isRTWName)
            if not(isempty(sep))
                name = rtwName(plus(sep(end), 1.0):end);
                path = rtwName(1.0:minus(sep(end), 1.0));
            else
                path = rtwName;
                name = '';
            end
            % 41 46
            % 42 46
            % 43 46
            % 44 46
            if not(isempty(sourceSystem))
                % 46 50
                % 47 50
                % 48 50
                sep = findTrueSep(path);
                if not(isempty(sep)) && gt(length(sep), 1.0)
                    path = horzcat(sourceSystem, path(sep(2.0):end));
                else
                    path = sourceSystem;
                end
            end
        else
            % 57 59
            if not(isempty(sep))
                name = rtwName(plus(sep(1.0), 1.0):end);
                path = rtwName(1.0:minus(sep(1.0), 1.0));
            else
                % 62 64
                path = rtwName;
                name = '';
            end
            % 66 71
            % 67 71
            % 68 71
            % 69 71
            sysNum = sscanf(path, '<S%d>');
            if isempty(sysNum)
                path = get_param(path, 'Name');
            else
                if isempty(systemMap)
                    % 75 78
                    % 76 78
                    path = getfullname(path);
                else
                    path = systemMap{sysNum};
                end
            end
            % 82 87
            % 83 87
            % 84 87
            % 85 87
            if not(isempty(sourceSystem))
                % 87 91
                % 88 91
                % 89 91
                sep = findTrueSep(path);
                if not(isempty(sep)) && gt(length(sep), 1.0)
                    path = horzcat(sourceSystem, path(sep(2.0):end));
                else
                    path = sourceSystem;
                end
            end
        end
    end
    % 99 101
    if isempty(name)
        origName = path;
    else
        origName = horzcat(path, '/', name);
    end
    if not(isempty(sourceSystem)) && strncmp(rtwName, '<Root>', length('<Root>'))
        % 106 109
        % 107 109
        origName = '';
    end
end
function sep = findTrueSep(inStr)
    % 112 118
    % 113 118
    % 114 118
    % 115 118
    % 116 118
    tmpSep = findstr('/', inStr);
    % 118 120
    if ge(length(tmpSep), 2.0)
        index = ones(1.0, length(tmpSep));
        % 121 123
        i = 1.0;
        while lt(i, length(tmpSep))
            if eq(tmpSep(plus(i, 1.0)), plus(tmpSep(i), 1.0))
                index(i) = 0.0;
                index(plus(i, 1.0)) = 0.0;
                i = plus(i, 2.0);
            else
                i = plus(i, 1.0);
            end
        end % while
        % 132 134
        sep = tmpSep(find(ne(index, 0.0)));
    else
        % 135 137
        sep = tmpSep;
    end
end
