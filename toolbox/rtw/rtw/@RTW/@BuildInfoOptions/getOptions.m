function [ret, Keys, Vals] = getOptions(h, type, varargin)
    % 1 24
    % 2 24
    % 3 24
    % 4 24
    % 5 24
    % 6 24
    % 7 24
    % 8 24
    % 9 24
    % 10 24
    % 11 24
    % 12 24
    % 13 24
    % 14 24
    % 15 24
    % 16 24
    % 17 24
    % 18 24
    % 19 24
    % 20 24
    % 21 24
    % 22 24
    [argsOK, typeIdx, incGroups, excGroups] = locCheckArgs(type, varargin{:});
    if not(argsOK)
        DAStudio.error('RTW:buildInfo:badMethodArguments', 'RTW.BuildInfoBuildObj.getOptions');
        % 26 28
    end % if
    % 28 30
    ret = {};
    Keys = {};
    Vals = {};
    % 32 34
    options = {};
    optGroups = {};
    % 35 38
    % 36 38
    switch typeIdx
    case 1.0
        Keys = get(h.Defines, 'Key');
        Vals = get(h.Defines, 'Val');
        % 41 44
        % 42 44
        if isempty(Keys)
            return;
        end % if
        % 46 48
        if not(iscell(Keys))
            Keys = cellhorzcat(Keys);
        end % if
        if not(iscell(Vals))
            Vals = cellhorzcat(Vals);
        end % if
        % 53 56
        % 54 56
        options = strcat('-D', Keys);
        % 56 59
        % 57 59
        valIdx = find(eq(strcmp(Vals, ''), 0.0));
        options(valIdx) = strcat(options(valIdx), '=', Vals(valIdx));
        optGroups = get(h.Defines, 'Group');
    case 2.0
        options = get(h.CompileFlags, 'Value');
        optGroups = get(h.CompileFlags, 'Group');
    case 3.0
        options = get(h.LinkFlags, 'Value');
        optGroups = get(h.LinkFlags, 'Group');
    end % switch
    % 68 71
    % 69 71
    if isempty(options)
        return;
    end % if
    % 73 75
    if not(iscell(options))
        options = cellhorzcat(options);
    end % if
    % 77 80
    % 78 80
    includeIdx = [];
    if not(isempty(incGroups))
        % 81 83
        for i=1.0:length(incGroups)
            includeIdx = vertcat(includeIdx, find(eq(strcmp(optGroups, incGroups{i}), 1.0)));
        end % for
    else
        includeIdx = 1.0:length(options);
    end % if
    % 88 91
    % 89 91
    excludeIdx = [];
    if not(isempty(excGroups))
        % 92 94
        for i=1.0:length(excGroups)
            excludeIdx = vertcat(excludeIdx, find(eq(strcmp(optGroups, excGroups{i}), 1.0)));
        end % for
    end % if
    % 97 100
    % 98 100
    excludeIdx = sort(excludeIdx);
    % 100 104
    % 101 104
    % 102 104
    [includeIdx, not_used] = setdiff(includeIdx, excludeIdx);
    % 104 107
    % 105 107
    if isempty(includeIdx)
        return;
    end % if
    % 109 111
    options = options(includeIdx);
    if not(isempty(Keys))
        Keys = Keys(includeIdx);
    end % if
    if not(isempty(Vals))
        Vals = Vals(includeIdx);
    end % if
    % 117 121
    % 118 121
    % 119 121
    ret = ctranspose(options);
function [argsOK, typeIdx, incGroups, excGroups] = locCheckArgs(type, varargin)
    % 122 126
    % 123 126
    % 124 126
    argsOK = true;
    incGroups = {};
    excGroups = {};
    % 128 131
    % 129 131
    [tf, typeIdx] = ismember(type, {'define','compileflag','linkflag'});
    if ne(tf, true)
        argsOK = false;
        return;
    end % if
    % 135 137
    nargs = length(varargin);
    % 137 142
    % 138 142
    % 139 142
    % 140 142
    if ge(nargs, 1.0)
        if not(iscellstr(varargin{1.0}))
            if not(ischar(varargin{1.0}))
                % 144 146
                argsOK = false;
                return;
            end % if
            % 148 150
            if not(isempty(varargin{1.0}))
                incGroups = cellhorzcat(varargin{1.0});
            end % if
        else
            % 153 155
            incGroups = unique(varargin{1.0});
        end % if
    end % if
    % 157 160
    % 158 160
    if ge(nargs, 2.0)
        if not(iscellstr(varargin{2.0}))
            if not(ischar(varargin{2.0}))
                % 162 164
                argsOK = false;
                return;
            end % if
            % 166 168
            if not(isempty(varargin{2.0}))
                excGroups = cellhorzcat(varargin{2.0});
            end % if
        else
            % 171 173
            excGroups = unique(varargin{2.0});
        end % if
    end % if
