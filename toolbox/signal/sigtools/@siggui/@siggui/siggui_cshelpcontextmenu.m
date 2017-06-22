function siggui_cshelpcontextmenu(hObj, cshtag, toolname)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    error(nargchk(2.0, 3.0, nargin));
    % 8 10
    if isempty(cshtag)
        return;
    end % if
    if lt(nargin, 3.0)
        toolname = 'fdatool';
    end % if
    h = handles2vector(hObj);
    if isempty(h)
        return;
    end % if
    h = h(logical(isprop(h, 'UIContextMenu')));
    % 20 22
    if isempty(h)
        return;
    end % if
    hc = get(hObj, 'CSHMenu');
    if ishandle(hc)
        delete(hc);
    end % if
    hc = cshelpcontextmenu(h, cshtag, toolname);
    set(hObj, 'CSHMenu', hc);
end % function
