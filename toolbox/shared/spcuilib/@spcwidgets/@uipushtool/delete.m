function delete(h)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    delete(h.listeners);
    h.listeners = [];
    % 9 10
    delete(h.hbutton);
    h.hbutton = [];
    % 12 13
    h.Icons = {};
    h.Tooltips = {};
end % function
