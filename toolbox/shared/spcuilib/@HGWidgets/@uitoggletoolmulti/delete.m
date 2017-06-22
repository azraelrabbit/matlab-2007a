function delete(h)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    delete(h.listeners);
    h.listeners = [];
    % 8 9
    delete(h.hbutton);
    h.hbutton = [];
    % 11 12
    h.Icons = {};
    h.Tooltips = {};
end % function
