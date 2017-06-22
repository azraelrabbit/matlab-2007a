function [cros_inf, block_n] = blkxchk(layout, blklocs)
    % 1 22
    % 2 22
    % 3 22
    % 4 22
    % 5 22
    % 6 22
    % 7 22
    % 8 22
    % 9 22
    % 10 22
    % 11 22
    % 12 22
    % 13 22
    % 14 22
    % 15 22
    % 16 22
    % 17 22
    % 18 22
    % 19 22
    % 20 22
    cros_inf = [];
    block_n = [];
    k = 0.0;
    x = zeros(4.0, 1.0);
    a = vertcat(min(layout), max(layout));
    if not(isempty(blklocs))
        [tmp1, tmp2] = size(blklocs);
        for i=1.0:tmp1
            b = blklocs(i, :);
            x(1.0) = and(and(le(a(1.0, 1.0), b(1.0)), ge(a(2.0, 1.0), b(1.0))), not(or(gt(a(1.0, 2.0), b(4.0)), lt(a(2.0, 2.0), b(2.0)))));
            x(2.0) = and(and(le(a(1.0, 1.0), b(3.0)), ge(a(2.0, 1.0), b(3.0))), not(or(gt(a(1.0, 2.0), b(4.0)), lt(a(2.0, 2.0), b(2.0)))));
            x(3.0) = and(and(le(a(1.0, 2.0), b(2.0)), ge(a(2.0, 2.0), b(2.0))), not(or(gt(a(1.0, 1.0), b(3.0)), lt(a(2.0, 1.0), b(1.0)))));
            x(4.0) = and(and(le(a(1.0, 2.0), b(4.0)), ge(a(2.0, 2.0), b(4.0))), not(or(gt(a(1.0, 1.0), b(3.0)), lt(a(2.0, 1.0), b(1.0)))));
            x(5.0) = and(and(ge(a(1.0, 1.0), b(1.0)), le(a(2.0, 1.0), b(3.0))), not(or(gt(a(1.0, 2.0), b(4.0)), lt(a(2.0, 2.0), b(2.0)))));
            x(6.0) = and(and(ge(a(1.0, 2.0), b(2.0)), le(a(2.0, 2.0), b(4.0))), not(or(gt(a(1.0, 1.0), b(3.0)), lt(a(2.0, 1.0), b(1.0)))));
            if sum(x)
                k = plus(k, 1.0);
                block_n(k) = i;
                z = find(eq(x, 1.0));
                if le(length(z), 1.0)
                    cros_inf(k) = 1.0;
                    if le(z, 2.0)
                        cros_inf(k) = 3.0;
                    end % if
                else
                    if ge(z(1.0), 3.0)
                        cros_inf(k) = 2.0;
                    else
                        if le(z(2.0), 2.0)
                            cros_inf(k) = 4.0;
                        else
                            cros_inf(k) = 6.0;
                        end % if
                    end % if
                end % if
            end % if
        end % for
    end % if
end % function
