function ret = getPaths(h, type, replaceMatlabroot, varargin)
    % 1 29
    % 2 29
    % 3 29
    % 4 29
    % 5 29
    % 6 29
    % 7 29
    % 8 29
    % 9 29
    % 10 29
    % 11 29
    % 12 29
    % 13 29
    % 14 29
    % 15 29
    % 16 29
    % 17 29
    % 18 29
    % 19 29
    % 20 29
    % 21 29
    % 22 29
    % 23 29
    % 24 29
    % 25 29
    % 26 29
    % 27 29
    % 28 29
    [argsOK, typeIdx, repMLR, incGroups, excGroups] = locCheckArgs(type, replaceMatlabroot, varargin{:});
    % 30 31
    if not(argsOK)
        DAStudio.error('RTW:buildInfo:badMethodArguments', 'RTW.BuildInfoBuildObj.getPaths');
        % 33 34
    end % if
    % 35 36
    ret = {};
    % 37 38
    paths = {};
    pathGroups = {};
    % 40 42
    % 41 42
    if ismember(typeIdx, [1.0 3.0])
        paths = vertcat(paths, get(h.Inc.Paths, 'Value'));
        pathGroups = vertcat(pathGroups, get(h.Inc.Paths, 'Group'));
    end % if
    % 46 48
    % 47 48
    if ismember(typeIdx, [2.0 3.0])
        paths = vertcat(paths, get(h.Src.Paths, 'Value'));
        pathGroups = vertcat(pathGroups, get(h.Src.Paths, 'Group'));
    end % if
    % 52 54
    % 53 54
    includeIdx = [];
    if not(isempty(incGroups))
        % 56 57
        for i=1.0:length(incGroups)
            includeIdx = vertcat(includeIdx, find(eq(strcmp(pathGroups, incGroups{i}), 1.0)));
        end % for
    else
        includeIdx = 1.0:length(paths);
    end % if
    % 63 65
    % 64 65
    excludeIdx = [];
    if not(isempty(excGroups))
        % 67 68
        for i=1.0:length(excGroups)
            excludeIdx = vertcat(excludeIdx, find(eq(strcmp(pathGroups, excGroups{i}), 1.0)));
        end % for
    end % if
    % 72 74
    % 73 74
    excludeIdx = sort(excludeIdx);
    % 75 78
    % 76 78
    % 77 78
    [includeIdx, not_used] = setdiff(includeIdx, excludeIdx);
    % 79 81
    % 80 81
    if isempty(includeIdx)
        return;
    end % if
    paths = paths(includeIdx);
    % 85 87
    % 86 87
    if repMLR
        ret = ctranspose(strrep(paths, '$(MATLAB_ROOT)', h.Settings.Matlabroot));
    else
        ret = ctranspose(paths);
    end % if
    % 92 94
    % 93 94
    if not(iscell(ret))
        ret = cellhorzcat(ret);
    end % if
end % function
function [argsOK, typeIdx, repMLR, incGroups, excGroups] = locCheckArgs(type, replaceMatlabroot, varargin)
    % 99 102
    % 100 102
    % 101 102
    argsOK = true;
    incGroups = {};
    excGroups = {};
    % 105 107
    % 106 107
    [tf, typeIdx] = ismember(type, {'include','source','all'});
    if ne(tf, true)
        argsOK = false;
        return;
    end % if
    % 112 115
    % 113 115
    % 114 115
    repMLR = ne(replaceMatlabroot, 0.0);
    % 116 117
    nargs = length(varargin);
    % 118 122
    % 119 122
    % 120 122
    % 121 122
    if ge(nargs, 1.0)
        if not(iscellstr(varargin{1.0}))
            if not(ischar(varargin{1.0}))
                % 125 126
                argsOK = false;
                return;
            end % if
            % 129 130
            if not(isempty(varargin{1.0}))
                incGroups = cellhorzcat(varargin{1.0});
            end % if
        else
            % 134 135
            incGroups = unique(varargin{1.0});
        end % if
    end % if
    % 138 140
    % 139 140
    if ge(nargs, 2.0)
        if not(iscellstr(varargin{2.0}))
            if not(ischar(varargin{2.0}))
                % 143 144
                argsOK = false;
                return;
            end % if
            % 147 148
            if not(isempty(varargin{2.0}))
                excGroups = cellhorzcat(varargin{2.0});
            end % if
        else
            % 152 153
            excGroups = unique(varargin{2.0});
        end % if
    end % if
end % function
