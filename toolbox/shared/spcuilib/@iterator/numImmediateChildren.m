function N = numImmediateChildren(h)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    N = 0.0;
    hc = h.down;
        while not(isempty(hc))
        N = plus(N, 1.0);
        hc = hc.right;
    end % while
end % function
