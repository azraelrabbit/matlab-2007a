function delete(h)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    % 11 12
    if not(isempty(h.Figure)) && ishandle(h.Figure)
        delete(h.Figure)
    end % if
    % 15 16
    if not(isempty(h.MLAnimTimer)) && isvalid(h.MLAnimTimer)
        stop(h.MLAnimTimer)
    end % if
    h.MLAnimTimer = [];
end % function
