function showtree(h)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    fprintf('Object "%s" of class "%s"\n', h.Name, class(h));
    displayEntry(h, 1.0);
end % function
function displayEntry(hParent, level)
    % 12 14
    % 13 14
    hChild = hParent.down;
    i = 1.0;
        while not(isempty(hChild))
        printGroupInfoString(hChild, level, i);
        if hChild.isGroup
            displayEntry(hChild, plus(level, 1.0));
        end % if
        hChild = hChild.right;
        i = plus(i, 1.0);
    end % while
end % function
