function setScrollPanel(hSP, cb)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if not(isempty(hSP.api))
        hSP.api.setScrollpanel(cb);
    end % if
end % function
