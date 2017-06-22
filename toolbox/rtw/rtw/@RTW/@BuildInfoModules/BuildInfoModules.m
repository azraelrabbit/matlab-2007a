function h = BuildInfoModules(varargin)
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
    [args_ok, DisplayLabel, Settings] = locCheckArgs(varargin{:});
    if not(args_ok)
        DAStudio.error('RTW:buildInfo:badMethodArguments', 'RTW:BuildInfo:BuildInfoModules');
        % 18 19
    end % if
    % 20 22
    % 21 22
    h = RTW.BuildInfoModules;
    h.Settings = Settings;
    % 24 25
    h.DisplayLabel = DisplayLabel;
end % function
function [args_ok, DisplayLabel, Settings] = locCheckArgs(varargin)
    % 28 30
    % 29 30
    args_ok = true;
    DisplayLabel = 'File & Path Info';
    Settings = [];
    % 33 35
    % 34 35
    if not(ischar(varargin{1.0}))
        args_ok = false;
        return;
    end % if
    DisplayLabel = varargin{1.0};
    % 40 42
    % 41 42
    if ge(nargin, 2.0)
        if not(isempty(varargin{2.0})) && not(isa(varargin{2.0}, 'RTW.BuildInfoSettings'))
            args_ok = false;
            return;
        end % if
        Settings = varargin{2.0};
    end % if
end % function
