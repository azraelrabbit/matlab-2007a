function A = updatemenu(A)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    menu = get(A, 'UIContextMenu');
    % 9 10
    checked = {'off','on'};
    % 11 13
    % 12 13
    fontSize = get(A, 'FontSize');
    % 14 15
    sizeMenu = findall(menu, 'Tag', 'ScribeAxistextObjSizeMenu');
    submenus = allchild(sizeMenu);
    set(submenus, 'Checked', 'off');
    whichMenu = findall(submenus, 'Label', num2str(fontSize));
    set(whichMenu, 'Checked', 'on');
    % 20 23
    % 21 23
    % 22 23
    fontStyle = get(A, 'FontAngle');
    fontWeight = get(A, 'FontWeight');
    % 25 26
    isBold = strcmp(fontWeight, 'bold');
    isItalic = strcmp(fontStyle, 'italic');
    isNormal = and(not(isBold), not(isItalic));
    % 29 30
    styleMenu = findall(menu, 'Tag', 'ScribeAxistextObjStyleMenu');
    submenus = allchild(styleMenu);
    % 32 36
    % 33 36
    % 34 36
    % 35 36
    checks = vertcat(cellhorzcat(checked{plus(isBold, 1.0)}), cellhorzcat(checked{plus(isItalic, 1.0)}), cellhorzcat(checked{plus(isNormal, 1.0)}));
    % 37 42
    % 38 42
    % 39 42
    % 40 42
    % 41 42
    set(submenus, {'Checked'}, checks);
end % function
