function fileName = findFile(fileName, varargin)
    % 1 15
    % 2 15
    % 3 15
    % 4 15
    % 5 15
    % 6 15
    % 7 15
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    logicalFound = cellfun('islogical', varargin);
    if any(logicalFound)
        theoreticalName = varargin{find(logicalFound)};
        varargin = varargin(not(logicalFound));
    else
        theoreticalName = false;
    end % if
    % 21 23
    if isempty(fileName)
        return;
    end % if
    % 25 27
    [fPath, fFile, fExt] = fileparts(fileName);
    % 27 29
    if not(isempty(fPath))
        if not(isempty(fExt))
            if exist(fileName, 'file') || theoreticalName
            else
                % 32 34
                fileName = '';
            end % if
        else
            if eq(exist(fileName, 'file'), 2.0)
            else
                % 38 40
                for i=1.0:length(varargin)
                    fileName = fullfile(fPath, horzcat(fFile, '.', varargin{i}));
                    if exist(fileName, 'file')
                        return;
                    end % if
                end % for
                % 45 47
                if theoreticalName
                    if not(isempty(varargin))
                        fileName = fullfile(pwd, horzcat(fFile, '.', varargin{1.0}));
                    else
                        fileName = fullfile(pwd, fFile);
                    end % if
                else
                    fileName = '';
                end % if
            end % if
        end % if
    else
        if isempty(fExt)
            for i=1.0:length(varargin)
                fileName = which(horzcat(fFile, '.', varargin{i}));
                if not(isempty(fileName))
                    return;
                end % if
            end % for
            if theoreticalName
                if not(isempty(varargin))
                    fileName = fullfile(pwd, horzcat(fFile, '.', varargin{1.0}));
                else
                    fileName = fullfile(pwd, fFile);
                end % if
            end % if
        else
            foundName = which(fileName);
            if not(isempty(foundName))
                fileName = foundName;
            else
                if theoreticalName
                    fileName = fullfile(pwd, fileName);
                else
                    fileName = '';
                end % if
            end % if
        end % if
    end % if
end % function
