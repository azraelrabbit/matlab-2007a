function delete(h)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    decrIndices(h);
    OptionDelete(h.up.hWidget, h.privateIndex);
    disconnect(h);
    % 12 14
    % 13 14
    h.privateIndex = -1.0;
    h.TextHandle = [];
end % function
function decrIndices(hChild)
    % 18 29
    % 19 29
    % 20 29
    % 21 29
    % 22 29
    % 23 29
    % 24 29
    % 25 29
    % 26 29
    % 27 29
    % 28 29
    hChild = hChild.right;
        while not(isempty(hChild))
        hChild.privateIndex = minus(hChild.privateIndex, 1.0);
        hChild = hChild.right;
    end % while
end % function
