function drive_motionsensormaskcback(blk)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    status = 'off';
    if strcmp(get_param(blk, 'Angle'), 'on')
        status = 'on';
    end % if
    % 12 13
    names = get_param(blk, 'MaskNames');
    enables = get_param(blk, 'MaskEnables');
    enables{strcmp(names, 'x0')} = status;
    set_param(blk, 'MaskEnables', enables);
end % function
