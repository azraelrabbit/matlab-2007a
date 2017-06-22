function DisconnectMenu(h)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    if not(isempty(h.InitialMenu))
        % 11 15
        % 12 15
        % 13 15
        % 14 15
        set(h.Menus(1.0), 'label', '<no longer used>', 'callback', '', 'enable', 'off', 'vis', 'on');
        % 16 23
        % 17 23
        % 18 23
        % 19 23
        % 20 23
        % 21 23
        % 22 23
        delete(h.Menus(2.0:end));
        % 24 27
        % 25 27
        % 26 27
        h.Menus = [];
        % 28 31
        % 29 31
        % 30 31
        h.InitialMenu = [];
    end % if
end % function
