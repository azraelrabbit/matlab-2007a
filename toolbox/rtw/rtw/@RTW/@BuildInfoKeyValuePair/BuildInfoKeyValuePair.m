function h = BuildInfoKeyValuePair(varargin)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    if eq(nargin, 0.0)
        h = [];
        return;
    end % if
    % 13 15
    % 14 15
    [args_ok, args] = locCheckArgs(varargin{:});
    if not(args_ok)
        DAStudio.error('RTW:buildInfo:badMethodArguments', 'RTW:buildInfo:BuildInfoKeyValuePair');
        % 18 19
    end % if
    % 20 22
    % 21 22
    h = RTW.BuildInfoKeyValuePair;
    % 23 24
    h.Key = args.Key;
    h.Value = args.Value;
    h.Group = args.Group;
    h.DisplayLabel = args.DisplayLabel;
    h.Settings = args.Settings;
end % function
function [args_ok, args] = locCheckArgs(varargin)
    % 31 33
    % 32 33
    args_ok = true;
    args.Key = '';
    args.Value = '';
    args.DisplayLabel = 'BuildInfo Key-Value Pair';
    args.Group = '';
    args.Settings = [];
    % 39 42
    % 40 42
    % 41 42
    if lt(nargin, 2.0)
        args_ok = false;
        return;
    end % if
    % 46 48
    % 47 48
    if not(ischar(varargin{1.0}))
        args_ok = false;
        return;
    end % if
    args.Key = varargin{1.0};
    % 53 55
    % 54 55
    if not(ischar(varargin{2.0}))
        args_ok = false;
        return;
    end % if
    args.Value = varargin{2.0};
    % 60 62
    % 61 62
    if ge(nargin, 3.0)
        if not(ischar(varargin{3.0}))
            args_ok = false;
            return;
        end % if
        args.Group = varargin{3.0};
    end % if
    % 69 71
    % 70 71
    if ge(nargin, 4.0)
        if not(ischar(varargin{4.0}))
            args_ok = false;
            return;
        end % if
        args.DisplayLabel = varargin{4.0};
    end % if
    % 78 80
    % 79 80
    if ge(nargin, 5.0)
        if not(isempty(varargin{5.0})) && not(isa(varargin{5.0}, 'RTW.BuildInfoSettings'))
            args_ok = false;
            return;
        end % if
        args.Settings = varargin{5.0};
    end % if
end % function
