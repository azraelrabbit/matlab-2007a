function addPaths(h, type, varargin)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    [argsOK, typeIdx, Paths, Groups] = locCheckArgs(h, type, varargin{:});
    if ~(argsOK)
        DAStudio.error('RTW:buildInfo:badMethodArguments', 'RTW.BuildInfoBuildObj.addPaths');
        % 12 14
    end
    % 14 18
    % 15 18
    % 16 18
    switch typeIdx
    case 1.0
        firstInsertion = isempty(h.Inc.Paths);
    case 2.0
        firstInsertion = isempty(h.Src.Paths);
    end
    if ~(firstInsertion)
        % 24 29
        % 25 29
        % 26 29
        % 27 29
        if eq(length(Paths), 1.0)
            switch typeIdx
            case 1.0
                p = h.Inc.Paths.find('Value', Paths{1.0});
            case 2.0
                p = h.Src.Paths.find('Value', Paths{1.0});
            end
            % 35 38
            % 36 38
            if ~(isempty(p))
                return
            end
        else
            switch typeIdx
            case 1.0
                cur_paths = get(h.Inc.Paths, 'Value');
            case 2.0
                cur_paths = get(h.Src.Paths, 'Value');
            end
            [tf, idx] = setdiff(Paths, cur_paths);
            if ~(isempty(tf))
                % 49 52
                % 50 52
                idx = sort(idx);
            end
            % 53 55
            Paths = Paths(idx);
            Groups = Groups(idx);
        end
    end
    % 58 61
    % 59 61
    if isempty(Paths)
        return
    end
    % 63 65
    cnt = length(Paths);
    % 65 67
    for i=cnt:-1.0:1.0
        % 67 69
        newPath(i) = RTW.BuildInfoString(Paths{i}, Groups{i}, horzcat(type, ' path'), h.Settings);
        % 69 71
    end % for
    % 71 75
    % 72 75
    % 73 75
    switch typeIdx
    case 1.0
        h.Inc.Paths = vertcat(horzcat(h.Inc.Paths), ctranspose(newPath));
    case 2.0
        h.Src.Paths = vertcat(horzcat(h.Src.Paths), ctranspose(newPath));
    end
end
function [argsOK, typeIdx, Paths, Groups] = locCheckArgs(h, type, varargin)
    % 82 85
    % 83 85
    argsOK = true;
    Paths = {};
    Groups = {};
    % 87 90
    % 88 90
    if lt(nargin, 2.0) || gt(nargin, 4.0)
        argsOK = false;
        return
    end
    % 93 96
    % 94 96
    if ischar(type)
        [tf, typeIdx] = ismember(type, {'include','source'});
        if ne(tf, true)
            argsOK = false;
            return
        end
    else
        argsOK = false;
        return
    end
    % 105 112
    % 106 112
    % 107 112
    % 108 112
    % 109 112
    % 110 112
    if ischar(varargin{1.0})
        Paths = cellhorzcat(varargin{1.0});
    else
        if ~(iscellstr(varargin{1.0}))
            % 115 117
            argsOK = false;
            return
        end
        Paths = varargin{1.0};
    end
    % 121 124
    % 122 124
    Paths = RTW.transformPaths(Paths, 'pathType', 'full', 'ignoreErrors', true);
    % 124 128
    % 125 128
    % 126 128
    if strcmp(h.Settings.FileSep, '\')
        regexp_filesep = '\\';
    else
        regexp_filesep = h.Settings.FileSep;
    end
    % 132 135
    % 133 135
    Paths = regexprep(Paths, '[\\/]', regexp_filesep);
    % 135 137
    if ge(nargin, 4.0)
        % 137 140
        % 138 140
        if iscellstr(varargin{2.0})
            Groups = varargin{2.0};
            % 141 143
            if ne(length(Paths), length(Groups))
                argsOK = false;
                return
            end
        else
            if ~(ischar(varargin{2.0}))
                argsOK = false;
                return
            end
            Groups(1.0:length(Paths)) = cellhorzcat(varargin{2.0});
        end
    else
        Groups(1.0:length(Paths)) = {''};
    end
    % 156 159
    % 157 159
    if gt(length(Paths), 1.0)
        % 159 162
        % 160 162
        [Paths, idx] = RTW.unique(Paths, 'removetrailingfilesep');
        % 162 165
        % 163 165
        Groups = Groups(idx);
        % 165 169
        % 166 169
        % 167 169
        [tmp, idx] = setdiff(Paths, {''});
        % 169 171
        idx = sort(idx);
        % 171 173
        Paths = Paths(idx);
        Groups = Groups(idx);
    end
    % 175 179
    % 176 179
    % 177 179
    Paths = strrep(Paths, h.Settings.Matlabroot, '$(MATLAB_ROOT)');
end
