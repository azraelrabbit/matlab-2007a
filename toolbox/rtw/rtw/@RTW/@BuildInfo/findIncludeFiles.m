function findIncludeFiles(h, varargin)
    % 1 38
    % 2 38
    % 3 38
    % 4 38
    % 5 38
    % 6 38
    % 7 38
    % 8 38
    % 9 38
    % 10 38
    % 11 38
    % 12 38
    % 13 38
    % 14 38
    % 15 38
    % 16 38
    % 17 38
    % 18 38
    % 19 38
    % 20 38
    % 21 38
    % 22 38
    % 23 38
    % 24 38
    % 25 38
    % 26 38
    % 27 38
    % 28 38
    % 29 38
    % 30 38
    % 31 38
    % 32 38
    % 33 38
    % 34 38
    % 35 38
    % 36 38
    if gt(nargin, 1.0)
        % 38 42
        % 39 42
        % 40 42
        exts = varargin{1.0}(not(cellfun(@isempty, regexp(varargin{1.0}, '^\*\.[*\w]+$', 'ONCE'))));
    else
        % 43 45
        exts = {'*.h'};
    end % if
    % 46 48
    if isempty(exts)
        exts = {'*.h'};
    end % if
    % 50 53
    % 51 53
    paths = h.getSourcePaths(true);
    paths = horzcat(paths, h.getIncludePaths(true));
    % 54 57
    % 55 57
    for i=1.0:length(paths)
        for j=1.0:length(exts)
            incFiles = dir(fullfile(paths{i}, exts{j}));
            % 59 62
            % 60 62
            incNames = cellhorzcat(incFiles(:).name);
            % 62 65
            % 63 65
            h.addIncludeFiles(incNames, paths{i}, 'Automatic');
        end % for
    end % for
    % 67 69
    for i=1.0:length(h.LinkObj)
        h.LinkObj(i).findIncludeFiles(exts);
    end % for
end % function
