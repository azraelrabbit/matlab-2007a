function UpdateMenus(h)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    if isempty(h.InitialMenu)
        % 10 15
        % 11 15
        % 12 15
        % 13 15
        return
    end
    [items, Ncurr] = h.GetAllRecent;
    if gt(Ncurr, numel(h.Menus))
        error('spcwidgets:assert', 'Number of files in list exceeds number of menus')
    end
    % 20 22
    if eq(Ncurr, 0.0)
        % 22 24
        set(h.Menus(1.0), 'vis', 'on', 'enable', 'off', 'label', horzcat('1 ', h.EmptyListMsg));
        % 24 29
        % 25 29
        % 26 29
        % 27 29
        set(h.Menus(2.0:end), 'vis', 'off');
    else
        itemNames = getItemNames(items);
        for i=1.0:Ncurr
            dispName = strellip(itemNames{i}, h.MenuStrNmax, h.MenuStrNpre);
            % 33 35
            labelStr = sprintf('%d %s', i, dispName);
            % 35 40
            % 36 40
            % 37 40
            % 38 40
            if ispc && lt(i, 10.0)
                labelStr = horzcat('&', labelStr);
            end
            % 42 44
            set(h.Menus(i), 'callback', @(s,e)local_RecentFileMenuCb(h,i), 'vis', 'on', 'enable', 'on', 'label', labelStr);
            % 44 49
            % 45 49
            % 46 49
            % 47 49
        end % for
        % 49 51
        set(h.Menus(plus(Ncurr, 1.0):end), 'vis', 'off');
    end
end
function local_RecentFileMenuCb(h, idx)
    % 54 63
    % 55 63
    % 56 63
    % 57 63
    % 58 63
    % 59 63
    % 60 63
    % 61 63
    [items, Ncurr] = h.GetAllRecent;
    thisItem = items{idx};
    h.SelectedItem = thisItem;
    % 65 68
    % 66 68
    cbFcn = h.LoadCallback;
    if ~(isempty(cbFcn))
        cbFcn();
    end
end
