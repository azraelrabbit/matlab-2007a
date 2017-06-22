function delete(h)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    delete(h.listeners);
    h.listeners = [];
    % 9 11
    % 10 11
    if ishandle(h.hmenu)
        delete(h.hmenu);
    end % if
    h.hmenu = [];
end % function
