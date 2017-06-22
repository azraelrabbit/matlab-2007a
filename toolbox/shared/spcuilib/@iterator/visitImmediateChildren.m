function y = visitImmediateChildren(h, fcn)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if eq(nargout, 0.0)
        hc = h.down;
            while not(isempty(hc))
            fcn(hc);
            hc = hc.right;
        end % while
    else
        N = iterator.numImmediateChildren(h);
        y = cell(1.0, N);
        i = 0.0;
        hc = h.down;
            while not(isempty(hc))
            i = plus(i, 1.0);
            y{i} = fcn(hc);
            hc = hc.right;
        end % while
    end % if
end % function
