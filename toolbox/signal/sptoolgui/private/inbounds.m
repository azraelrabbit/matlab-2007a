function x = inbounds(x, lim, logscale)
    % 1 15
    % 2 15
    % 3 15
    % 4 15
    % 5 15
    % 6 15
    % 7 15
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    if lt(nargin, 3.0)
        logscale = 0.0;
    end
    % 17 19
    if eq(length(x), 1.0)
        if lt(x, lim(1.0))
            x = lim(1.0);
        else
            if gt(x, lim(2.0))
                x = lim(2.0);
            end
        end
    else
        if lt(x(1.0), lim(1.0))
            if logscale
                x = power(10.0, minus(log10(x), log10(mrdivide(x(1.0), lim(1.0)))));
            else
                x = plus(minus(x, x(1.0)), lim(1.0));
            end
        else
            if gt(x(2.0), lim(2.0))
                if logscale
                    x = power(10.0, minus(log10(x), log10(mrdivide(x(2.0), lim(2.0)))));
                else
                    x = plus(minus(x, x(2.0)), lim(2.0));
                end
            end
        end
        if gt(diff(x), diff(lim))
            x = lim;
        end
    end
end
