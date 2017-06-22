function h = removeBody(h, idx)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    if ishandle(h.Bodies{idx}.ViewingTransform)
        delete(h.Bodies{idx}.ViewingTransform);
    end % if
    % 13 16
    % 14 16
    % 15 16
    h.Bodies(idx) = [];
end % function
