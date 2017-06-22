function mplayshow(arg)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    if lt(nargin, 1.0)
        m = MPlay.Find(0.0);
    else
        if not(strcmpi(arg, 'all'))
            error('Argument must be ''all''.');
        end % if
        m = MPlay.Find;
    end % if
    % 18 19
    for i=1.0:numel(m)
        m(i).Show;
    end % for
end % function
