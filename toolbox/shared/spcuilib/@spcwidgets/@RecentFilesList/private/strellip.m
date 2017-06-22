function str = strellip(str, Nmax, Npre)
    % 1 21
    % 2 21
    % 3 21
    % 4 21
    % 5 21
    % 6 21
    % 7 21
    % 8 21
    % 9 21
    % 10 21
    % 11 21
    % 12 21
    % 13 21
    % 14 21
    % 15 21
    % 16 21
    % 17 21
    % 18 21
    % 19 21
    % 20 21
    Nstr = numel(str);
    Nmax = max(Nmax, 3.0);
    if lt(Nstr, Nmax)
        % 24 25
        return;
    end % if
    if lt(nargin, 3.0)
        Npre = 5.0;
    end % if
    % 30 31
    Npre = min(Npre, minus(Nmax, 3.0));
    tpre = str(1.0:Npre);
    Npre_actual = numel(tpre);
    Ntail = minus(minus(Nmax, Npre_actual), 3.0);
    tpost = str(plus(minus(end, Ntail), 1.0):end);
    str = horzcat(tpre, '...', tpost);
end % function
