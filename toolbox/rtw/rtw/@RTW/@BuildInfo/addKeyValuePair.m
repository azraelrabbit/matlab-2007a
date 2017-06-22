function addKeyValuePair(h, Type, varargin)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    [args_ok, Keys, Values, Groups] = locCheckArgs(h, Type, varargin{:});
    if ~(args_ok)
        DAStudio.error('RTW:buildInfo:badMethodArguments', 'RTW.BuildInfo.addKeyValuePair');
        % 11 13
    end
    % 13 16
    % 14 16
    switch Type
    case 'BuildArg'
        cur_keys = get(h.BuildArgs, 'Key');
    case 'Token'
        cur_keys = get(h.Tokens, 'Key');
    end
    % 21 23
    if ~(isempty(cur_keys))
        % 23 26
        % 24 26
        [tf, idx] = setdiff(Keys, cur_keys);
        if ~(isempty(tf))
            % 27 30
            % 28 30
            idx = sort(idx);
        end
        % 31 33
        Keys = Keys(idx);
        Values = Values(idx);
        Groups = Groups(idx);
    end
    % 36 39
    % 37 39
    if isempty(Keys)
        return
    end
    % 41 43
    cnt = length(Keys);
    % 43 45
    for i=cnt:-1.0:1.0
        % 45 47
        newKeyValPair(i) = RTW.BuildInfoKeyValuePair(Keys{i}, Values{i}, Groups{i}, Keys{i}, h.Settings);
        % 47 50
        % 48 50
    end % for
    % 50 54
    % 51 54
    % 52 54
    switch Type
    case 'BuildArg'
        h.BuildArgs = vertcat(horzcat(h.BuildArgs), ctranspose(newKeyValPair));
    case 'Token'
        h.Tokens = vertcat(horzcat(h.Tokens), ctranspose(newKeyValPair));
    end
end
function [args_ok, Keys, Values, Groups] = locCheckArgs(h, Type, varargin)
    % 61 64
    % 62 64
    args_ok = false;
    Keys = {};
    Values = {};
    Groups = {};
    % 67 70
    % 68 70
    if lt(nargin, 3.0) || gt(nargin, 5.0)
        return
    end
    % 72 76
    % 73 76
    % 74 76
    validKeys = {'BuildArg','Token'};
    if ~(ischar(Type)) || ~(ismember(Type, validKeys))
        return
    end
    % 79 82
    % 80 82
    if ~(iscellstr(varargin{1.0}))
        if ~(ischar(varargin{1.0}))
            % 83 85
            return
        end
        Keys = cellhorzcat(varargin{1.0});
    else
        Keys = varargin{1.0};
    end
    % 90 93
    % 91 93
    if ge(nargin, 4.0)
        % 93 96
        % 94 96
        if iscellstr(varargin{2.0})
            Values = varargin{2.0};
            % 97 99
            if ne(length(Keys), length(Values))
                args_ok = false;
                return
            end
        else
            if ~(ischar(varargin{2.0}))
                args_ok = false;
                return
            end
            Values(1.0:length(Keys)) = cellhorzcat(varargin{2.0});
        end
    else
        Values(1.0:length(Keys)) = {''};
    end
    % 112 115
    % 113 115
    if ge(nargin, 5.0)
        % 115 118
        % 116 118
        if iscellstr(varargin{3.0})
            Groups = varargin{3.0};
            % 119 121
            if ne(length(Keys), length(Groups))
                args_ok = false;
                return
            end
        else
            if ~(ischar(varargin{3.0}))
                args_ok = false;
                return
            end
            Groups(1.0:length(Keys)) = cellhorzcat(varargin{3.0});
        end
    else
        Groups(1.0:length(Keys)) = {''};
    end
    % 134 137
    % 135 137
    if gt(length(Keys), 1.0)
        % 137 139
        [Keys, idx] = RTW.unique(Keys);
        % 139 142
        % 140 142
        Values = Values(idx);
        Groups = Groups(idx);
        % 143 147
        % 144 147
        % 145 147
        [tmp, idx] = setdiff(Keys, {''});
        % 147 149
        idx = sort(idx);
        % 149 151
        Keys = Keys(idx);
        Values = Values(idx);
        Groups = Groups(idx);
    end
    % 154 158
    % 155 158
    % 156 158
    idx = ~(cellfun(@isempty, regexp(Groups, '.*_PATH$')));
    % 158 162
    % 159 162
    % 160 162
    if strcmp(h.Settings.FileSep, '\')
        regexp_filesep = '\\';
    else
        regexp_filesep = h.Settings.FileSep;
    end
    % 166 169
    % 167 169
    Values(idx) = regexprep(Values(idx), '[\\/]', regexp_filesep);
    % 169 172
    % 170 172
    args_ok = true;
end
