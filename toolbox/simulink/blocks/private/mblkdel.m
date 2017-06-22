function [ns, m, no, x0] = mblkdel(tau, y0, ts)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    if isempty(y0)
        y0 = 0.0;
    end % if
    y0 = y0(:);
    no = size(y0, 1.0);
    h = ts(1.0);
    if eq(h, -1.0)
        nh = plus(floor(tau), 1.0);
    else
        nh = mrdivide(tau, h);
    end % if
    ns = floor(nh);
    m = minus(nh, floor(nh));
    x0 = y0(:, ones(1.0, plus(ns, 1.0)));
    x0 = x0(:);
    return;
end % function
