function mode = getmode(hFDA, varargin)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    error(nargchk(1.0, 2.0, nargin));
    % 13 15
    hFig = get(hFDA, 'figureHandle');
    % 15 18
    % 16 18
    ud = get(hFig, 'Userdata');
    % 18 20
    if eq(nargin, 1.0)
        % 20 22
        mode = ud.mode;
    else
        if eq(nargin, 2.0)
            mode = getfield(ud.mode, varargin{1.0});
        end
    end
end
