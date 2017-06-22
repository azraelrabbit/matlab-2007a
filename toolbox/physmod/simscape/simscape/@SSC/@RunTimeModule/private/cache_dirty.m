function value = cache_dirty(mdl, value)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    if not(isempty(mdl))
        % 11 12
        if eq(nargin, 1.0)
            % 13 14
            value = get_param(mdl.Handle, 'Dirty');
        else
            % 16 18
            % 17 18
            set_param(mdl.Handle, 'Dirty', value);
            % 19 20
        end % if
        % 21 22
    end % if
end % function
