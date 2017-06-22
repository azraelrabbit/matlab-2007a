function [oh, lc] = assignline(lc, M, parent_ax, varargin)
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
    if ge(length(lc), M)
        oh = lc(1.0:M);
        lc = lc(plus(M, 1.0):end);
    else
        M = minus(M, length(lc));
        oh = lc;
        lc = zeros(0.0, 1.0);
        oh = vertcat(oh, line(zeros(2.0, M), zeros(2.0, M), 'parent', parent_ax));
    end % if
    oh = oh(:);
    if gt(nargin, 3.0)
        set(oh, varargin{:})
    end % if
    lc = lc(:);
end % function
