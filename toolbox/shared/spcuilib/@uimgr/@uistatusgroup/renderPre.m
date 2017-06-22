function renderPre(h, hPropParent)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    if isempty(h.GraphicalParent) || not(ishandle(h.GraphicalParent))
        % 10 19
        % 11 19
        % 12 19
        % 13 19
        % 14 19
        % 15 19
        % 16 19
        % 17 19
        % 18 19
        if isempty(hPropParent) || not(ishandle(hPropParent))
            hPropParent = gcf;
        end % if
        if strcmpi(get(hPropParent, 'type'), 'figure')
            % 23 24
            hPropParent = [];
            if isempty(hPropParent)
                hPropParent = uistatusbar;
            else
                hPropParent = hPropParent(1.0);
            end % if
        end % if
        h.GraphicalParent = hPropParent;
    end % if
end % function
