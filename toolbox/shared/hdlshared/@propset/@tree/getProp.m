function [value, success] = getProp(h, prop)
    % 1 24
    % 2 24
    % 3 24
    % 4 24
    % 5 24
    % 6 24
    % 7 24
    % 8 24
    % 9 24
    % 10 24
    % 11 24
    % 12 24
    % 13 24
    % 14 24
    % 15 24
    % 16 24
    % 17 24
    % 18 24
    % 19 24
    % 20 24
    % 21 24
    % 22 24
    % 23 24
    if gt(nargin, 1.0)
        for i=1.0:numel(h.prop_sets)
            if h.prop_set_enables(i)
                % 27 29
                % 28 29
                [value, success] = h.prop_sets{i}.getProp(prop);
                if success
                    return;
                end % if
            end % if
        end % for
        % 35 37
        % 36 37
        value = [];
        success = false;
        % 39 40
        if lt(nargout, 2.0)
            error(h.PropErrorStr(prop));
        end % if
    else
        % 44 45
        value = {};
        for i=1.0:numel(h.prop_sets)
            if h.prop_set_enables(i)
                value = vertcat(value, getProp(h.prop_sets{i}));
            end % if
        end % for
        success = true;
    end % if
end % function
