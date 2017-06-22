function renderOrderBugFix(h, childIdx)
    % 1 26
    % 2 26
    % 3 26
    % 4 26
    % 5 26
    % 6 26
    % 7 26
    % 8 26
    % 9 26
    % 10 26
    % 11 26
    % 12 26
    % 13 26
    % 14 26
    % 15 26
    % 16 26
    % 17 26
    % 18 26
    % 19 26
    % 20 26
    % 21 26
    % 22 26
    % 23 26
    % 24 26
    % 25 26
    childOrderObj = computeChildOrder(h, false, childIdx);
    % 27 32
    % 28 32
    % 29 32
    % 30 32
    % 31 32
    for hChild=childOrderObj
        set(hChild.hWidget, 'Visible', 'off');
    end % for
    % 35 37
    % 36 37
    for hChild=childOrderObj
        % 38 43
        % 39 43
        % 40 43
        % 41 43
        % 42 43
        set(hChild.hWidget, 'Visible', 'on');
        drawnow('expose');
    end % for
end % function
