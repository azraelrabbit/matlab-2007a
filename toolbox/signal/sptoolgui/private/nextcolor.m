function [lineinfo, colorCount] = nextcolor(co, lso, colorCount)
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
    % 14 15
    lc = length(co);
    ls = length(lso);
    % 17 18
    colorCount = plus(colorCount, 1.0);
    % 19 20
    lineinfo.color = co{plus(rem(minus(colorCount, 1.0), lc), 1.0)};
    lineinfo.linestyle = lso{plus(rem(minus(ceil(mrdivide(colorCount, lc)), 1.0), ls), 1.0)};
end % function
