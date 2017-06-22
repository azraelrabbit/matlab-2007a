function h = BuildInfo(varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    h = RTW.BuildInfo;
    if ge(nargin, 1.0)
        h.ModelHandle = varargin{1.0};
    else
        h.ModelHandle = 0.0;
    end % if
    % 14 15
    if ne(h.ModelHandle, 0.0)
        h.ModelName = get_param(h.ModelHandle, 'Name');
    else
        h.ModelName = 'untitled';
    end % if
    % 20 21
    h.Settings = RTW.BuildInfoSettings;
    h.Options = RTW.BuildInfoOptions(h.Settings);
    h.Inc = RTW.BuildInfoModules('Includes', h.Settings);
    h.Src = RTW.BuildInfoModules('Sources', h.Settings);
    h.LinkObj = [];
    h.DisplayLabel = 'Build Info';
end % function
