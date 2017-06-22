function y = fieldnames(h)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    y = {};
    for i=1.0:numel(h.prop_sets)
        y = vertcat(y, fieldnames(h.prop_sets{i}));
    end % for
end % function
