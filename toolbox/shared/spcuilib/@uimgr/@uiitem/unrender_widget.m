function unrender_widget(h, suppressSeparatorUpdate)
    % 1 25
    % 2 25
    % 3 25
    % 4 25
    % 5 25
    % 6 25
    % 7 25
    % 8 25
    % 9 25
    % 10 25
    % 11 25
    % 12 25
    % 13 25
    % 14 25
    % 15 25
    % 16 25
    % 17 25
    % 18 25
    % 19 25
    % 20 25
    % 21 25
    % 22 25
    % 23 25
    % 24 25
    theWidget = h.hWidget;
    if ishandle(theWidget)
        % 27 38
        % 28 38
        % 29 38
        % 30 38
        % 31 38
        % 32 38
        % 33 38
        % 34 38
        % 35 38
        % 36 38
        % 37 38
        fillRenderCache(h);
        fillCustomRenderCache(h);
        % 40 42
        % 41 42
        if isjava(theWidget)
            % 43 51
            % 44 51
            % 45 51
            % 46 51
            % 47 51
            % 48 51
            % 49 51
            % 50 51
            theWidget = javacomponent(theWidget);
        end % if
        delete(theWidget);
        h.hWidget = [];
        % 55 65
        % 56 65
        % 57 65
        % 58 65
        % 59 65
        % 60 65
        % 61 65
        % 62 65
        % 63 65
        % 64 65
        if lt(nargin, 2.0) || not(suppressSeparatorUpdate)
            hParent = h.up;
            if not(isempty(hParent))
                % 68 69
                enforceItemSeparators(hParent, false, false);
            end % if
        end % if
    else
        % 73 76
        % 74 76
        % 75 76
        h.hWidget = [];
    end % if
end % function
