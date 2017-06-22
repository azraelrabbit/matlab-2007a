function h = BuildInfoString(varargin)
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
    [args_ok, StartVal, Group, DisplayLabel, Settings] = locCheckArgs(varargin{:});
    if not(args_ok)
        DAStudio.error('RTW:buildInfo:badMethodArguments', 'RTW.BuildInfoString');
        % 18 19
    end % if
    % 20 22
    % 21 22
    h = RTW.BuildInfoString;
    % 23 24
    h.Value = StartVal;
    h.Group = Group;
    h.Settings = Settings;
    h.DisplayLabel = DisplayLabel;
end % function
function [args_ok, StartVal, Group, DisplayLabel, Settings] = locCheckArgs(varargin)
    % 30 33
    % 31 33
    % 32 33
    args_ok = true;
    StartVal = '';
    Group = '';
    DisplayLabel = '';
    Settings = [];
    % 38 40
    % 39 40
    if ge(nargin, 1.0)
        if not(ischar(varargin{1.0}))
            args_ok = false;
            return;
        end % if
        StartVal = varargin{1.0};
    end % if
    % 47 49
    % 48 49
    if ge(nargin, 2.0)
        if not(ischar(varargin{2.0}))
            args_ok = false;
            return;
        end % if
        Group = varargin{2.0};
    end % if
    % 56 58
    % 57 58
    if ge(nargin, 3.0)
        if not(ischar(varargin{3.0}))
            args_ok = false;
            return;
        end % if
        DisplayLabel = varargin{3.0};
    end % if
    % 65 67
    % 66 67
    if ge(nargin, 4.0)
        if not(isempty(varargin{4.0})) && not(isa(varargin{4.0}, 'RTW.BuildInfoSettings'))
            args_ok = false;
            return;
        end % if
        Settings = varargin{4.0};
    end % if
end % function
