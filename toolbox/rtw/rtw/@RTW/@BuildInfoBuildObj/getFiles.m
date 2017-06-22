function ret = getFiles(h, type, concatenatePaths, replaceMatlabroot, varargin)
    % 1 33
    % 2 33
    % 3 33
    % 4 33
    % 5 33
    % 6 33
    % 7 33
    % 8 33
    % 9 33
    % 10 33
    % 11 33
    % 12 33
    % 13 33
    % 14 33
    % 15 33
    % 16 33
    % 17 33
    % 18 33
    % 19 33
    % 20 33
    % 21 33
    % 22 33
    % 23 33
    % 24 33
    % 25 33
    % 26 33
    % 27 33
    % 28 33
    % 29 33
    % 30 33
    % 31 33
    % 32 33
    [argsOK, typeIdx, concatPaths, repMLR, incGroups, excGroups] = locCheckArgs(type, concatenatePaths, replaceMatlabroot, varargin{:});
    % 34 35
    if not(argsOK)
        DAStudio.error('RTW:buildInfo:badMethodArguments', 'RTW.BuildInfoBuildObj.getFiles');
        % 37 38
    end % if
    % 39 40
    ret = {};
    % 41 42
    fileNames = {};
    filePaths = {};
    fileGroups = {};
    % 45 47
    % 46 47
    if ismember(typeIdx, [1.0 3.0])
        fileNames = vertcat(fileNames, get(h.Inc.Files, 'FileName'));
        filePaths = vertcat(filePaths, get(h.Inc.Files, 'Path'));
        fileGroups = vertcat(fileGroups, get(h.Inc.Files, 'Group'));
    end % if
    % 52 54
    % 53 54
    if ismember(typeIdx, [2.0 3.0])
        fileNames = vertcat(fileNames, get(h.Src.Files, 'FileName'));
        filePaths = vertcat(filePaths, get(h.Src.Files, 'Path'));
        fileGroups = vertcat(fileGroups, get(h.Src.Files, 'Group'));
    end % if
    % 59 61
    % 60 61
    includeIdx = [];
    if not(isempty(incGroups))
        % 63 64
        for i=1.0:length(incGroups)
            includeIdx = vertcat(includeIdx, find(eq(strcmp(fileGroups, incGroups{i}), 1.0)));
        end % for
    else
        includeIdx = 1.0:length(fileNames);
    end % if
    % 70 72
    % 71 72
    excludeIdx = [];
    if not(isempty(excGroups))
        % 74 75
        for i=1.0:length(excGroups)
            excludeIdx = vertcat(excludeIdx, find(eq(strcmp(fileGroups, excGroups{i}), 1.0)));
        end % for
    end % if
    % 79 81
    % 80 81
    excludeIdx = sort(excludeIdx);
    % 82 85
    % 83 85
    % 84 85
    [includeIdx, not_used] = setdiff(includeIdx, excludeIdx);
    % 86 88
    % 87 88
    if isempty(includeIdx)
        return;
    end % if
    fileNames = fileNames(includeIdx);
    % 92 94
    % 93 94
    if concatPaths
        filePaths = filePaths(includeIdx);
        % 96 98
        % 97 98
        if repMLR
            filePaths = strrep(filePaths, '$(MATLAB_ROOT)', h.Settings.Matlabroot);
        end % if
        % 101 102
        ret = ctranspose(strcat(filePaths, h.Settings.FileSep, fileNames));
    else
        ret = ctranspose(fileNames);
    end % if
    % 106 107
    if not(iscell(ret))
        ret = cellhorzcat(ret);
    end % if
end % function
function [argsOK, typeIdx, concatPaths, repMLR, incGroups, excGroups] = locCheckArgs(type, concatenatePaths, replaceMatlabroot, varargin)
    % 112 115
    % 113 115
    % 114 115
    argsOK = true;
    incGroups = {};
    excGroups = {};
    % 118 120
    % 119 120
    [tf, typeIdx] = ismember(type, {'include','source','all'});
    if ne(tf, true)
        argsOK = false;
        return;
    end % if
    % 125 128
    % 126 128
    % 127 128
    concatPaths = ne(concatenatePaths, 0.0);
    repMLR = ne(replaceMatlabroot, 0.0);
    % 130 131
    nargs = length(varargin);
    % 132 136
    % 133 136
    % 134 136
    % 135 136
    if ge(nargs, 1.0)
        if not(iscellstr(varargin{1.0}))
            if not(ischar(varargin{1.0}))
                % 139 140
                argsOK = false;
                return;
            end % if
            % 143 144
            if not(isempty(varargin{1.0}))
                incGroups = cellhorzcat(varargin{1.0});
            end % if
        else
            % 148 149
            incGroups = unique(varargin{1.0});
        end % if
    end % if
    % 152 154
    % 153 154
    if ge(nargs, 2.0)
        if not(iscellstr(varargin{2.0}))
            if not(ischar(varargin{2.0}))
                % 157 158
                argsOK = false;
                return;
            end % if
            % 161 162
            if not(isempty(varargin{2.0}))
                excGroups = cellhorzcat(varargin{2.0});
            end % if
        else
            % 166 167
            excGroups = unique(varargin{2.0});
        end % if
    end % if
end % function
