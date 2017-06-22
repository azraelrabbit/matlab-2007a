function renderPre(h, hPropParent)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if isempty(h.GraphicalParent) || not(ishandle(h.GraphicalParent))
        % 9 17
        % 10 17
        % 11 17
        % 12 17
        % 13 17
        % 14 17
        % 15 17
        % 16 17
        if isempty(hPropParent) || not(ishandle(hPropParent))
            hPropParent = gcf;
        end % if
        h.GraphicalParent = hPropParent;
    end % if
end % function
