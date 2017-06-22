function addOptions(h, type, varargin)
    % 1 22
    % 2 22
    % 3 22
    % 4 22
    % 5 22
    % 6 22
    % 7 22
    % 8 22
    % 9 22
    % 10 22
    % 11 22
    % 12 22
    % 13 22
    % 14 22
    % 15 22
    % 16 22
    % 17 22
    % 18 22
    % 19 22
    % 20 22
    [argsOK, typeIdx, Options, Groups] = locCheckArgs(type, varargin{:});
    if not(argsOK)
        DAStudio.error('RTW:buildInfo:badMethodArguments', 'RTW.BuildInfoOptions.addOptions');
        % 24 26
    end % if
    % 26 28
    if isempty(Options)
        return;
    end % if
    % 30 32
    switch typeIdx
    case 1.0
        [Keys, Vals] = locResolveDefines(Options);
        % 34 36
        cur_keys = get(h.Defines, 'Key');
        % 36 38
        if not(isempty(cur_keys))
            % 38 41
            % 39 41
            [tf, idx] = setdiff(Keys, cur_keys);
            if not(isempty(tf))
                % 42 45
                % 43 45
                idx = sort(idx);
            end % if
            % 46 48
            Keys = Keys(idx);
            Vals = Vals(idx);
            Groups = Groups(idx);
        end % if
        cnt = length(Keys);
        % 52 54
        for i=cnt:-1.0:1.0
            % 54 57
            % 55 57
            newOpt(i) = RTW.BuildInfoKeyValuePair(Keys{i}, Vals{i}, Groups{i}, Keys{i}, h.Settings);
            % 57 59
        end % for
    case {[2.0],[3.0]}
        % 60 62
        cnt = length(Options);
        % 62 64
        for i=cnt:-1.0:1.0
            % 64 67
            % 65 67
            newOpt(i) = RTW.BuildInfoString(Options{i}, Groups{i}, type, h.Settings);
            % 67 69
        end % for
        % 69 71
    end % switch
    % 71 75
    % 72 75
    % 73 75
    if eq(cnt, 0.0)
        return;
    end % if
    % 77 81
    % 78 81
    % 79 81
    switch typeIdx
    case 1.0
        h.Defines = vertcat(horzcat(h.Defines), ctranspose(newOpt));
    case 2.0
        h.CompileFlags = vertcat(horzcat(h.CompileFlags), ctranspose(newOpt));
    case 3.0
        h.LinkFlags = vertcat(horzcat(h.LinkFlags), ctranspose(newOpt));
    end % switch
function [argsOK, typeIdx, Options, Groups] = locCheckArgs(type, varargin)
    % 89 94
    % 90 94
    % 91 94
    % 92 94
    argsOK = true;
    Options = {};
    Groups = {};
    % 96 102
    % 97 102
    % 98 102
    % 99 102
    % 100 102
    if lt(nargin, 2.0) || gt(nargin, 3.0)
        argsOK = false;
        return;
    end % if
    % 105 108
    % 106 108
    if ischar(type)
        [tf, typeIdx] = ismember(type, {'define','compileflag','linkflag'});
        if ne(tf, true)
            argsOK = false;
            return;
        end % if
    else
        argsOK = false;
        return;
    end % if
    % 117 120
    % 118 120
    if not(iscellstr(varargin{1.0}))
        if not(ischar(varargin{1.0}))
            % 121 123
            argsOK = false;
            return;
        end % if
        % 125 128
        % 126 128
        if not(isempty(varargin{1.0}))
            Options = cellhorzcat(varargin{1.0});
        end % if
    else
        Options = varargin{1.0};
    end % if
    % 133 135
    if ge(nargin, 3.0)
        % 135 138
        % 136 138
        if iscellstr(varargin{2.0})
            Groups = varargin{2.0};
            % 139 141
            if ne(length(Options), length(Groups))
                argsOK = false;
                return;
            end % if
        else
            if not(ischar(varargin{2.0}))
                argsOK = false;
                return;
            end % if
            Groups(1.0:length(Options)) = cellhorzcat(varargin{2.0});
        end % if
    else
        Groups(1.0:length(Options)) = {''};
    end % if
function [Keys, Vals] = locResolveDefines(Options)
    % 155 160
    % 156 160
    % 157 160
    % 158 160
    defs = regexprep(Options, '^-[dD]?(.*)', '$1');
    % 160 163
    % 161 163
    tmp = regexp(defs, '([^=]*)=?', 'tokens', 'once');
    Keys = horzcat(tmp{:});
    % 164 177
    % 165 177
    % 166 177
    % 167 177
    % 168 177
    % 169 177
    % 170 177
    % 171 177
    % 172 177
    % 173 177
    % 174 177
    % 175 177
    tmp = regexp(defs, '[^=]*=?(.*)', 'tokens', 'once');
    Vals = horzcat(tmp{:});
