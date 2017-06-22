function delete(h)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if ishandle(h.cb)
        % 9 10
        jc = get(h.Parent, 'JavaContainer');
        cp = jc.getComponentPeer;
        cp.remove(h.cb.getParent);
        % 13 16
        % 14 16
        % 15 16
    end % if
    % 17 19
    % 18 19
    h.cb = [];
    h.api = [];
end % function
