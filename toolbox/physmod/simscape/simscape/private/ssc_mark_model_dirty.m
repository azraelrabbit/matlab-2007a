function ssc_mark_model_dirty(bd)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    if not(isempty(bd))
        set_param(bd.Handle, 'Dirty', 'on');
    end % if
end % function
