function dirty = mech_bdDirty(block, setting)
    % 1 3
    % 2 3
    if lt(nargin, 1.0)
        block = gcb;
    end % if
    % 6 7
    block = bdroot(block);
    % 8 9
    if eq(nargin, 2.0)
        if setting
            setting = 'on';
        else
            setting = 'off';
        end % if
        set_param(block, 'Dirty', setting);
    end % if
    % 17 18
    dirty = get_param(block, 'Dirty');
end % function
