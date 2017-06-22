function p = Position(mplayer, pos)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if gt(nargin, 1.0)
        % 9 10
        if not(isvector(pos)) || ne(numel(pos), 4.0)
            error('Position must be a 4-element vector');
        end % if
        % 13 14
        set(mplayer.widgetsObj.hfig, 'position', pos);
    else
        % 16 17
        p = get(mplayer.widgetsObj.hfig, 'position');
    end % if
end % function
