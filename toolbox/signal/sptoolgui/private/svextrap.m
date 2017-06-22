function [P, f, Pc] = svextrap(P, f, nfft, Pc)
    % 1 18
    % 2 18
    % 3 18
    % 4 18
    % 5 18
    % 6 18
    % 7 18
    % 8 18
    % 9 18
    % 10 18
    % 11 18
    % 12 18
    % 13 18
    % 14 18
    % 15 18
    % 16 18
    % 17 18
    if lt(length(P), nfft)
        if rem(nfft, 2.0)
            P = vertcat(P(end:-1.0:2.0), P, P(end:-1.0:2.0));
            f = vertcat(uminus(f(end:-1.0:2.0)), f, minus(mtimes(f(1.0), nfft), f(end:-1.0:2.0)));
            if gt(nargin, 3.0)
                Pc = vertcat(Pc(end:-1.0:2.0, :), Pc, Pc(end:-1.0:2.0, :));
            end % if
        else
            P = vertcat(P(end:-1.0:2.0), P, P(minus(end, 1.0):-1.0:2.0));
            f = vertcat(uminus(f(end:-1.0:2.0)), f, plus(f(2.0:minus(end, 1.0)), f(end)));
            if gt(nargin, 3.0)
                Pc = vertcat(Pc(end:-1.0:2.0, :), Pc, Pc(minus(end, 1.0):-1.0:2.0, :));
            end % if
        end % if
    else
        P = vertcat(P(ceil(plus(mrdivide(end, 2.0), 1.0)):end), P);
        f = vertcat(uminus(f(floor(plus(mrdivide(end, 2.0), 1.0)):-1.0:2.0)), f);
        if gt(nargin, 3.0)
            Pc = vertcat(Pc(ceil(plus(mrdivide(end, 2.0), 1.0)):end, :), Pc);
        end % if
    end % if
end % function
