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
    if gt(nargin, 1.0)
        for i=1.0:numel(h.prop_sets)
            if h.prop_set_enables(i)
                % 26 31
                % 27 31
                % 28 31
                % 29 31
                try
                    % 31 35
                    % 32 35
                    % 33 35
                    value = h.prop_sets{i}.(prop);
                    % 35 38
                    % 36 38
                    success = true;
                    return
                    % 39 41
                end % try
            end
        end % for
        % 43 46
        % 44 46
        value = [];
        success = false;
        % 47 49
        if lt(nargout, 2.0)
            error(PropErrorStr(h, prop));
        end
    else
        % 52 54
        value = {};
        for i=1.0:numel(h.prop_sets)
            if h.prop_set_enables(i)
                value = vertcat(value, fieldnames(h.prop_sets{i}));
            end
        end % for
        success = true;
    end
end
