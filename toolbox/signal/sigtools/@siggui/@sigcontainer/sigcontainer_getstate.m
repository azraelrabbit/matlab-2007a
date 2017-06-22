function s = sigcontainer_getstate(hParent)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    s = siggui_getstate(hParent);
    % 8 11
    % 9 11
    for hindx=allchild(hParent)
        field = get(hindx.classhandle, 'Name');
        s.(field) = getstate(hindx);
    end % for
end
