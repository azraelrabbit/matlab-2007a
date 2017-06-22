function [smap, rmap] = mblkint(N, no, nr)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    ns = mtimes(no, N);
    len = plus(no, ns);
    smap = zeros(1.0, len);
    smap(1.0:no) = plus(no, N):N:len;
    smap(plus(no, 1.0):N:len) = 1.0:no;
    ko = plus(no, 2.0:N);
    ki = plus(no, 1.0:minus(N, 1.0));
    for k=1.0:no
        smap(ko) = ki;
        ko = plus(ko, N);
        ki = plus(ki, N);
    end % for
    if gt(nr, 0.0)
        nrs = mtimes(no, nr);
        rmap = plus(nrs, 1.0:ns);
        ko = 1.0:nr;
        ki = 1.0:no:nrs;
        for k=1.0:no
            rmap(ko) = ki;
            ko = plus(ko, N);
            ki = plus(ki, 1.0);
        end % for
    else
        rmap = [];
    end % if
    return;
end % function
