function h = BuildInfoFile(varargin)
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
        DAStudio.error('RTW:buildInfo:badMethodArguments', 'RTW.BuildInfo.BuildInfoFile');
        % 18 19
    end % if
    % 20 22
    % 21 22
    h = RTW.BuildInfoFile;
    % 23 27
    % 24 27
    % 25 27
    % 26 27
    h.FileName = args.FileName;
    h.Path = args.Path;
    h.Group = args.Group;
    h.DisplayLabel = args.DisplayLabel;
    h.Settings = args.Settings;
    h.Options = RTW.BuildInfoOptions(args.Settings);
end % function
function [args_ok, args] = locCheckArgs(varargin)
    % 35 37
    % 36 37
    args_ok = true;
    args.FileName = '';
    args.Path = '';
    args.Group = '';
    args.DisplayLabel = 'BuildInfo file';
    args.Settings = [];
    % 43 46
    % 44 46
    % 45 46
    if not(ischar(varargin{1.0}))
        args_ok = false;
        return;
    end % if
    args.FileName = varargin{1.0};
    % 51 53
    % 52 53
    if ge(nargin, 2.0)
        if not(ischar(varargin{2.0}))
            args_ok = false;
            return;
        end % if
        args.Path = varargin{2.0};
    end % if
    % 60 62
    % 61 62
    if ge(nargin, 3.0)
        if not(char(varargin{3.0}))
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
function locUsage
end % function
