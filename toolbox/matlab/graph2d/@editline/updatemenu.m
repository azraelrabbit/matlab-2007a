function A = updatemenu(A)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    menu = get(A, 'UIContextMenu');
    % 9 11
    % 10 11
    lineStyle = get(A, 'LineStyle');
    % 12 13
    styles = {'-.','dashdot';':','dot';'--','dash';'-','solid'};
    % 14 20
    % 15 20
    % 16 20
    % 17 20
    % 18 20
    % 19 20
    styleMenu = findall(menu, 'Tag', 'ScribeEditlineObjStyleMenu');
    submenus = allchild(styleMenu);
    whichStyle = find(strcmp(lineStyle, styles(:, 1.0)));
    % 23 24
    set(submenus, 'Checked', 'off');
    set(submenus(whichStyle), 'Checked', 'on');
    % 26 29
    % 27 29
    % 28 29
    lineSize = get(A, 'LineWidth');
    % 30 32
    % 31 32
    sizes = [0.0 ;  10.0 ;  9.0 ;  8.0 ;  7.0 ;  6.0 ;  5.0 ;  4.0 ;  3.0 ;  2.0 ;  1.0 ;  .5];
    % 33 47
    % 34 47
    % 35 47
    % 36 47
    % 37 47
    % 38 47
    % 39 47
    % 40 47
    % 41 47
    % 42 47
    % 43 47
    % 44 47
    % 45 47
    % 46 47
    sizeMenu = findall(menu, 'Tag', 'ScribeEditlineObjSizeMenu');
    submenus = allchild(sizeMenu);
    whichSize = find(eq(lineSize, sizes));
    % 50 51
    set(submenus, 'Checked', 'off');
    set(submenus(whichSize), 'Checked', 'on');
end % function
