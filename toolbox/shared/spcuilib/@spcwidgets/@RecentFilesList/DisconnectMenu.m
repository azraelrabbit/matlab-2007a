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
        if ishandle(h.Menus(1.0))
            set(h.Menus(1.0), 'label', '<no longer used>', 'callback', '', 'enable', 'off', 'vis', 'on');
            % 17 24
            % 18 24
            % 19 24
            % 20 24
            % 21 24
            % 22 24
            % 23 24
            delete(h.Menus(2.0:end));
        end % if
        % 26 29
        % 27 29
        % 28 29
        h.Menus = [];
        % 30 33
        % 31 33
        % 32 33
        h.InitialMenu = [];
    end % if
end % function
