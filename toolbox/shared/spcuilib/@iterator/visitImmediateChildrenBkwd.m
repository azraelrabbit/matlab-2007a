function y = visitImmediateChildrenBkwd(h, fcn)
    % 1 14
    % 2 14
    % 3 14
    % 4 14
    % 5 14
    % 6 14
    % 7 14
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    % 13 14
    if eq(nargout, 0.0)
        hc = h.down('last');
            while not(isempty(hc))
            hprev = hc.left;
            fcn(hc);
            hc = hprev;
        end % while
    else
        N = iterator.numImmediateChildren(h);
        y = cell(1.0, N);
        hc = h.down;
        i = 0.0;
            while not(isempty(hc))
            hprev = hc.left;
            i = plus(i, 1.0);
            y{i} = fcn(hc);
            hc = hprev;
        end % while
    end % if
end % function
