function updateVisible(h, vis)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    % 12 13
    if lt(nargin, 2.0)
        vis = h.Visible;
    end % if
    hChild = h.down;
        while not(isempty(hChild))
        set(hChild, 'RenderOrderBugFixEnabled', false, 'Visible', vis);
        % 19 21
        % 20 21
        hChild = hChild.right;
    end % while
end % function
