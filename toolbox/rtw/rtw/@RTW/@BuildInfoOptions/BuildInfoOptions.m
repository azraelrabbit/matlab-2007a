function h = BuildInfoOptions(varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    h = RTW.BuildInfoOptions;
    h.Settings = [];
    % 10 12
    % 11 12
    if gt(nargin, 0.0) && not(isempty(varargin{1.0})) && not(isa(varargin{1.0}, 'RTW.BuildInfoSettings'))
        % 13 15
        % 14 15
        h.Settings = varargin{1.0};
    end % if
    % 17 19
    % 18 19
    h.DisplayLabel = 'Options';
end % function
