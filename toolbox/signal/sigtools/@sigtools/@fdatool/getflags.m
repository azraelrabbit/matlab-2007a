function flags = getflags(hFDA, varargin)
    % 1 16
    % 2 16
    % 3 16
    % 4 16
    % 5 16
    % 6 16
    % 7 16
    % 8 16
    % 9 16
    % 10 16
    % 11 16
    % 12 16
    % 13 16
    % 14 16
    error(nargchk(1.0, 3.0, nargin));
    % 16 18
    hFig = get(hFDA, 'figureHandle');
    % 18 21
    % 19 21
    ud = get(hFig, 'Userdata');
    % 21 23
    if eq(nargin, 1.0)
        % 23 25
        flags = ud.flags;
    else
        if gt(nargin, 1.0)
            flags = getfield(ud.flags, varargin{:});
        end
    end
end
