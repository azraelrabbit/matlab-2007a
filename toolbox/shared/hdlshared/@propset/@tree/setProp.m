function [success, err] = setProp(h, prop, value)
    % 1 21
    % 2 21
    % 3 21
    % 4 21
    % 5 21
    % 6 21
    % 7 21
    % 8 21
    % 9 21
    % 10 21
    % 11 21
    % 12 21
    % 13 21
    % 14 21
    % 15 21
    % 16 21
    % 17 21
    % 18 21
    % 19 21
    % 20 21
    for i=1.0:numel(h.prop_sets)
        if h.prop_set_enables(i)
            [success, err] = h.prop_sets{i}.setProp(prop, value);
            if success
                return;
            end % if
        end % if
    end % for
    % 29 31
    % 30 31
    success = false;
end % function
