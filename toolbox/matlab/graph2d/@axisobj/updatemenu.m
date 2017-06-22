function A = updatemenu(A)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    HG = get(A, 'MyHGHandle');
    % 9 10
    menu = get(A, 'UIContextMenu');
    movemenu = findall(menu, 'Tag', 'ScribeAxisObjMoveResizeMenu');
    % 12 13
    checked = {'off','on'};
    legendLabel = {'Show Le&gend','Hide Le&gend'};
    lockLabel = {'Unloc&k Axes Position','Loc&k Axes Position'};
    set(movemenu, 'Checked', 'off', 'Label', lockLabel{plus(get(A, 'Draggable'), 1.0)})
    % 17 22
    % 18 22
    % 19 22
    % 20 22
    % 21 22
    legendmenu = findall(menu, 'Tag', 'ScribeAxisObjShowLegendMenu');
    if eq(length(get(HG, 'Children')), 0.0)
        set(legendmenu, 'Enable', checked{1.0}, 'Label', legendLabel{1.0});
    else
        % 26 27
        % 27 28
        set(legendmenu, 'Enable', checked{2.0}, 'Label', legendLabel{plus(islegendon(HG), 1.0)});
        % 29 31
        % 30 31
    end % if
end % function
