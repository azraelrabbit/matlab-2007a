function mplayisave(fname)
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
    % 12 13
    if lt(nargin, 1.0)
        fname = 'mplay.iset';
    end % if
    % 16 18
    % 17 18
    [p, n, e] = fileparts(fname);
    if isempty(e)
        fname = horzcat(fname, '.iset');
    end % if
    % 22 24
    % 23 24
    inst = MPlay.InstGet;
    save(fname, 'inst');
end % function
