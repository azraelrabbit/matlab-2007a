function result = hdlispowerof2(n, nbits, bp)
    % 1 23
    % 2 23
    % 3 23
    % 4 23
    % 5 23
    % 6 23
    % 7 23
    % 8 23
    % 9 23
    % 10 23
    % 11 23
    % 12 23
    % 13 23
    % 14 23
    % 15 23
    % 16 23
    % 17 23
    % 18 23
    % 19 23
    % 20 23
    % 21 23
    if lt(abs(n), 2.220446049250313e-16)
        result = false;
    else
        templog = log2(abs(n));
        if lt(minus(templog, floor(templog)), 2.220446049250313e-16)
            if eq(nargin, 1.0)
                result = true;
            else
                if eq(nargin, 3.0)
                    if ge(templog, 0.0)
                        result = true;
                    else
                        if ge(bp, uminus(templog))
                            result = true;
                        else
                            result = false;
                        end
                    end
                else
                    error('hdlcoder:hdlpowerof2toofewargs', 'HDLISPOWEROF2 called with too few arguments');
                end
            end
        else
            result = false;
        end
    end
end
