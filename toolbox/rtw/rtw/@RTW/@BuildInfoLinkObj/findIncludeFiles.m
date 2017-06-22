function findIncludeFiles(h, varargin)
    % 1 39
    % 2 39
    % 3 39
    % 4 39
    % 5 39
    % 6 39
    % 7 39
    % 8 39
    % 9 39
    % 10 39
    % 11 39
    % 12 39
    % 13 39
    % 14 39
    % 15 39
    % 16 39
    % 17 39
    % 18 39
    % 19 39
    % 20 39
    % 21 39
    % 22 39
    % 23 39
    % 24 39
    % 25 39
    % 26 39
    % 27 39
    % 28 39
    % 29 39
    % 30 39
    % 31 39
    % 32 39
    % 33 39
    % 34 39
    % 35 39
    % 36 39
    % 37 39
    if gt(nargin, 1.0)
        % 39 43
        % 40 43
        % 41 43
        exts = varargin{1.0}(not(cellfun(@isempty, regexp(varargin{1.0}, '^\*\.[*\w]+$', 'ONCE'))));
    else
        % 44 46
        exts = {'*.h'};
    end % if
    % 47 49
    if isempty(exts)
        exts = {'*.h'};
    end % if
    % 51 54
    % 52 54
    paths = h.getSourcePaths(true);
    paths = horzcat(paths, h.getIncludePaths(true));
    % 55 58
    % 56 58
    for i=1.0:length(paths)
        for j=1.0:length(exts)
            incFiles = dir(fullfile(paths{i}, exts{j}));
            % 60 63
            % 61 63
            incNames = cellhorzcat(incFiles(:).name);
            % 63 66
            % 64 66
            h.addIncludeFiles(incNames, paths{i}, 'Automatic');
        end % for
    end % for
end % function
