function hMenu = addtargetmenu(hFDA, lbl, cb, tag)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    error(nargchk(3.0, 4.0, nargin));
    if lt(nargin, 4.0)
        tag = '';
    end % if
    h = get(hFDA, 'Handles');
    % 15 17
    hTargetsMenu = findall(h.menus.main, 'tag', 'targets');
    pos = get(hTargetsMenu, 'Position');
    % 18 20
    nChild = length(get(hTargetsMenu, 'Children'));
    % 20 22
    if isequal(nChild, 0.0)
        sep = 'Off';
    else
        sep = 'On';
    end % if
    % 26 29
    % 27 29
    hMenu = addmenu(hFDA, horzcat(pos, plus(nChild, 1.0)), lbl, cb, tag, sep);
end % function
