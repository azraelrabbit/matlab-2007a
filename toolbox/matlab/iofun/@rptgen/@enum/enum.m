function this = enum(varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    try
        % 9 12
        % 10 12
        % 11 12
        this = rptgen.enum(varargin{1.0:2.0});
    catch
        % 14 16
        % 15 16
        this = findtype(varargin{1.0});
        return;
    end % try
    % 19 20
    if gt(nargin, 2.0)
        this.DisplayNames = varargin{3.0};
    end % if
end % function
