function h = BuildInfoLinkObj(varargin)
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
        DAStudio.error('RTW:buildInfo:badMethodArguments', 'RTW:BuildInfo:BuildInfoLinkObj');
        % 18 19
    end % if
    % 20 22
    % 21 22
    h = RTW.BuildInfoLinkObj;
    if isempty(args.Settings)
        h.Settings = RTW.BuildInfoSettings;
    else
        h.Settings = args.Settings;
    end % if
    % 28 29
    h.Options = RTW.BuildInfoOptions(args.Settings);
    h.Inc = RTW.BuildInfoModules('Includes', args.Settings);
    h.Src = RTW.BuildInfoModules('Sources', args.Settings);
    h.Name = args.Name;
    h.LinkPriority = args.LinkPriority;
    h.Path = args.Path;
    h.Group = args.Group;
    % 36 38
    % 37 38
    h.DisplayLabel = 'Linkable Object';
end % function
function [args_ok, args] = locCheckArgs(varargin)
    % 41 44
    % 42 44
    % 43 44
    args_ok = true;
    args.Name = '';
    args.Path = '';
    args.LinkPriority = 1000.0;
    args.Group = '';
    args.Settings = [];
    % 50 53
    % 51 53
    % 52 53
    if lt(nargin, 2.0)
        args_ok = false;
        return;
    end % if
    % 57 59
    % 58 59
    if not(ischar(varargin{1.0}))
        args_ok = false;
        return;
    end % if
    args.Name = varargin{1.0};
    % 64 66
    % 65 66
    if not(ischar(varargin{2.0}))
        args_ok = false;
        return;
    end % if
    args.Path = varargin{2.0};
    % 71 73
    % 72 73
    if ge(nargin, 3.0)
        if not(isnumeric(varargin{3.0}))
            args_ok = false;
            return;
        end % if
        args.LinkPriority = varargin{3.0};
    end % if
    % 80 82
    % 81 82
    if ge(nargin, 4.0)
        if not(ischar(varargin{4.0}))
            args_ok = false;
            return;
        end % if
        args.Group = varargin{4.0};
    end % if
    % 89 91
    % 90 91
    if ge(nargin, 5.0)
        if not(isempty(varargin{5.0})) && not(isa(varargin{5.0}, 'RTW.BuildInfoSettings'))
            args_ok = false;
            return;
        end % if
        args.Settings = varargin{5.0};
    end % if
end % function
