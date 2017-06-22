function mplayclose(arg)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    if lt(nargin, 1.0)
        m = MPlay.Find(0.0);
    else
        if not(strcmpi(arg, 'all'))
            error('Argument must be ''all''.');
        end % if
        m = MPlay.Find;
    end % if
    if not(isempty(m))
        m.Close;
    end % if
end % function
