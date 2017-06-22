function h = hdssource(varargin)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    h = hdsviewer.hdssource;
    if gt(nargin, 0.0)
        set(h, varargin{:});
    end % if
end % function
